`timescale 1ns/1ps

//Generacion de puertos I/O
module ALU(
	input [31:0] A_ALU,
	input [31:0] B_ALU,
	input [3:0]sel_ALU,
	output reg [31:0] O_ALU,
	output reg zf
);

//Wires
wire [31:0] c1, c2, c3, c4; 
//Asignaciones
assign c1 = A_ALU & B_ALU; 
assign c2 = A_ALU | B_ALU; 
assign c3 = A_ALU ^ B_ALU; 
assign c4 = ~(A_ALU | B_ALU);
//Bloques always
always @(*)
	begin
		case(sel_ALU)
			4'b0000:
				begin
					O_ALU = A_ALU + B_ALU;
				end
			4'b0001:
				begin
					O_ALU = A_ALU - B_ALU;
				end
			4'b0010:
				begin
					O_ALU = A_ALU * B_ALU;
				end
			4'b0011:
				begin
					O_ALU = A_ALU / B_ALU;
				end
			4'b0100:
				begin
					O_ALU = c1;
				end
			4'b0101:
				begin
					O_ALU = c2;
				end
			4'b0110:
				begin
					O_ALU = c3;
				end
			4'b0111:
				begin
					O_ALU = c4;
				end
			4'b1000:
				begin
					if(A_ALU < B_ALU)
						O_ALU = 1'b1;
					else
						O_ALU = 1'b0;
				end
		endcase
		case(O_ALU)
			32'd0:
				begin
					zf = 1'b1;
				end
		endcase
	end
//Instancias

endmodule 