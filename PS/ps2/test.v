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

t = p'q'rs' + p'qrs' + pq'r's + pq'rs' + pqrs'
[t = p'q'rs' + p'qrs' + pq'r's + pq'rs' + pqrs' + pqrs']
t = p'q'rs' + p'qrs' + p'qrs' +  pq'r's + pq'rs' + pqrs'
[p'q'rs' + p'qrs' ==  p'rs' ]
t = p'rs' + p'qrs' +  pq'r's + pq'rs' + pqrs'
[p'qrs' + pqrs' ==  qrs' ] 
t = p'rs' +  pq'r's + pq'rs'+ qrs' + pqrs'
[pqrs' + pq'rs' == prs']
t = p'rs' +  pq'r's + qrs' + prs'
[p'rs' + prs' == rs'] 
t = pq'r's + qrs' +  1rs'
[rs' +  1rs' == rs'(1 + q) == rs']
t = pq'r's + rs' 
// bol sans



*/




