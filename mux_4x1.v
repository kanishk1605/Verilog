module mux_4x1(i,a,b,y);

	input [3:0] i;
	input a,b;
	output y;
	
	wire [6:1] w;
	wire a_n,b_n,y;
	
	assign a_n = ~ a;
	assign b_n = ~ b;
	assign w[1] = a_n & b_n & i[0];
	assign w[2] = a_n & b & i[1];
	assign w[3] = a & b_n & i[2];
	assign w[4] = a & b & i[3];
	
	assign w[5] = w[1] | w[2];
	assign w[6] = w[3] | w[4];
	assign y = w[5] | w[6];
	
	
	
endmodule
