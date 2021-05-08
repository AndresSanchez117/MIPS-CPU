`timescale 1ns/1ps

module ALUControl(
	input [2:0] i_Acontrol,
	input [5:0] i_fn,
	output reg [3:0] o_Acontrol
);

always @(*)
	begin
		case(i_Acontrol)
			3'b000:
				begin
					case(i_fn)
						//ADD
						6'b100000:
							begin
								o_Acontrol = 4'b0000;
							end
						//SUB
						6'b100010:
							begin
								o_Acontrol = 4'b0001;
							end
						//MUL
						6'b011000:
							begin
								o_Acontrol = 4'b0010;
							end
						//DIV
						6'b011010:
							begin
								o_Acontrol = 4'b0011;
							end
						//AND
						6'b100100:
							begin
								o_Acontrol = 4'b0100;
							end
						//OR
						6'b100101:
							begin
								o_Acontrol = 4'b0101;
							end
						//XOR
						6'b100110:
							begin
								o_Acontrol = 4'b0110;
							end
						//NOR
						6'b100111:
							begin
								o_Acontrol = 4'b0111;
							end
						//SLT(Set if Less Than)
						6'b101010:
							begin
								o_Acontrol = 4'b1000;
							end
					endcase
				end
			//Sumar
			3'b001:
				begin
					o_Acontrol = 4'b0000;
				end
			//Restar
			3'b010:
				begin
					o_Acontrol = 4'b0001;
				end
			//AND
			3'b100:
				begin
					o_Acontrol = 4'b0100;
				end
			//OR
			3'b011:
				begin
					o_Acontrol = 4'b0101;
				end
		endcase
	end

endmodule 