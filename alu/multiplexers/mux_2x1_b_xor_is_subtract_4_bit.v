module mux_2x1_b_xor_is_subtract_4_bit(
	output [3:0] result,
	input [3:0] b_initial,
	input [2:0] ALUop
);
	wire is_subtraction;
	
	mux_2x1_is_subtract mux0(
		.is_subtract(is_subtraction),
		.ALUop(ALUop)
	);
	
	custom_xor xor0(
		.result(result[0]),
		.a(b_initial[0]),
		.b(is_subtraction)
	);

	custom_xor xor1(
		.result(result[1]),
		.a(b_initial[1]),
		.b(is_subtraction)
	);

	custom_xor xor2(
		.result(result[2]),
		.a(b_initial[2]),
		.b(is_subtraction)
	);

	custom_xor xor3(
		.result(result[3]),
		.a(b_initial[3]),
		.b(is_subtraction)
	);

endmodule