`timescale 1ns/1ps

//Generacion de puertos I\O
module MemA(
	input We,
	input Re,
	input [31:0]address,
	input [31:0]dataWrite,
	output reg [31:0]data
);

reg [31:0] memA [0:127];

always @(*)
	begin
		case(We)
			1'b1:
				begin
					memA[address] = dataWrite;
				end
//			1'b0:
//				begin
//					data = memA[address];
//				end
		endcase
		case(Re)
			1'b1:
				begin
					data = memA[address];
				end
//			1'b0:
//				begin
//					memA[address] = dataWrite;
//				end
		endcase
	end

endmodule 