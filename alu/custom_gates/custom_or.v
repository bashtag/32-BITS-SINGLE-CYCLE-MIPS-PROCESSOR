module custom_or(
	output result,
	input a, b
);
	wire not_a, not_b;
	
	not not0(not_a, a);
	not not1(not_b, b);
	nand nand0(result, not_a, not_b);

endmodule