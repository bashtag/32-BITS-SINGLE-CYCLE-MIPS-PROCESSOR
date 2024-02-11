module mux_2x1_is_subtract(
	output is_subtract,
	input [2:0]ALUop
);

	wire is_addition;
	
	and and0(is_addition, !ALUop[1], ALUop[0]);
	and and1(is_subtract, ALUop[2], !is_addition);

endmodule