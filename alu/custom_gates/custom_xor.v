module custom_xor(
	output result,
	input a, b
);
	wire nand_a_b, nand_nand_a_b_a, nand_nand_a_b_b;
	
	nand nand0(nand_a_b, a, b);
	nand nand1(nand_nand_a_b_a, nand_a_b, a);
	nand nand2(nand_nand_a_b_b, nand_a_b, b);
	nand nand3(result, nand_nand_a_b_a, nand_nand_a_b_b);

endmodule