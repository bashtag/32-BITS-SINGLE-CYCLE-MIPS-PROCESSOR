module mux_3x1_alu_1_bit_res(
	output mux_result,
	input [2:0] results,
	input [2:0] ALUop
);
	wire is_and_or_or;
		
	wire [2:0] selects;
		
	and and0(is_and_or_or, !ALUop[2], !ALUop[1]);
	
	// is and
	and and2(selects[0], is_and_or_or, !ALUop[0], results[0]);

	// is or
	and and3(selects[1], is_and_or_or, ALUop[0], results[1]);
	
	// is add
	and and6(selects[2], ALUop[2], results[2]);
	
	or or0(mux_result,
		selects[0],
		selects[1],
		selects[2]
		);

endmodule