module alu_1_bit(
	output result,
	input a, b, c_in,
	input [2:0]ALUop
);
	wire nand_a_b,
		overflow_detect,
		not_overflow,
		xor_or_c_in,
		res_xor;
	wire [2:0] results;

	// and result
	and and0(results[0], a, b);
	
	// or result
	custom_or c_or0(results[1], a, b);

	// *** FULL ADDER ***
	
	not not1(nand_a_b, results[0]);
	
	// xor result
	and and1(res_xor, nand_a_b, results[1]);
	
	and and2(overflow_detect, res_xor, c_in);
	not not2(not_overflow, overflow_detect);
	custom_or c_or2(.result(xor_or_c_in), .a(res_xor), .b(c_in));
	
	// a xor b xor c => and result
	and and3(results[2], not_overflow, xor_or_c_in);
	
	mux_3x1_alu_1_bit_res mux_3x1_alu_1_bit_res0(
		.mux_result(result),
		.results(results),
		.ALUop(ALUop)
	);
	
endmodule