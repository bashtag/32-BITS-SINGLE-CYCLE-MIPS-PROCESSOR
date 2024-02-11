module testbench_cla_msb();
	reg [15:0] a, b;
	reg c_in;
	reg [2:0]ALUop;
	
	wire [15:0] result;
	wire c_out, overflow, slt;

	cla_16_bit_msb cla0(
		.result(result),
		.c_out(c_out),
		.overflow(overflow),
		.slt(slt),
		.c_in(c_in),
		.a(a),
		.b(b),
		.ALUop(ALUop)
	);
	
	
	initial begin
	#10
	a = 16'h7FFF;
	b = 16'h7FFF;
	ALUop = 3'b101;
	c_in = 1'b0;
	#20
	$display("%b - %b = %b", a, b, result);
	$display("overflow = %d, slt = %d", overflow, slt);
	
	end

endmodule