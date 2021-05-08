`timescale 1ns/1ps

//Generacion de puertos I/O
module Add(
	input [31:0] A,
	input [31:0] B,
	output reg [31:0] O
);

//Wires
//Asignaciones
//Bloques always
always @(*)
	begin
		begin
			O = A + B;
		end
	end
//Instancias

endmodule 