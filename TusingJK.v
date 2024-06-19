module jkff(j,k,q,clk,clr);
  
input j,k;
input clk;
input clr;
output q;
reg q;
  
always@(posedge clk or posedge clr)
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

module tusingjk(t,q,clk,clr);
  
input t,clk,clr;
output q;
  
jkff(t,t,q,clk,clr);
  
endmodule

module testbench();
  
reg t;
reg clk;
reg clr;
wire q;
  
tusingjk sa(t,q,clk,clr);
  
always #1 clk=~clk;
initial 
begin
  clk=0;
  clr=1;
  t=0;
#4 t=1; clr=0;
#4 t=0; 
#4 t=0;
#4 t=1;
#4 $finish;
end
endmodule
