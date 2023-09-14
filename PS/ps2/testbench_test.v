`timescale 1ns / 1ns

module source(t, p, q, r, s);

//t = pq'r's + rs' 
input wire p;
input wire q;
input wire r;
input wire s;

output wire t;

wire snot; 
wire qnot; 
wire rnot; 

wire randsnot; 
wire pandqnot; 
wire sandrnot; 
wire andall  ; 


not (snot, s);
not (qnot, q);
not (rnot, r);

and (randsnot,r, snot);            // rs'

and (pandqnot, p,            qnot); // pq'
and (sandrnot, s,            rnot); // sr'
and (andall, pandqnot, sandrnot); //pq'r's

or  (t, andall,   randsnot); //pq'r's + rs'

endmodule

module testbench();

  reg a, b, c, d;
  wire z;

  integer i;

  source u0 ( .p(a) , .q(b) , .r(c) , .s(d) , .t(z));
  initial begin
      $dumpfile("TimingDiagram_Test.vcd");
      $dumpvars(0,a , b , c , d , z);
    a <= 0 ;
    b <= 0 ;
    c <= 0 ;
    d <= 0 ;
    $monitor("%b %b %b %b %b", a, b, c, d, z);
    for (i = 0; i < 16; i = i + 1) begin
      {a, b, c, d} = i;
      #10;
    end 

    $finish;

  end

endmodule

/*
pqrs t
0000 0
0001 0
0010 1
0011 0
0100 0
0101 0
0110 1
0111 0
1000 0
1001 1
1010 1
1011 0
1100 0
1101 0
1110 1
1111 0
*/
