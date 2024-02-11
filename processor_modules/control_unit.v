module control_unit (
	output regDst,
	output branch,
	output memRead, // (This can also be used as memToReg)
	output memWrite,
	output [2:0] ALUop, // (This was assigned as [1:0] before, by mistake. It should be [2:0])
	output ALUsrc,
	output regWrite,
	output jump,
	output byteOperations, // (This is an optional signal for lb and sb operations)
	output move, // (This is an optional signal for MOVE operation)
	input [5:0] opcode
);

	and and0(memRead, !opcode[4], opcode[3]);
	
	and and1(memWrite, !opcode[5], opcode[4]);
	
	and and2(branch, opcode[5], opcode[1]);
	
	and and3(regDst, !opcode[5], !opcode[4], !opcode[3], !opcode[2], !opcode[1], !opcode[0]); // R type
	
	// byteOps
	wire xor_res;
	
	custom_xor xor0(
		.result(xor_res),
		.a(opcode[4]),
		.b(opcode[3])
	);

	and and4(byteOperations, opcode[0], xor_res);
	
	and and5(move, opcode[5], !opcode[4], !opcode[2]);

	and and6(jump, opcode[5], opcode[4], opcode[3]);
	
	and and7(ALUsrc, !regDst, !opcode[5]);
	
	// regWrite
	
	wire branch_jump, xor_buff, store;
	
	custom_xor xor1(
		.result(xor_buff),
		.a(opcode[0]),
		.b(opcode[4])
	);
	
	and and8(branch_jump, opcode[5], xor_buff);
	and store_and(store, !opcode[5], opcode[4]);
	
	and and9(regWrite, !branch_jump, !store);
	
	// ALUop
	
	mux_5_to_1_define_alu_op mux0(
		.ALUop(ALUop),
		.opcode(opcode)
	);

endmodule
