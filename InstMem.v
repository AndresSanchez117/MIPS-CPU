`timescale 1ns/1ps

module InstMem(
	input [31:0]address,
	output reg [31:0]inst
);

reg [7:0] instMem [0:255];

initial begin
	$readmemb("C:/Users/andre/Documents/QuartusProjects/Convertidor/instructions.txt",instMem);
////ADDI $15, $0, #5434
//	instMem[0] = 8'b00100000;
//	instMem[1] = 8'b00001111;
//	instMem[2] = 8'b00010101;
//	instMem[3] = 8'b00111010;
////ADDI $16, $0, #10
//	instMem[4] = 8'b00100000;
//	instMem[5] = 8'b00010000;
//	instMem[6] = 8'b00000000;
//	instMem[7] = 8'b00001010;
////ADDI $17, $0, #17	
//	instMem[8] = 8'b00100000;
//	instMem[9] = 8'b00010001;
//	instMem[10] = 8'b00000000;
//	instMem[11] = 8'b00010001;
////ADDI $18, $0, #504	
//	instMem[12] = 8'b00100000;
//	instMem[13] = 8'b00010010;
//	instMem[14] = 8'b00000001;
//	instMem[15] = 8'b11111000;
////ADDI $20, $0, #12012	
//	instMem[16] = 8'b00100000;
//	instMem[17] = 8'b00010100;
//	instMem[18] = 8'b00101110;
//	instMem[19] = 8'b11101100;
////ADDI $21, $0, #28009	
//	instMem[20] = 8'b00100000;
//	instMem[21] = 8'b00010101;
//	instMem[22] = 8'b01101101;
//	instMem[23] = 8'b01101001;
////ADDI $22, $0, #30458	
//	instMem[24] = 8'b00100000;
//	instMem[25] = 8'b00010110;
//	instMem[26] = 8'b01110110;
//	instMem[27] = 8'b11111010;
////ADDI $23, $0, #60
//	instMem[28] = 8'b00100000;
//	instMem[29] = 8'b00010111;
//	instMem[30] = 8'b00000000;
//	instMem[31] = 8'b00111100;
////ADDI $24, $0, #30
//	instMem[32] = 8'b00100000;
//	instMem[33] = 8'b00011000;
//	instMem[34] = 8'b00000000;
//	instMem[35] = 8'b00011110;
////MUL $10, $17, $19	
//	instMem[36] = 8'b00000010;
//	instMem[37] = 8'b00101111;
//	instMem[38] = 8'b01010000;
//	instMem[39] = 8'b00011000;
////SW $10, #7	
//	instMem[40] = 8'b10101111;
//	instMem[41] = 8'b10101010;
//	instMem[42] = 8'b00000000;
//	instMem[43] = 8'b00000111;
////LW $11, #7
//	instMem[44] = 8'b10001111;
//	instMem[45] = 8'b10101011;
//	instMem[46] = 8'b00000000;
//	instMem[47] = 8'b00000111;
////ADD $10, $11, $16	
//	instMem[48] = 8'b00000010;
//	instMem[49] = 8'b00001011;
//	instMem[50] = 8'b01010000;
//	instMem[51] = 8'b00100000;
////SW $10, #9	
//	instMem[52] = 8'b10101111;
//	instMem[53] = 8'b10101010;
//	instMem[54] = 8'b00000000;
//	instMem[55] = 8'b00001001;
////LW $12, #9
//	instMem[56] = 8'b10001111;
//	instMem[57] = 8'b10101100;
//	instMem[58] = 8'b00000000;
//	instMem[59] = 8'b00001001;
////SUB $10, $23, $24	
//	instMem[60] = 8'b00000010;
//	instMem[61] = 8'b11111000;
//	instMem[62] = 8'b01010000;
//	instMem[63] = 8'b00100010;
////SW $10, #11	
//	instMem[64] = 8'b10101111;
//	instMem[65] = 8'b10101010;
//	instMem[66] = 8'b00000000;
//	instMem[67] = 8'b00001011;
////LW $13, #11
//	instMem[68] = 8'b10001111;
//	instMem[69] = 8'b10101101;
//	instMem[70] = 8'b00000000;
//	instMem[71] = 8'b00001011;
////DIV $10, $12, $13
//	instMem[72] = 8'b00000001;
//	instMem[73] = 8'b10001101;
//	instMem[74] = 8'b01010000;
//	instMem[75] = 8'b00011010;
////SW $10, #10
//	instMem[76] = 8'b10101111;
//	instMem[77] = 8'b10101010;
//	instMem[78] = 8'b00000000;
//	instMem[79] = 8'b00001010;
////ORI $10, $22, #1101010111000011
//	instMem[80] = 8'b00110110;
//	instMem[81] = 8'b11001010;
//	instMem[82] = 8'b11010101;
//	instMem[83] = 8'b11000011;
////SW $10, #-49
//	instMem[84] = 8'b10101111;
//	instMem[85] = 8'b10101010;
//	instMem[86] = 8'b11111111;
//	instMem[87] = 8'b11001111;
////ORI $10, $22, #0101100110101011	
//	instMem[88] = 8'b00110110;
//	instMem[89] = 8'b11001010;
//	instMem[90] = 8'b01011001;
//	instMem[91] = 8'b10101011;
////SW $10, #-48
//	instMem[92] = 8'b10101111;
//	instMem[93] = 8'b10101010;
//	instMem[94] = 8'b11111111;
//	instMem[95] = 8'b11010000;
////ORI $10, $22, #1011010101001010	
//	instMem[96] = 8'b00110110;
//	instMem[97] = 8'b11001010;
//	instMem[98] = 8'b10110101;
//	instMem[99] = 8'b01001010;
////SW $10, #-47
//	instMem[100] = 8'b10101111;
//	instMem[101] = 8'b10101010;
//	instMem[102] = 8'b11111111;
//	instMem[103] = 8'b11010001;
////ANDI $10, $22, #1101010111000011
//	instMem[104] = 8'b00110010;
//	instMem[105] = 8'b11001010;
//	instMem[106] = 8'b11010101;
//	instMem[107] = 8'b11000011;
////SW $10, #46
//	instMem[108] = 8'b10101111;
//	instMem[109] = 8'b10101010;
//	instMem[110] = 8'b00000000;
//	instMem[111] = 8'b00101110;
////ANDI $10, $22, #0101100110101011
//	instMem[112] = 8'b00110010;
//	instMem[113] = 8'b11001010;
//	instMem[114] = 8'b01011001;
//	instMem[115] = 8'b10101011;
////SW $10, #47
//	instMem[116] = 8'b10101111;
//	instMem[117] = 8'b10101010;
//	instMem[118] = 8'b00000000;
//	instMem[119] = 8'b00101111;
////ANDI $10, $22, #1011010101001010
//	instMem[120] = 8'b00110010;
//	instMem[121] = 8'b11001010;
//	instMem[122] = 8'b10110101;
//	instMem[123] = 8'b01001010;
////SW $10, #48
//	instMem[124] = 8'b10101111;
//	instMem[125] = 8'b10101010;
//	instMem[126] = 8'b00000000;
//	instMem[127] = 8'b00110000;
////ADD $10, $12, $13
//	instMem[128] = 8'b00000001;
//	instMem[129] = 8'b10001101;
//	instMem[130] = 8'b01010000;
//	instMem[131] = 8'b00100000;
////SW $10, #-18
//	instMem[132] = 8'b10101111;
//	instMem[133] = 8'b10101010;
//	instMem[134] = 8'b11111111;
//	instMem[135] = 8'b11101110;
////ADD $10, $18, $23
//	instMem[136] = 8'b00000010;
//	instMem[137] = 8'b01010111;
//	instMem[138] = 8'b01010000;
//	instMem[139] = 8'b00100000;
////SW $10, #-17
//	instMem[140] = 8'b10101111;
//	instMem[141] = 8'b10101010;
//	instMem[142] = 8'b11111111;
//	instMem[143] = 8'b11101111;
////SUB $10, $15, $11
//	instMem[144] = 8'b00000001;
//	instMem[145] = 8'b11101011;
//	instMem[146] = 8'b01010000;
//	instMem[147] = 8'b00100010;
////SW $10, #14($29)
//	instMem[148] = 8'b10101111;
//	instMem[149] = 8'b10101010;
//	instMem[150] = 8'b00000000;
//	instMem[151] = 8'b00001110;
////SUB $10, $21, $20
//	instMem[152] = 8'b00000010;
//	instMem[153] = 8'b10110100;
//	instMem[154] = 8'b01010000;
//	instMem[155] = 8'b00100010;
//////BEQ $13, $24, #8
////	instMem[156] = 8'b00010001;
////	instMem[157] = 8'b10111000;
////	instMem[158] = 8'b00000000;
////	instMem[159] = 8'b00001000;
////J #16
//	instMem[156] = 8'b00001000;
//	instMem[157] = 8'b00000000;
//	instMem[158] = 8'b00000000;
//	instMem[159] = 8'b00010000;
////SW $10, #15
//	instMem[160] = 8'b10101111;
//	instMem[161] = 8'b10101010;
//	instMem[162] = 8'b00000000;
//	instMem[163] = 8'b00001111;
end

always @(*)
	begin
		inst <= {instMem[address],instMem[address+1],instMem[address+2],instMem[address+3]};
	end

endmodule 