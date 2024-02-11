module cla_4_bit(
	output [3:0] result,
	output p_out, g_out,
	input c_in,
	input [3:0] a, b_initial,
	input [2:0] ALUop
);
	wire [3:0] b, p, g;
	wire [2:0] carries;
	
	mux_2x1_b_xor_is_subtract_4_bit construct_b(
		.result(b),
		.b_initial(b_initial),
		.ALUop(ALUop)
	);
	
	or or0(p[0], a[0], b[0]);
	or or1(p[1], a[1], b[1]);
	or or2(p[2], a[2], b[2]);
	or or3(p[3], a[3], b[3]);
	
	and and0(g[0], a[0], b[0]);
	and and1(g[1], a[1], b[1]);
	and and2(g[2], a[2], b[2]);
	and and3(g[3], a[3], b[3]);

	// carry lookahead logic
	
	cll_4_input cll0(
		.carries(carries),
		.p_out(p_out),
		.g_out(g_out),
		.c_0(c_in),
		.p(p),
		.g(g)
	);
	
	// *** ALUs ***
	
	alu_1_bit alu0(
		.result(result[0]),
		.a(a[0]),
		.b(b[0]),
		.c_in(c_in),
		.ALUop(ALUop)
	);
	
	alu_1_bit alu1(
		.result(result[1]),
		.a(a[1]),
		.b(b[1]),
		.c_in(carries[0]),
		.ALUop(ALUop)
	);
	
	alu_1_bit alu2(
		.result(result[2]),
		.a(a[2]),
		.b(b[2]),
		.c_in(carries[1]),
		.ALUop(ALUop)
	);
	
	alu_1_bit alu3(
		.result(result[3]),
		.a(a[3]),
		.b(b[3]),
		.c_in(carries[2]),
		.ALUop(ALUop)
	);
	
endmodule