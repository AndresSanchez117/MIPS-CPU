`timescale 1ns/1ps

//Generacion de puertos I/O
module RF(
	input We,
	input [4:0]AR1,
	input [4:0]AR2,
	input [4:0]WA,
	input [31:0]DW,
	output reg [31:0]DR1,
	output reg [31:0]DR2
);

reg [31:0] rf [31:0];

initial begin
	rf[0] = 32'd0;
	rf[1] = 32'd0;
	rf[2] = 32'd0;
	rf[3] = 32'd0;
	rf[10] = 32'd0; //Acumulator
//	rf[29] = 32'd50; //Stack Pointer
end

always @(*)
	begin
		case(We)
			1'b1:
				begin
					rf[WA] = DW;
				end
		endcase
		
		DR1 = rf[AR1];
		DR2 = rf[AR2];
	end

endmodule 