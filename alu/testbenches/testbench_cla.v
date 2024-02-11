module testbench_cla();
	reg [15:0] a, b;
	reg c_in;
	reg [2:0]ALUop;
	
	wire [15:0] result;
	wire c_out;

	cla_16_bit cla0(
		.result(result),
		.c_out(c_out),
		.c_in(c_in),
		.a(a),
		.b(b),
		.ALUop(ALUop)
	);
	
	
	initial begin
	#10
	a = 16'd2331;
	b = 16'd2332;
	ALUop = 3'b110;
	c_in = 1'b1;
	#20
	$display("%d - %d = %b", a, b, result);
	
	end

endmodule