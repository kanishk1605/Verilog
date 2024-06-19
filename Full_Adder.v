module halfadder(a,b,sum,carry);
  
input a,b;
output sum,carry;
  
xor(sum,a,b);
and(carry,a,b);

endmodule

module fulladder(a,b,c,cout,sum);
  
input a,b,c;
output cout,sum;
wire w1,w2,w3;
  
halfadder aa(a,b,w1,w2);
halfadder bb(c,w2,w3,sum);
  
or(cout,w1,w3);
  
endmodule

module testbench();
  
reg a,b,c;
wire cout,sum;
  
fulladder sa(a,b,c,cout,sum);
  
always #1 c=~c;
always #2 b=~b;
always #4 a=~a;
initial
begin
  a=0; b=0; c=0;
#8 $finish;
end
endmodule
