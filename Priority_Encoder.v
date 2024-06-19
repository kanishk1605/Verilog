module pencoder(in, out, valid);    // 4-to-2 priority encoder
  
input [3:0] in;    // 4 bit input
output [1:0] out;    // 2 bit output
output valid;
  
always @(in) begin
valid = 1'b1;  // Default valid signal is high
casez(in)  //'casez' statement is used to prioritize the inputs, with '?' as a wildcard to match both 0 and 1.
  4'b1???: out = 2'b11;  // Highest priority: in[3]
  4'b01??: out = 2'b10;  // Next highest priority: in[2]
  4'b001?: out = 2'b01;  // Next highest priority: in[1]
  4'b0001: out = 2'b00;  // Lowest priority: in[0]
  default: begin
    out = 2'b00;
    valid = 1'b0;  // No valid input
   end
endcase
end
endmodule

module testbench();
  
reg [3:0]in;
wire [1:0]out;
wire valid;
  
pencoder p1(in, out, valid);
  
initial
begin
in = 4'b0000; #10;  // No input active
in = 4'b0001; #10;  // Only in[0] active
in = 4'b0010; #10;  // Only in[1] active
in = 4'b0100; #10;  // Only in[2] active
in = 4'b1000; #10;  // Only in[3] active
in = 4'b0011; #10;  // in[1] and in[0] active (in[1] has priority)
in = 4'b0110; #10;  // in[2] and in[1] active (in[2] has priority)
in = 4'b1100; #10;  // in[3] and in[2] active (in[3] has priority)
in = 4'b1111; #10;  // All inputs active (in[3] has priority)
$finish;
end

initial begin
  $monitor("At time %t, in = %b, out = %b, valid = %b",$time, in, out, valid);
end
endmodule
