`timescale 1ns/1ps

//Generacion de puertos I/O
module CU(
	input [5:0] i_op,
	output reg [2:0] o_AC,
	output reg o_regWe,
	output reg o_memWe,
	output reg o_memRe,
	output reg o_MUXsel,
	output reg o_MUXtoALUB,
	output reg o_MUXtoAW,
	output reg o_branch,
	output reg o_jump
);

//wires
//Asignaciones
//Bloques always
always @(*)
	begin
		case(i_op)
			//R-type
			6'b000000:
				begin
					o_AC = 3'b000;
					o_regWe = 1'b1;
					o_memWe = 1'b0;
					o_memRe = 1'b0;
					o_MUXsel = 1'b1;
					o_MUXtoALUB = 1'b1;
					o_MUXtoAW = 1'b1;
					o_branch = 1'b0;
					o_jump = 1'b0;
				end
			//SW
			6'b101011:
				begin
					o_AC = 3'b001;
					o_regWe = 1'b0;
					o_MUXsel = 1'b0;
					o_MUXtoAW = 1'b0;
					o_MUXtoALUB = 1'b0;
					o_memRe = 1'b0;
					#0.5;
					o_memWe = 1'b1;
					o_branch = 1'b0;
					o_jump = 1'b0;
				end
			//LW
			6'b100011:
				begin
					o_AC = 3'b001;
					o_regWe = 1'b1;
					o_memWe = 1'b0;
					o_memRe = 1'b1;
					o_MUXsel = 1'b0;
					o_MUXtoALUB = 1'b0;
					o_MUXtoAW = 1'b0;
					o_branch = 1'b0;
					o_jump = 1'b0;
				end
			//ADDI
			6'b001000:
				begin
					o_AC = 3'b001;
					o_regWe = 1'b1;
					o_memWe = 1'b0;
					o_memRe = 1'b0;
					o_MUXsel = 1'b1;
					o_MUXtoALUB = 1'b0;
					o_MUXtoAW = 1'b0;
					o_branch = 1'b0;
					o_jump = 1'b0;
				end
			//ANDI
			6'b001100:
				begin
					o_AC = 3'b100;
					o_regWe = 1'b1;
					o_memWe = 1'b0;
					o_memRe = 1'b0;
					o_MUXsel = 1'b1;
					o_MUXtoALUB = 1'b0;
					o_MUXtoAW = 1'b0;
					o_branch = 1'b0;
					o_jump = 1'b0;
				end
			//ORI
			6'b001101:
				begin
					o_AC = 3'b011;
					o_regWe = 1'b1;
					o_memWe = 1'b0;
					o_memRe = 1'b0;
					o_MUXsel = 1'b1;
					o_MUXtoALUB = 1'b0;
					o_MUXtoAW = 1'b0;
					o_branch = 1'b0;
					o_jump = 1'b0;
				end
			//BEQ
			6'b000100:
				begin
					o_AC = 3'b010;
					o_regWe = 1'b0;
					o_memWe = 1'b0;
					o_memRe = 1'b0;
					o_MUXsel = 1'b0;
					o_MUXtoALUB = 1'b1;
					o_MUXtoAW = 1'b1;
					o_branch = 1'b1;
					o_jump = 1'b0;
				end
			//J
			6'b000010:
				begin
					o_AC = 3'b000;
					o_regWe = 1'b0;
					o_memWe = 1'b0;
					o_memRe = 1'b0;
					o_MUXsel = 1'b0;
					o_MUXtoALUB = 1'b1;
					o_MUXtoAW = 1'b1;
					o_branch = 1'b0;
					o_jump = 1'b1;
				end
		endcase
	end

//Instancias

endmodule 