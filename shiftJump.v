`timescale 1ns/1ps

//Generacion de puertos I/O
module shiftJump(
	input [25:0] i_shift,
	output reg [27:0] o_shift
);

always @(*)
	begin
		o_shift=i_shift<<2;
	end

endmodule 