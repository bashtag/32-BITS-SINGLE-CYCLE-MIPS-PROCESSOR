`timescale 1ns/1ns
module mips(
	input CLK
);
	reg [31:0] pc;
	wire [31:0] instruction;
	wire [31:0] register_read_data1;
	wire [31:0] register_read_data2;
	wire [2:0] alu_ctr; // alu control output
	wire [31:0] alu_res;
	wire zero_bit, branch_predict;
	wire [31:0] mem_read_data;
	wire [31:0] sign_ext_imm;
	wire [31:0] jump_ext;
	
	// control signals
	wire regDst,
		branch,
		memRead,
		memWrite,
		ALUsrc,
		jump,
		byteOperations,
		move,
		regWrite,
		branch_ne,
		jal_signal,
		jr_signal;
	//DEBUG
	reg regWrite_internal;
		
	wire [2:0] ALUop;
	
	// mux results
	wire [4:0] write_reg; // instruction_fecth - instruction_decode
	wire [31:0] alu_input; // instruction_decode - execution
	wire [31:0] write_data; // write_back output
	wire [31:0] new_write_data; // after the jal
	wire [31:0] pc_branch_or_pc; // branch and zero ? pc + 4 + imm*4 : pc + 4
	wire [31:0] pc_jump_branch_res;
	wire [31:0] next_pc;
	wire [4:0] new_write_reg; // after the jal
	
	// program counter
	initial
		begin
			//regWrite_internal = 1'b0;
			pc = -4;
		end
		
	always @(CLK)
		#3
		begin
			if (CLK == 1'b1) // posedge
				begin
					#3
					regWrite_internal <= regWrite;
					$display("pc = %d, regWrite = ", pc);
					$display("branch = %d, zero_bit = %d\n", branch, zero_bit);
					
					//pc = next_pc;
				end
			
			else
				begin
					regWrite_internal = 0;
					$display("NEGEDGE, regWrite %d", regWrite_internal);
					pc <= next_pc;
				end
		end

	wire [31:0] pc_add_4;
	
	adder_32 pc_add_4_adder(
		.result(pc_add_4),
		.src1(pc),
		.src2(32'b100)
	);
	
	// jump
	
	jump_extend jext(
		.result(jump_ext),
		.address(instruction[25:0])
	);
	
	mux_2_to_1_32_bit pc_or_branch_or_jump(
		.output_reg(pc_jump_branch_res),
		.first_input(jump_ext),
		.second_input(pc_branch_or_pc),
		.signal(jump)
	);
	
	// jal
	mux_2_to_1_reg_31 reg31(
		.result(new_write_reg),
		.write_reg(write_reg),
		.signal(jal_signal)
	);
	
	mux_2_to_1_32_bit mux2(
		.output_reg(new_write_data),
		.first_input(pc_add_4),
		.second_input(write_data),
		.signal(jal_signal)
	);
	
	// jr
	mux_2_to_1_32_bit for_jr(
		.output_reg(next_pc),
		.first_input(register_read_data1),
		.second_input(pc_jump_branch_res),
		.signal(jr_signal)
	);
	
	// branch
	
	// branch prediction
	wire [31:0] branch_mult_4;
	wire [31:0] pc_add_4_add_branch_mult_4;
	wire should_it_happen;
	custom_xor zero_xor_ne(
		.result(should_it_happen),
		.a(zero_bit),
		.b(branch_ne)
	);
	and and0(branch_predict, branch, should_it_happen);
	
	shift_left_2 branch_shift_left_by_2(
		.shifted_address(branch_mult_4),
		.address(sign_ext_imm)
	);
	
	adder_32 pc_add_4_add_branch(
		.result(pc_add_4_add_branch_mult_4),
		.src1(pc_add_4),
		.src2(branch_mult_4)
	);
	
	mux_2_to_1_32_bit pc_or_branch(
		.output_reg(pc_branch_or_pc),
		.first_input(pc_add_4_add_branch_mult_4),
		.second_input(pc_add_4),
		.signal(branch_predict)
	);
	
	// instruction_fect
	instruction_block ins_block0(
		.instruction(instruction),
		.pc(pc)
	);
	
	// control_unit
	control_unit ctrl_unit0(
		.regDst(regDst),
		.branch(branch),
		.memRead(memRead),
		.memWrite(memWrite),
		.ALUop(ALUop),
		.ALUsrc(ALUsrc),
		.regWrite(regWrite),
		.jump(jump),
		.byteOperations(byteOperations),
		.move(move),
		.opcode(instruction[31:26])
	);
	
	and and_bne(branch_ne, branch, instruction[28]); // opcode[2]
	and and_jal(jal_signal, instruction[31], instruction[30], instruction[26]); // opcode = 11xxx1
	and generate_jr(jr_signal, regDst, instruction[3]); // func_code[3] 
	
	// sign extend
	sign_extend sign_ext0(
		.sign_ext_imm(sign_ext_imm),
		.imm(instruction[15:0])
	);
	
	// alu_control
	alu_control alu_ctrl0(
		.alu_ctr(alu_ctr),
		.function_code(instruction[5:0]),
		.ALUop(ALUop)
	);

	
	// instruction_decode
	
	mux_2_to_1_5_bit mux0(
		.result(write_reg),
		.first_input(instruction[15:11]),
		.second_input(instruction[20:16]),
		.signal(regDst)
	);
	
	register_block reg_block0(
		.read_data1(register_read_data1),
		.read_data2(register_read_data2),
		.write_data(new_write_data),
		.read_reg1(instruction[25:21]),
		.read_reg2(instruction[20:16]),
		.write_reg(new_write_reg),
		.regWrite(regWrite_internal)
	);
	
	
	// execution
	
	mux_2_to_1_32_bit mux1(
		.output_reg(alu_input),
		.first_input(sign_ext_imm),
		.second_input(register_read_data2),
		.signal(ALUsrc)
	);
	
	alu_32_bit alu0(
		.result(alu_res),
		.zero_bit(zero_bit),
		.alu_src1(register_read_data1),
		.alu_src2(alu_input),
		.alu_ctr(alu_ctr)
	);
	
	// memory
	
	memory_block mem_block0(
		.read_data(mem_read_data),
		.byteOperations(byteOperations),
		.address(alu_res[17:0]),
		.write_data(register_read_data2),
		.memRead(memRead),
		.memWrite(memWrite)
	);
	
	// write_back
	
	mux_2_to_1_32_bit mux_write_back(
		.output_reg(write_data),
		.first_input(mem_read_data),
		.second_input(alu_res),
		.signal(memRead)
	);
	

endmodule
