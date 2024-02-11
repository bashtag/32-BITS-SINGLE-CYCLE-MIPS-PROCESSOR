`timescale 1ns/1ns
module register_block (
	output [31:0] read_data1,
	output [31:0] read_data2,
	input [31:0] write_data,
	input [4:0] read_reg1,
	input [4:0] read_reg2,
	input [4:0] write_reg,
	input regWrite
);
	reg [31:0] registers [31:0];

	initial
		begin
			$readmemb("registers.mem", registers);
		end
		
	//always @(regWrite, write_data, write_reg)
	always @(regWrite)
		begin
			if (regWrite == 1'b1)
				begin
					#3
					registers[write_reg] = write_data;
					$writememb("registers.mem", registers);
					$display("%d, data = %d, reg = %d\n", regWrite, write_data, write_reg);
				end
		end

	assign read_data1 = registers[read_reg1];
	assign read_data2 = registers[read_reg2];
		
endmodule
