module cla_16_bit(
	output [15:0] result,
	output c_out,
	input c_in,
	input [15:0] a, b,
	input [2:0] ALUop
);
	wire [3:0] p_outs, g_outs;
	wire [2:0] carries_4_bit;
	wire p_out_16, g_out_16, temp;
	
	// carry lookahead adders
	
	cla_4_bit cla0(
		.result(result[3:0]),
		.p_out(p_outs[0]),
		.g_out(g_outs[0]),
		.c_in(c_in),
		.a(a[3:0]),
		.b_initial(b[3:0]),
		.ALUop(ALUop)
	);
	
	cla_4_bit cla1(
		.result(result[7:4]),
		.p_out(p_outs[1]),
		.g_out(g_outs[1]),
		.c_in(carries_4_bit[0]),
		.a(a[7:4]),
		.b_initial(b[7:4]),
		.ALUop(ALUop)
	);
	
	cla_4_bit cla2(
		.result(result[11:8]),
		.p_out(p_outs[2]),
		.g_out(g_outs[2]),
		.c_in(carries_4_bit[1]),
		.a(a[11:8]),
		.b_initial(b[11:8]),
		.ALUop(ALUop)
	);
	
	cla_4_bit cla3(
		.result(result[15:12]),
		.p_out(p_outs[3]),
		.g_out(g_outs[3]),
		.c_in(carries_4_bit[2]),
		.a(a[15:12]),
		.b_initial(b[15:12]),
		.ALUop(ALUop)
	);
	
	// carry lookahead logic for 16 bit adder
	
	cll_4_input cll0(
		.carries(carries_4_bit),
		.p_out(p_out_16),
		.g_out(g_out_16),
		.c_0(c_in),
		.p(p_outs),
		.g(g_outs)
	);
	
	and and0(temp, p_out_16, c_in);
	or or0(c_out, g_out_16, temp);

endmodule