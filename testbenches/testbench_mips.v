`timescale 10ns/1ns
module testbench_mips();
	reg CLK;
	
	mips mips0(
		.CLK(CLK)
	);
	
	initial
		begin
		CLK = 1'b0;
		end
	
	initial #1023 $finish;
	
	always
		begin
			#3 CLK = ~CLK;
		end
endmodule
