module memory_block (
	output reg [31:0] read_data,
	input byteOperations, //(This is an optional signal for lb and sb operations)
	input [17:0] address,
	input [31:0] write_data,
	input memRead,
	input memWrite
);
	reg [31:0] memory [63:0];
	
	initial
		begin
			$readmemb("memory.mem", memory);
		end

	always @(memRead, byteOperations, address)
		begin
			if (memRead == 1'b1)
				begin
					if (byteOperations == 1'b1)
						begin
							read_data[31:8] = 24'b0;
							read_data[7:0] = memory[address[17:2]][address[1:0] * 8 +: 8]; // offset (+:) width
							$display("BYTE\n");
						end
					else
						begin
							read_data = memory[address[17:2]];
							$display("NOT BYTE\n");
						end
					$display("memory read address = %d, memory = %d\n", address, read_data);
				end
		end
		
	always @(memWrite, byteOperations, address, write_data)
		begin
			if (memWrite == 1'b1)
				begin
					if (byteOperations == 1'b1)
						begin
							memory[address[17:2]][address[1:0]*8 +: 8] = write_data[7:0];
						end
					else
						begin
							memory[address[17:2]] = write_data;
						end
					$writememb("memory.mem", memory);
					$display("memory write %d\n", write_data);
				end
		end

endmodule
