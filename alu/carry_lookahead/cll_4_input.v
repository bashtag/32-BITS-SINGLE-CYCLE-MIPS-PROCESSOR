module cll_4_input(
	output [2:0] carries,
	output p_out, g_out,
	input c_0,
	input [3:0] p, g
);
	wire [9:0] temps;
	
	and and0(temps[0], p[0], c_0);
	
	and and1(temps[1], p[1], g[0]);
	and and2(temps[2], p[1], p[0], c_0);
	
	
	and and3(temps[3], p[2], g[1]);
	and and4(temps[4], p[2], p[1], g[0]);
	and and5(temps[5], p[2], p[1], p[0], c_0);
	
	and and6(temps[6], p[3], g[2]);
	and and7(temps[7], p[3], p[2], g[1]);
	and and8(temps[8], p[3], p[2], p[1], g[0]);
	
	// propagate out for 16 bit cla
	and and9(p_out, p[3], p[2], p[1], p[0]);
	
	or or0(carries[0], g[0], temps[0]);
	or or1(carries[1], g[1], temps[1], temps[2]);
	or or2(carries[2], g[2], temps[3], temps[4], temps[5]);
	
	// generate out for 16 bit cla
	or or3(g_out, g[3], temps[6], temps[7], temps[8]);

endmodule