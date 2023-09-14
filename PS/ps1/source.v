`timescale 1ns / 1ns
module source(s, x);

input wire [1:0] x;
output wire [1:0] s;

wire x1x2_and;
wire x1x2_xnor;

and(x1x2_and, x[0], x[1]); //and(x1, x2)
xnor(x1x2_xnor, x[0], x[1]); // xnor(x1, x2)

or(s[0], x1x2_and, x1x2_xnor); // or(and(x1, x2), xnor(x1, x2))
nand(s[1], x1x2_and, x1x2_xnor); // nand(and(x1, x2), xnor(x1, x2))
endmodule

