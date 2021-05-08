`timescale 1ns/1ps

module MUX2to1 (
	input MUX_sel,
	input [31:0] X,
	input [31:0] Y,
	output reg [31:0] o_MUX
);

always @(*)
	begin
		case(MUX_sel)
			1'b0:
				begin
					o_MUX <= X;
				end
			1'b1:
				begin
					o_MUX <= Y;
				end
		endcase
	end
	
endmodule 