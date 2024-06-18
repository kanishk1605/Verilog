module jkff(j,k,q,clk,clr);
  
input j,k,clk,clr;
output q;
reg q;
  
always @(posedge clk or posedge clr)
begin
if(clr==1)
  q=0;
else
begin
case({j,k})
0: q=q;
1: q=0;
2: q=1;
3: q=~q;
endcase
end
end
endmodule
  
module dusingjk(d,q,clk,clr);
  
input d,clk,clr;
output q;
reg q;
  
jkff sa(d,~d,q,clk,clr);
  
endmodule

module testbench();
  
reg d;
reg clk;
reg clr;
wire q;
  
dusingjk sa(d,q,clk,clr);
  
always #1 clk=~clk;
initial 
begin
  clk=0;
  clr=1;
  d=0;
#4 d=1; clr=0;
#4 d=0; 
#4 d=0;
#4 d=1;
#4 $finish;
end
endmodule
