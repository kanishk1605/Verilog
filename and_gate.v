module and_gate(a,b,y);
  
input a,b;
output y;
reg y;

//behavioral modelling
always@(a,b)
begin
  if(a==1&&b==1)
    y=1;
  else
    y=0;
  end
endmodule

module testbench();
reg a,b;
wire y;
and_gate sa(a,b,y);
initial
begin
a=0; b=0;
#5 a=0; b=1;
#5 a=1; b=0;
#5 a=1; b=1;
#5 $finish;
end
endmodule 
