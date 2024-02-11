module alu_control (
	output [2:0] alu_ctr,
	input [5:0] function_code,
	input [2:0] ALUop
);
	wire [2:0] func_alu_ctr;

	mux_5_to_1_define_alu_ctr_func mux1(
		.alu_ctr(func_alu_ctr),
		.func_code(function_code)
	);

	mux_2_to_1_alu_ctr_select mux0(
		.alu_ctr(alu_ctr),
		.func_3_bit(func_alu_ctr),
		.ALUop(ALUop)
	);

endmodule
