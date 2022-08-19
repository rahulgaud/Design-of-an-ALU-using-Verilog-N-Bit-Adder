`timescale 1ns / 1ps
module N_bit_adder(i1,i2,y);
parameter N=32;
input [N-1:0] i1,i2;
output [N-1:0] y;
wire carry_out;
wire [N-1:0] carry;
genvar i;
generate
for(i=0;i<N;i=i+1)
begin: generate_N_bit_Adder
if(i==0)
half_adder f(i1[0],i2[0],y[0],carry[0]);
else
full_adder f(i1[i],i2[i],carry[i-1],y[i],carry[i]);
end
assign carry_out = carry[N-1];
endgenerate
endmodule
module half_adder(x,y,s,c);
input x,y;
output s,c;
assign s=x^y;
assign c=x&y;
endmodule
module full_adder(x,y,c_in,s,c_out);
input x,y,c_in;
output s,c_out;
assign s = (x^y) ^ c_in;
assign c_out = (y&c_in)| (x&y) | (x&c_in);
endmodule