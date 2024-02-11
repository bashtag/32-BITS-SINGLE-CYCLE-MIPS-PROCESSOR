module testbench_alu();
	reg [3:0] a, b;
	reg c_in;
	reg [2:0] ALUop;
	wire [3:0] result;
	wire c_out;
	wire [3:0] alu_res;
	wire [3:0] carries, p, g;

	cla_4_bit cla0(
		.result(result),
		.c_out(c_out),
		.c_in(c_in),
		.a(a),
		.b(b),
		.ALUop(ALUop)
	);
	
	alu_1_bit alu0(
		.result(alu_res[0]),
		.a(1'b1),
		.b(1'b0),
		.c_in(1'b1),
		.ALUop(ALUop)
	);
	
	alu_1_bit alu1(
		.result(alu_res[1]),
		.a(1'b0),
		.b(1'b1),
		.c_in(1'b1),
		.ALUop(ALUop)
	);
	
	alu_1_bit alu2(
		.result(alu_res[2]),
		.a(1'b1),
		.b(1'b0),
		.c_in(1'b0),
		.ALUop(ALUop)
	);
	
	alu_1_bit alu3(
		.result(alu_res[3]),
		.a(1'b1),
		.b(1'b1),
		.c_in(1'b1),
		.ALUop(ALUop)
	);
	
	or or0(p[0], a[0], !b[0]);
	or or1(p[1], a[1], !b[1]);
	or or2(p[2], a[2], !b[2]);
	or or3(p[3], a[3], !b[3]);
	
	and and0(g[0], a[0], !b[0]);
	and and1(g[1], a[1], !b[1]);
	and and2(g[2], a[2], !b[2]);
	and and3(g[3], a[3], !b[3]);

	cll_4_input cll0(
		.carries(carries),
		.c_0(c_in),
		.p(p),
		.g(g)
	);
	
	initial begin
		#5
		//ALUop = 3'b110;
		//a = 4'b1101;
		//b = 4'b1010;
		ALUop = 3'b101;
		a = 4'b0101;
		b = 4'b1111;
		//c_in = 1'b1;
		c_in = 1'b0;
		#5
		$display("%d and %d, result = %d", a, b, result);
		$display("alu res_0 = %d", alu_res[0]);
		$display("alu res_1 = %d", alu_res[1]);
		$display("alu res_2 = %d", alu_res[2]);
		$display("alu res_3 = %d", alu_res[3]);
		$display("alu res = %d", alu_res);
		$display("p_0 = %d", p[0]);
		$display("p_1 = %d", p[1]);
		$display("p_2 = %d", p[2]);
		$display("p_3 = %d", p[3]);
		$display("g_0 = %d", g[0]);
		$display("g_1 = %d", g[1]);
		$display("g_2 = %d", g[2]);
		$display("g_3 = %d", g[3]);
		$display("carries_0 = %d", carries[0]);
		$display("carries_1 = %d", carries[1]);
		$display("carries_2 = %d", carries[2]);
		$display("carries_3 = %d", carries[3]);
	
	
	end
endmodule