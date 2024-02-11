module instruction_block (
	output reg [31:0] instruction,
	input [31:0] pc
);
	reg [31:0] instructions [1023:0];

	initial
		begin
			$readmemb("instructions.mem", instructions);
		end
		
	always @(pc)
		begin
			instruction = instructions[pc[11:2]];
		end

endmodule
