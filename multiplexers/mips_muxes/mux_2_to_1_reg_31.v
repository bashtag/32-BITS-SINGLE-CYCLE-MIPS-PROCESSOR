module mux_2_to_1_reg_31(
	output [4:0] result,
	input [4:0] write_reg,
	input signal
);
	wire [4:0] select [1:0];

	and and0(select[0][0], signal, 1'b1);
	and and1(select[1][0], !signal, write_reg[0]);
	or or0(result[0], select[0][0], select[1][0]);

	and and2(select[0][1], signal, 1'b1);
	and and3(select[1][1], !signal, write_reg[1]);
	or or1(result[1], select[0][1], select[1][1]);

	and and4(select[0][2], signal, 1'b1);
	and and5(select[1][2], !signal, write_reg[2]);
	or or2(result[2], select[0][2], select[1][2]);

	and and6(select[0][3], signal, 1'b1);
	and and7(select[1][3], !signal, write_reg[3]);
	or or3(result[3], select[0][3], select[1][3]);

	and and8(select[0][4], signal, 1'b1);
	and and9(select[1][4], !signal, write_reg[4]);
	or or4(result[4], select[0][4], select[1][4]);

endmodule
