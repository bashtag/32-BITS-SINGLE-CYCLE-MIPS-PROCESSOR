module testbench_instruction_block();
	wire [31:0] instruction;
	reg [31:0] pc;
	
	instruction_block ins0(
		.instruction(instruction),
		.pc(pc)
	);
	
	initial
		begin
		#5 pc = 0;
		#5 $display("%b", instruction);
		#5 pc = 1;
		#5 $display("%b", instruction);
		#5 pc = 2;
		#5 $display("%b", instruction);
		
		end


endmodule
