`timescale 1ns/1ps

//Generacion de puertos I/O
module shiftLeft(
	input [31:0] i_shift,
	output reg [31:0] o_shift
);

always @(*)
	begin
		o_shift=i_shift<<2;
	end

endmodule 