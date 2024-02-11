module sign_extend (
	output [31:0] sign_ext_imm,
	input [15:0] imm
);

	buf buf0(sign_ext_imm[31], imm[15]);
	buf buf1(sign_ext_imm[30], 1'b0);
	buf buf2(sign_ext_imm[29], 1'b0);
	buf buf3(sign_ext_imm[28], 1'b0);
	buf buf4(sign_ext_imm[27], 1'b0);
	buf buf5(sign_ext_imm[26], 1'b0);
	buf buf6(sign_ext_imm[25], 1'b0);
	buf buf7(sign_ext_imm[24], 1'b0);
	buf buf8(sign_ext_imm[23], 1'b0);
	buf buf9(sign_ext_imm[22], 1'b0);
	buf buf10(sign_ext_imm[21], 1'b0);
	buf buf11(sign_ext_imm[20], 1'b0);
	buf buf12(sign_ext_imm[19], 1'b0);
	buf buf13(sign_ext_imm[18], 1'b0);
	buf buf14(sign_ext_imm[17], 1'b0);
	buf buf15(sign_ext_imm[16], 1'b0);
	buf buf16(sign_ext_imm[15], 1'b0);
	buf buf17(sign_ext_imm[14], imm[14]);
	buf buf18(sign_ext_imm[13], imm[13]);
	buf buf19(sign_ext_imm[12], imm[12]);
	buf buf20(sign_ext_imm[11], imm[11]);
	buf buf21(sign_ext_imm[10], imm[10]);
	buf buf22(sign_ext_imm[9], imm[9]);
	buf buf23(sign_ext_imm[8], imm[8]);
	buf buf24(sign_ext_imm[7], imm[7]);
	buf buf25(sign_ext_imm[6], imm[6]);
	buf buf26(sign_ext_imm[5], imm[5]);
	buf buf27(sign_ext_imm[4], imm[4]);
	buf buf28(sign_ext_imm[3], imm[3]);
	buf buf29(sign_ext_imm[2], imm[2]);
	buf buf30(sign_ext_imm[1], imm[1]);
	buf buf31(sign_ext_imm[0], imm[0]);

endmodule
