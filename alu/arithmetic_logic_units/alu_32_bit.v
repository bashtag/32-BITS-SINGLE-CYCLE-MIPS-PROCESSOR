module alu_32_bit(
	output [31:0] result,
	output zero_bit,
	input [31:0] alu_src1, alu_src2,
	input [2:0] alu_ctr
);
	wire temp_16_out, overflow, slt, c_in;
	wire [31:0] temp_result;
	
	mux_2x1_is_subtract mux0(
		.is_subtract(c_in),
		.ALUop(alu_ctr)
	);

	cla_16_bit cla0(
		.result(temp_result[15:0]),
		.c_out(temp_16_out),
		.c_in(c_in),
		.a(alu_src1[15:0]),
		.b(alu_src2[15:0]),
		.ALUop(alu_ctr)
	);

	cla_16_bit_msb cla1(
		.result(temp_result[31:16]),
		.overflow(overflow),
		.slt(slt),
		.c_in(temp_16_out),
		.a(alu_src1[31:16]),
		.b(alu_src2[31:16]),
		.ALUop(alu_ctr)
	);
	
	mux_2x1_results mux1(
		.out_result(result),
		.slt(slt),
		.cla_result(temp_result),
		.ALUop(alu_ctr)
	);
	
	zero_detection zero_detect(
		.result(result),
		.zero_bit(zero_bit)
	);

endmodule