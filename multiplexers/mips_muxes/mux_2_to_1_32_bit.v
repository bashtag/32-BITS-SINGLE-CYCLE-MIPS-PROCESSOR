module mux_2_to_1_32_bit(
	output [31:0] output_reg,
	input [31:0] first_input, // if the signal is one
	input [31:0] second_input, // if the signal is zero
	input signal
);
	wire [31:0] select [1:0];

	and and0(select[0][0], signal, first_input[0]);
	and and1(select[1][0], !signal, second_input[0]);
	or or0(output_reg[0], select[0][0], select[1][0]);

	and and2(select[0][1], signal, first_input[1]);
	and and3(select[1][1], !signal, second_input[1]);
	or or1(output_reg[1], select[0][1], select[1][1]);

	and and4(select[0][2], signal, first_input[2]);
	and and5(select[1][2], !signal, second_input[2]);
	or or2(output_reg[2], select[0][2], select[1][2]);

	and and6(select[0][3], signal, first_input[3]);
	and and7(select[1][3], !signal, second_input[3]);
	or or3(output_reg[3], select[0][3], select[1][3]);

	and and8(select[0][4], signal, first_input[4]);
	and and9(select[1][4], !signal, second_input[4]);
	or or4(output_reg[4], select[0][4], select[1][4]);

	and and10(select[0][5], signal, first_input[5]);
	and and11(select[1][5], !signal, second_input[5]);
	or or5(output_reg[5], select[0][5], select[1][5]);

	and and12(select[0][6], signal, first_input[6]);
	and and13(select[1][6], !signal, second_input[6]);
	or or6(output_reg[6], select[0][6], select[1][6]);

	and and14(select[0][7], signal, first_input[7]);
	and and15(select[1][7], !signal, second_input[7]);
	or or7(output_reg[7], select[0][7], select[1][7]);

	and and16(select[0][8], signal, first_input[8]);
	and and17(select[1][8], !signal, second_input[8]);
	or or8(output_reg[8], select[0][8], select[1][8]);

	and and18(select[0][9], signal, first_input[9]);
	and and19(select[1][9], !signal, second_input[9]);
	or or9(output_reg[9], select[0][9], select[1][9]);

	and and20(select[0][10], signal, first_input[10]);
	and and21(select[1][10], !signal, second_input[10]);
	or or10(output_reg[10], select[0][10], select[1][10]);

	and and22(select[0][11], signal, first_input[11]);
	and and23(select[1][11], !signal, second_input[11]);
	or or11(output_reg[11], select[0][11], select[1][11]);

	and and24(select[0][12], signal, first_input[12]);
	and and25(select[1][12], !signal, second_input[12]);
	or or12(output_reg[12], select[0][12], select[1][12]);

	and and26(select[0][13], signal, first_input[13]);
	and and27(select[1][13], !signal, second_input[13]);
	or or13(output_reg[13], select[0][13], select[1][13]);

	and and28(select[0][14], signal, first_input[14]);
	and and29(select[1][14], !signal, second_input[14]);
	or or14(output_reg[14], select[0][14], select[1][14]);

	and and30(select[0][15], signal, first_input[15]);
	and and31(select[1][15], !signal, second_input[15]);
	or or15(output_reg[15], select[0][15], select[1][15]);

	and and32(select[0][16], signal, first_input[16]);
	and and33(select[1][16], !signal, second_input[16]);
	or or16(output_reg[16], select[0][16], select[1][16]);

	and and34(select[0][17], signal, first_input[17]);
	and and35(select[1][17], !signal, second_input[17]);
	or or17(output_reg[17], select[0][17], select[1][17]);

	and and36(select[0][18], signal, first_input[18]);
	and and37(select[1][18], !signal, second_input[18]);
	or or18(output_reg[18], select[0][18], select[1][18]);

	and and38(select[0][19], signal, first_input[19]);
	and and39(select[1][19], !signal, second_input[19]);
	or or19(output_reg[19], select[0][19], select[1][19]);

	and and40(select[0][20], signal, first_input[20]);
	and and41(select[1][20], !signal, second_input[20]);
	or or20(output_reg[20], select[0][20], select[1][20]);

	and and42(select[0][21], signal, first_input[21]);
	and and43(select[1][21], !signal, second_input[21]);
	or or21(output_reg[21], select[0][21], select[1][21]);

	and and44(select[0][22], signal, first_input[22]);
	and and45(select[1][22], !signal, second_input[22]);
	or or22(output_reg[22], select[0][22], select[1][22]);

	and and46(select[0][23], signal, first_input[23]);
	and and47(select[1][23], !signal, second_input[23]);
	or or23(output_reg[23], select[0][23], select[1][23]);

	and and48(select[0][24], signal, first_input[24]);
	and and49(select[1][24], !signal, second_input[24]);
	or or24(output_reg[24], select[0][24], select[1][24]);

	and and50(select[0][25], signal, first_input[25]);
	and and51(select[1][25], !signal, second_input[25]);
	or or25(output_reg[25], select[0][25], select[1][25]);

	and and52(select[0][26], signal, first_input[26]);
	and and53(select[1][26], !signal, second_input[26]);
	or or26(output_reg[26], select[0][26], select[1][26]);

	and and54(select[0][27], signal, first_input[27]);
	and and55(select[1][27], !signal, second_input[27]);
	or or27(output_reg[27], select[0][27], select[1][27]);

	and and56(select[0][28], signal, first_input[28]);
	and and57(select[1][28], !signal, second_input[28]);
	or or28(output_reg[28], select[0][28], select[1][28]);

	and and58(select[0][29], signal, first_input[29]);
	and and59(select[1][29], !signal, second_input[29]);
	or or29(output_reg[29], select[0][29], select[1][29]);

	and and60(select[0][30], signal, first_input[30]);
	and and61(select[1][30], !signal, second_input[30]);
	or or30(output_reg[30], select[0][30], select[1][30]);

	and and62(select[0][31], signal, first_input[31]);
	and and63(select[1][31], !signal, second_input[31]);
	or or31(output_reg[31], select[0][31], select[1][31]);

endmodule
