module ha(a,b,s,c);    // Half Adder
  
input a,b;
output s,c;
reg s,c;
  
always@(a or b)
begin
case({a,b})
  2'b00:begin s=0;c=0; end
  2'b01:begin s=1;c=0; end
  2'b10:begin s=1;c=0; end
  2'b11:begin s=0;c=1; end
endcase
end
endmodule

module fa(a,b,cin,s,c);    // Full Adder
  
input a,b,cin;
output s,c;
wire s1,c1,c2;
// Instantiating half adders
ha a1(a,b,s1,c1);
ha a2(s1,cin,s,c2);
assign c=c1|c2;
endmodule

module parallel(x, y, as, s, cout);
input [03:0] x;
input [03:0] y;
input as;
output [03:0] s;
output cout;
wire c0,c1,c2,y0,y1,y2,y3;
  
assign y0=y[0]^as;  
assign y1=y[1]^as;
assign y2=y[2]^as;
assign y3=y[3]^as;
  // Instanting full adders
fa a1(x[0],y0,as,s[0],c0);
fa a2(x[1],y1,c0,s[1],c1);
fa a3(x[2],y2,c1,s[2],c2);
fa a4(x[3],y3,c2,s[3],cout);
endmodule
    
module testbench();
    reg [3:0]x;
    reg [3:0]y;
    reg as;
    wire [3:0]s;
    wire cout;
    parallel aaa(x,y,as,s,cout);
    initial
    begin
     as=0; x=4'b0010; y=4'b0100;
     #5 as=1;x=4'b1111;y=4'b1100;
     #50 $finish;
    end
    endmodule
