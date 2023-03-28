`timescale 1ns / 1ns
module source(c, a, b);

input wire [1:0] a; // 2 bit
input wire [1:0] b; // 2 bit
output wire [1:0] c; // 2 bit

// p  a[1]
// q  a[0]
// r  b[1]
// s  b[0]

wire np;
wire nr;

not(np,a[1] );
not(nr,b[1] );

// c1  = p'rs+  p'qr + pr' 
wire nprs;
wire npqr;
wire pnr;

and(nprs, np, b[1], b[0]);
and(npqr, np, a[0], b[1]);
and(pnr, a[1], nr);

or(c[1], nprs, npqr, pnr);

//c0 = (p + q  + s)( q + r )(p' + r )(p'+ r + s)
wire _pqs;
wire _qr;
wire _npr;
wire _nprs;

or(_pqs, a[1], a[0], b[0]);
or(_qr, a[0], b[1]);
or(_npr, np, b[1]);
or(_nprs, np, b[1], b[0]);

and(c[0], _pqs, _qr, _npr, _nprs);


endmodule
