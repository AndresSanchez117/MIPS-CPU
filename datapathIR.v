`timescale 1ns/1ps

//Generacion de puertos I/O
module datapathIR(
	input [31:0] instruction,
	input [31:0] currentInst,
	output [31:0] programCounter
);

//wires
	//Instruction to Register File
	wire [4:0] Rs_AR1;
	wire [4:0] Rt_AR2;
	wire [4:0] Rd_WA;
	
	//Instruction to Control Unit
	wire [5:0] Op_CU;
	
	//Instruction to ALU Control
	wire [5:0] fn_Acontrol;
	
	//Register File to ALU
	wire [31:0] DR1_AALU;
	
	//Register File to MUXtoALUB
	wire [31:0] DR2_MUXtoALUB;
	
	//MUXtoALUB to ALU
	wire [31:0] MUXtoALUB_BALU;
	
	//MUXtoAW to AW
	wire [4:0] MUXtoAW_AW;
	
	//ALU to Memory
	wire [31:0] OALU_dataWmem;
	
	//Register File to Memory
	wire [31:0] DR2_indexMem;
	
	//Memory to MUX
	wire [31:0] dataMem_XMUX;
	
	//ALU to MUX
	wire [31:0] OALU_YMUX;
	
	//MUX Memory or ALU to RF DW
	wire [31:0] oMUX1_DW;
	
	//ALU Control to ALU
	wire [3:0] oAcontrol_ALUSel;
	
	//Inmediate to Ext.Sig
	wire [15:0] inm_extSig;
	
	//Ext.Sig to MuxExt.Sig or DR2
	wire [31:0] extSig_muxSig;
	
	//Ext.Sig to Shift Left
	wire [31:0] extSig_shiftL;
	
	//Shift Left to Adder Branch
	wire [31:0] shiftL_AddB;
	
	//Adder Branch to MuxPC
	wire [31:0] AddB_muxPC;
	
	//AddPC to muxPC
	wire [31:0] AddPC_muxPC;
	
	//Jump offset
	wire [25:0] jumpOffset;
	wire [3:0] pcToJump;
	wire [31:0] jumpAddress;
	wire [27:0] shiftToJump;
	
	//PCMUX selector
	wire muxPCsel;
	wire zfValue;
	wire branchControl;
	wire [31:0] oMuxPC1_oMuxPC2;
	
	//Control Unit Outputs
	wire CU_We;
	wire [2:0] CU_iAcontrol;
	wire CU_WeMem;
	wire CU_ReMem;
	wire CU_MUXSel;
	wire CU_MUXtoAW;
	wire CU_MUXtoALUB;
	wire CU_jump;

//Asignaciones
	assign Op_CU = instruction[31:26];
	assign Rs_AR1 = instruction[25:21];
	assign Rt_AR2 = instruction[20:16];
	assign Rd_WA = instruction[15:11];
	assign fn_Acontrol = instruction[5:0];
	assign inm_extSig = instruction[15:0];
	assign jumpOffset = instruction[25:0];
	assign DR2_indexMem = DR2_MUXtoALUB;
	assign OALU_YMUX = OALU_dataWmem;
	assign extSig_shiftL = extSig_muxSig;
	assign AddPC_muxPC = currentInst;
	assign muxPCsel = zfValue & branchControl;
	assign pcToJump = currentInst[31:28];
	assign jumpAddress = {pcToJump,shiftToJump};
	
//Instancias
	CU CU0(
		.i_op(Op_CU),
		.o_AC(CU_iAcontrol),
		.o_regWe(CU_We),
		.o_memWe(CU_WeMem),
		.o_memRe(CU_ReMem),
		.o_MUXsel(CU_MUXSel),
		.o_MUXtoALUB(CU_MUXtoALUB),
		.o_MUXtoAW(CU_MUXtoAW),
		.o_branch(branchControl),
		.o_jump(CU_jump)
	);

	RF RF0(
		.We(CU_We),
		.AR1(Rs_AR1),
		.AR2(Rt_AR2),
		.WA(MUXtoAW_AW),
		.DW(oMUX1_DW),
		.DR1(DR1_AALU),
		.DR2(DR2_MUXtoALUB)
	);
	
	ALUControl AC0(
		.i_Acontrol(CU_iAcontrol),
		.i_fn(fn_Acontrol),
		.o_Acontrol(oAcontrol_ALUSel)
	);
	
	ALU ALU0(
		.A_ALU(DR1_AALU),
		.B_ALU(MUXtoALUB_BALU),
		.sel_ALU(oAcontrol_ALUSel),
		.O_ALU(OALU_dataWmem),
		.zf(zfValue)
	);
	
	MemA MemData(
		.We(CU_WeMem),
		.Re(CU_ReMem),
		.address(OALU_dataWmem),
		.dataWrite(DR2_indexMem),
		.data(dataMem_XMUX)
	);
	
	MUX2to1 memOrAlu(
		.MUX_sel(CU_MUXSel),
		.X(dataMem_XMUX),
		.Y(OALU_YMUX),
		.o_MUX(oMUX1_DW)
	);
	
	MUX2to1 MUXtoALUB(
		.MUX_sel(CU_MUXtoALUB),
		.X(extSig_muxSig),
		.Y(DR2_MUXtoALUB),
		.o_MUX(MUXtoALUB_BALU)
	);
	
	MUX2to1 MuxtoPC(
		.MUX_sel(muxPCsel),
		.X(AddPC_muxPC),
		.Y(AddB_muxPC),
		.o_MUX(oMuxPC1_oMuxPC2)
	);
	
	MUX2to1 MuxtoPC2(
		.MUX_sel(CU_jump),
		.X(oMuxPC1_oMuxPC2),
		.Y(jumpAddress),
		.o_MUX(programCounter)
	);
	
	MUX2to1 MUXtoAW(
		.MUX_sel(CU_MUXtoAW),
		.X(Rt_AR2),
		.Y(Rd_WA),
		.o_MUX(MUXtoAW_AW)
	);
	
	extSig extSig0(
		.i_inm(inm_extSig),
		.o_extSig(extSig_muxSig)
	);
	
	shiftLeft shift0(
		.i_shift(extSig_shiftL),
		.o_shift(shiftL_AddB)
	);
	
	shiftJump shift1(
		.i_shift(jumpOffset),
		.o_shift(shiftToJump)
	);
	
	Add AddBranch(
		.A(currentInst),
		.B(shiftL_AddB),
		.O(AddB_muxPC)
	);
	
endmodule 