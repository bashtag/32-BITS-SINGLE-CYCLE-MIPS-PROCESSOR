module mux_2_to_1_write_reg(
	output [4:0] write_reg,
	input [4:0] rt,
	input [4:0] rd,
	input regDst
);
	wire [4:0] select [1:0];

	and and0(select[0][0], regDst, rd[0]);
	and and1(select[1][0], !regDst, rt[0]);
	or or0(write_reg[0], select[0][0], select[1][0]);

	and and2(select[0][1], regDst, rd[1]);
	and and3(select[1][1], !regDst, rt[1]);
	or or1(write_reg[1], select[0][1], select[1][1]);

	and and4(select[0][2], regDst, rd[2]);
	and and5(select[1][2], !regDst, rt[2]);
	or or2(write_reg[2], select[0][2], select[1][2]);

	and and6(select[0][3], regDst, rd[3]);
	and and7(select[1][3], !regDst, rt[3]);
	or or3(write_reg[3], select[0][3], select[1][3]);

	and and8(select[0][4], regDst, rd[4]);
	and and9(select[1][4], !regDst, rt[4]);
	or or4(write_reg[4], select[0][4], select[1][4]);

endmodule
