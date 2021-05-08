`timescale 1ns/1ps

//Declaracion de pueros I/O
module ProyectoFinal(
	input clk
);

//Wires
wire [31:0] PC_instMem;
wire [31:0] PC_Aadd;
wire [31:0] instMem_dataPath;
wire [31:0] plusFour;
wire [31:0] currentI;
wire [31:0] newInst;

//Asignaciones
assign PC_Aadd = PC_instMem;
assign plusFour = 32'd4;
//Instancias
datapathIR datapath0(
	.instruction(instMem_dataPath),
	.currentInst(currentI),
	.programCounter(newInst)
);

InstMem InstMem0(
	.address(PC_instMem),
	.inst(instMem_dataPath)
);

PC PC0(
	.Clk(clk),
	.i_pc(newInst),
	.o_pc(PC_instMem)
);

Add Add_PC(
	.A(PC_Aadd),
	.B(plusFour),
	.O(currentI)
);

endmodule 