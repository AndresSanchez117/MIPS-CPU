`timescale 1ns/1ps

//Generacion de puertos I/O
module extSig(
	input [15:0] i_inm,
	output reg [31:0] o_extSig
);

always @(*)
	begin
		case(i_inm[15])
			1'b0:
				begin
					o_extSig = {16'b0000000000000000,i_inm};
				end
			1'b1:
				begin
					o_extSig = {16'b1111111111111111,i_inm};
				end
		endcase
	end

endmodule 