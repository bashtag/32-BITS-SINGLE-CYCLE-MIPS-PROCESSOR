module alu_1_bit(
	output result,
	input a, b, c_in,
	input [2:0]ALUop
);
	wire nand_a_b,
		overflow_detect,
		not_overflow,
		xor_or_c_in;
	wire [4:0] results;

	// and result
	and and0(results[0], a, b);
	
	// or result
	custom_or c_or0(results[1], a, b);
	
	// nor result
	not not0(results[3], results[1]);

	// *** FULL ADDER ***
	
	not not1(nand_a_b, results[0]);
	
	// xor result
	and and1(results[2], nand_a_b, results[1]);
	
	and and2(overflow_detect, results[2], c_in);
	not not2(not_overflow, overflow_detect);
	custom_or c_or2(.result(xor_or_c_in), .a(results[2]), .b(c_in));
	
	// a xor b xor c => and result
	and and3(results[4], not_overflow, xor_or_c_in);
	
	mux_5x1_alu_1_bit mux_5x1_alu_1_bit0(
		.mux_result(result),
		.results(results),
		.ALUop(ALUop)
	);
	
endmodule