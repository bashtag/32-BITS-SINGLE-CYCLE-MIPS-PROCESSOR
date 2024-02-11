module mux_2_to_1_alu_ctr_select(
	output [2:0] alu_ctr,
	input [2:0] func_3_bit,
	input [2:0] ALUop
);
	wire is_r_type;
	wire [2:0] select [1:0];
	
	and and0(is_r_type, ALUop[2], ALUop[1], ALUop[0]);

	and and1(select[0][0], is_r_type, func_3_bit[0]);
	and and2(select[1][0], !is_r_type, ALUop[0]);
	or or0(alu_ctr[0], select[0][0], select[1][0]);
	
	and and3(select[0][1], is_r_type, func_3_bit[1]);
	and and4(select[1][1], !is_r_type, ALUop[1]);
	or or1(alu_ctr[1], select[0][1], select[1][1]);

	and and5(select[0][2], is_r_type, func_3_bit[2]);
	and and6(select[1][2], !is_r_type, ALUop[2]);
	or or2(alu_ctr[2], select[0][2], select[1][2]);
	
endmodule
