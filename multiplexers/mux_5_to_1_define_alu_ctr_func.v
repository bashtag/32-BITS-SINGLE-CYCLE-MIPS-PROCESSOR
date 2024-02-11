module mux_5_to_1_define_alu_ctr_func(
	output [2:0] alu_ctr,
	input [5:0] func_code
);
	wire is_and, is_or, is_add, is_sub, is_slt, is_move;
	wire [2:0] select [5:0];
	
	and and0(is_and, func_code[2], !func_code[1], !func_code[0]);
	and and1(is_slt, func_code[2], func_code[1], func_code[0]);
	and and2(is_add, !func_code[2], func_code[1], !func_code[0]);
	and and3(is_or, func_code[2], !func_code[1], func_code[0]);
	and and4(is_sub, !func_code[2], func_code[1], func_code[0]);
	and and5(is_move, func_code[3]);

	// SELECT

	// first bit
	and and7(select[0][0], is_and, 1'b0);
	and and8(select[1][0], is_or, 1'b1);
	and and9(select[2][0], is_add, 1'b1);
	and and10(select[3][0], is_sub, 1'b0);
	and and11(select[4][0], is_slt, 1'b0);
	and and13(select[5][0], is_move, 1'b1);
	or or3(alu_ctr[0], select[0][0], select[1][0], select[2][0], select[3][0], select[4][0], select[5][0]);

	// second bit
	and and14(select[0][1], is_and, 1'b0);
	and and15(select[1][1], is_or, 1'b0);
	and and16(select[2][1], is_add, 1'b0);
	and and17(select[3][1], is_sub, 1'b1);
	and and18(select[4][1], is_slt, 1'b0);
	and and19(select[5][1], is_move, 1'b1);
	or or4(alu_ctr[1], select[0][1], select[1][1], select[2][1], select[3][1], select[4][1], select[5][1]);

	// third bit
	and and20(select[0][2], is_and, 1'b0);
	and and21(select[1][2], is_or, 1'b0);
	and and22(select[2][2], is_add, 1'b1);
	and and23(select[3][2], is_sub, 1'b1);
	and and24(select[4][2], is_slt, 1'b1);
	and and25(select[5][2], is_move, 1'b1);
	or or5(alu_ctr[2], select[0][2], select[1][2], select[2][2], select[3][2], select[4][2], select[5][2]);


endmodule
