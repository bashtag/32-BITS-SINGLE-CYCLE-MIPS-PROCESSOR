module mux_2x1_results(
	output [31:0] out_result,
	input slt,
	input [31:0] cla_result,
	input [2:0] ALUop
);
	wire is_slt;
	wire [1:0] select;
	
	// is operation set less than
	and and_is_slt(is_slt, ALUop[2], !ALUop[1], !ALUop[0]);
	
	// bits
	and and0(select[0], is_slt, slt);
	and and1(select[1], !is_slt, cla_result[0]);
	or or0(out_result[0], select[0], select[1]);
	
	and and2(out_result[1], !is_slt, cla_result[1]);
	and and3(out_result[2], !is_slt, cla_result[2]);
	and and4(out_result[3], !is_slt, cla_result[3]);
	and and5(out_result[4], !is_slt, cla_result[4]);
	and and6(out_result[5], !is_slt, cla_result[5]);
	and and7(out_result[6], !is_slt, cla_result[6]);
	and and8(out_result[7], !is_slt, cla_result[7]);
	and and9(out_result[8], !is_slt, cla_result[8]);
	and and10(out_result[9], !is_slt, cla_result[9]);
	and and11(out_result[10], !is_slt, cla_result[10]);
	and and12(out_result[11], !is_slt, cla_result[11]);
	and and13(out_result[12], !is_slt, cla_result[12]);
	and and14(out_result[13], !is_slt, cla_result[13]);
	and and15(out_result[14], !is_slt, cla_result[14]);
	and and16(out_result[15], !is_slt, cla_result[15]);
	and and17(out_result[16], !is_slt, cla_result[16]);
	and and18(out_result[17], !is_slt, cla_result[17]);
	and and19(out_result[18], !is_slt, cla_result[18]);
	and and20(out_result[19], !is_slt, cla_result[19]);
	and and21(out_result[20], !is_slt, cla_result[20]);
	and and22(out_result[21], !is_slt, cla_result[21]);
	and and23(out_result[22], !is_slt, cla_result[22]);
	and and24(out_result[23], !is_slt, cla_result[23]);
	and and25(out_result[24], !is_slt, cla_result[24]);
	and and26(out_result[25], !is_slt, cla_result[25]);
	and and27(out_result[26], !is_slt, cla_result[26]);
	and and28(out_result[27], !is_slt, cla_result[27]);
	and and29(out_result[28], !is_slt, cla_result[28]);
	and and30(out_result[29], !is_slt, cla_result[29]);
	and and31(out_result[30], !is_slt, cla_result[30]);
	and and32(out_result[31], !is_slt, cla_result[31]);

endmodule
