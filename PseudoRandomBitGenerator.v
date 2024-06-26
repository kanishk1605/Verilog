module prbs(clk,clr,rand,temp);    // PRBS is an algorithm that generates a sequence of bits that appears random but is actually deterministic and reproducible.
  
// implemented using Linear Feedback Shift Register(LFSR)  
input clk,clr;
output [3:0]rand;
wire [3:0]rand;
output [3:0]temp;
reg [3:0]temp=0;
  
always @ (posedge clk)
begin
if(clr==1)
  temp=4'hf;  // Initial Seed 
else
  temp={temp[0]^temp[1],temp[3],temp[2],temp[1]};    // Left shift from 3-1
end
  
assign rand[3:0]=temp[3:0];
endmodule

module testbench();
  
reg clk,clr;
wire [3:0]rand;
  
prbs test(clk,clr,rand);
  
initial
begin
  clk=1;
forever #5 clk=~clk;
end
initial
begin
  clr=1;
#100 clr=0;
#200 $finish;
end
endmodule
