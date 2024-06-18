module D_ff(d,clk,y);
	
	input d,clk;
	output y;
	// Data sets
	
	reg y;
	always@(posedge clk)
		begin
			y <= d;
		end
	
endmodule
