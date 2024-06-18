module demux_1x4(s,y,i);

	input [1:0] s;
	input y;
	output [3:0] i;
	
	wire w1,w2;
	wire [3:0] i;
	
	assign w1 = ~s[0];
	assign w2 = ~s[1];
	
	assign i[0] = w1 & w2 & y;
	assign i[1] = w1 & s[1] & y;
	assign i[2] = s[0] & w2 & y;
	assign i[3] = s[0] & s[1] & y;
	
	
endmodule
