module mux_2_to_1_5_bit(
	output [4:0] result,
	input [4:0] first_input,
	input [4:0] second_input,
	input signal
);
	wire [4:0] select [1:0];

	and and0(select[0][0], signal, first_input[0]);
	and and1(select[1][0], !signal, second_input[0]);
	or or0(result[0], select[0][0], select[1][0]);

	and and2(select[0][1], signal, first_input[1]);
	and and3(select[1][1], !signal, second_input[1]);
	or or1(result[1], select[0][1], select[1][1]);

	and and4(select[0][2], signal, first_input[2]);
	and and5(select[1][2], !signal, second_input[2]);
	or or2(result[2], select[0][2], select[1][2]);

	and and6(select[0][3], signal, first_input[3]);
	and and7(select[1][3], !signal, second_input[3]);
	or or3(result[3], select[0][3], select[1][3]);

	and and8(select[0][4], signal, first_input[4]);
	and and9(select[1][4], !signal, second_input[4]);
	or or4(result[4], select[0][4], select[1][4]);

endmodule
