module mux_5_to_1_define_alu_op(
	output [2:0] ALUop,
	input [5:0] opcode
);
	wire is_and, is_or, is_add, is_sub, is_slt, is_r_type;
	wire [2:0] select [5:0];
	
	and and0(is_and, opcode[2], !opcode[1], !opcode[0]);
	and and1(is_slt, !opcode[5], opcode[2], opcode[1], opcode[0]);
	and and12(is_r_type, !opcode[5], !opcode[4], !opcode[3], !opcode[2], !opcode[1], !opcode[0]);
	
	// add
	wire is_addi;
	and and2(is_addi, opcode[1], !opcode[0]);
	or or0(is_add, is_addi, opcode[3], opcode[4]);
	
	// or
	wire is_ori, is_move;
	and and3(is_ori, opcode[2], !opcode[1], opcode[0]);
	and and4(is_move, opcode[5], !opcode[0]);
	or or1(is_or, is_ori, is_move);
	
	// sub
	wire subi_beq, is_bne;
	and and5(subi_beq, !opcode[2], opcode[1], opcode[0]);
	and and6(is_bne, opcode[5], opcode[2], opcode[1], opcode[0]);
	or or2(is_sub, subi_beq, is_bne);
	
	always @(is_sub)
		begin
			$display("AHA SUB = %d\n", is_sub);
		end


	// SELECT

	// first bit
	and and7(select[0][0], is_and, 1'b0);
	and and8(select[1][0], is_or, 1'b1);
	and and9(select[2][0], is_add, 1'b1);
	and and10(select[3][0], is_sub, 1'b0);
	and and11(select[4][0], is_slt, 1'b0);
	and and13(select[5][0], is_r_type, 1'b1);
	or or3(ALUop[0], select[0][0], select[1][0], select[2][0], select[3][0], select[4][0], select[5][0]);

	// second bit
	and and14(select[0][1], is_and, 1'b0);
	and and15(select[1][1], is_or, 1'b0);
	and and16(select[2][1], is_add, 1'b0);
	and and17(select[3][1], is_sub, 1'b1);
	and and18(select[4][1], is_slt, 1'b0);
	and and19(select[5][1], is_r_type, 1'b1);
	or or4(ALUop[1], select[0][1], select[1][1], select[2][1], select[3][1], select[4][1], select[5][1]);

	// third bit
	and and20(select[0][2], is_and, 1'b0);
	and and21(select[1][2], is_or, 1'b0);
	and and22(select[2][2], is_add, 1'b1);
	and and23(select[3][2], is_sub, 1'b1);
	and and24(select[4][2], is_slt, 1'b1);
	and and25(select[5][2], is_r_type, 1'b1);
	or or5(ALUop[2], select[0][2], select[1][2], select[2][2], select[3][2], select[4][2], select[5][2]);


endmodule
