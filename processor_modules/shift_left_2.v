module shift_left_2 (
	output [31:0] shifted_address,
	input [31:0] address
);

	buf buf0(shifted_address[31], address[29]);
	buf buf1(shifted_address[30], address[28]);
	buf buf2(shifted_address[29], address[27]);
	buf buf3(shifted_address[28], address[26]);
	buf buf4(shifted_address[27], address[25]);
	buf buf5(shifted_address[26], address[24]);
	buf buf6(shifted_address[25], address[23]);
	buf buf7(shifted_address[24], address[22]);
	buf buf8(shifted_address[23], address[21]);
	buf buf9(shifted_address[22], address[20]);
	buf buf10(shifted_address[21], address[19]);
	buf buf11(shifted_address[20], address[18]);
	buf buf12(shifted_address[19], address[17]);
	buf buf13(shifted_address[18], address[16]);
	buf buf14(shifted_address[17], address[15]);
	buf buf15(shifted_address[16], address[14]);
	buf buf16(shifted_address[15], address[13]);
	buf buf17(shifted_address[14], address[12]);
	buf buf18(shifted_address[13], address[11]);
	buf buf19(shifted_address[12], address[10]);
	buf buf20(shifted_address[11], address[9]);
	buf buf21(shifted_address[10], address[8]);
	buf buf22(shifted_address[9], address[7]);
	buf buf23(shifted_address[8], address[6]);
	buf buf24(shifted_address[7], address[5]);
	buf buf25(shifted_address[6], address[4]);
	buf buf26(shifted_address[5], address[3]);
	buf buf27(shifted_address[4], address[2]);
	buf buf28(shifted_address[3], address[1]);
	buf buf29(shifted_address[2], address[0]);
	buf buf30(shifted_address[1], 1'b0);
	buf buf31(shifted_address[0], 1'b0);

endmodule
