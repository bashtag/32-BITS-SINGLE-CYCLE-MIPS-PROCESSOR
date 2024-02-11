module alu_32_bit(
	input CLK,
	input reset,
	output [31:0] result,
	input [31:0] a, b,
	input [2:0] ALUop
);
	wire temp_16_out, overflow, slt, c_in;
	wire [31:0] temp_result, mod_result;
	
	mux_2x1_is_subtract mux0(
		.is_subtract(c_in),
		.ALUop(ALUop)
	);

	cla_16_bit cla0(
		.result(temp_result[15:0]),
		.c_out(temp_16_out),
		.c_in(c_in),
		.a(a[15:0]),
		.b(b[15:0]),
		.ALUop(ALUop)
	);

	cla_16_bit_msb cla1(
		.result(temp_result[31:16]),
		.overflow(overflow),
		.slt(slt),
		.c_in(temp_16_out),
		.a(a[31:16]),
		.b(b[31:16]),
		.ALUop(ALUop)
	);
	
	mod mod0(
		.CLK(CLK),
		.reset(reset),
		.a(a),
		.b(b),
		.result(mod_result)
	);
	
	mux_3x1_results mux1(
		.out_result(result),
		.slt(slt),
		.cla_result(temp_result),
		.mod_result(mod_result),
		.ALUop(ALUop)
	);

endmodule