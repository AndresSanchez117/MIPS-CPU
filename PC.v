`timescale 1ns/1ps

//Generacion de puertos I/O
module PC(
	input Clk,
	input [31:0]i_pc,
	output [31:0]o_pc
);

reg [31:0]pc;

initial begin
	pc = 32'd0;
end

//Wires
//Asignaciones
assign o_pc = pc;
//Bloques always
always @(posedge Clk)
	begin
		pc <= i_pc; 
	end

endmodule 