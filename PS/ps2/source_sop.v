`timescale 1ns / 1ns
module source(t, p, q, r, s);

input wire p;
input wire q;
input wire r;
input wire s;
output wire t;

//t = rs' + pq'r's

wire sn;
wire rsn;

wire qn;
wire pqn;
wire rn;
wire rns;
wire pqnrns;

not(sn, s);
and(rsn, r, sn);

not(qn, q);
and(pqn, p, qn);
not(rn, r);
and(rns, rn, s);
and(pqnrns, pqn, rns);

or(t, rsn, pqnrns);

endmodule

/*
Truth Table
4 input - 1 output

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

The value of t is 1 in 5 entries.

t = p'q'rs' + p'qrs' + pq'r's + pq'rs' + pqrs'

Take the first (p'q'rs') and second (p'qrs') products.

p'q'rs' + p'qrs' = p'(q'rs' + qrs')			(distributivity)
p'(q'rs' + qrs') = p'r(q's' + qs')			(distributivity)
p'r(q's' + qs') = p'rs'(q' + q)				(distributivity)
p'rs'(q' + q) = p'rs'(1)					(complement)
p'rs'(1) = p'rs'							(identity)

t = p'rs' + pq'r's + pq'rs' + pqrs'

Take the third (pq'rs') and fourth (pqrs') products.

pq'rs' + pqrs' = p(q'rs' + qrs')			(distributivity)
p(q'rs' + qrs') = pr(q's' + qs')			(distributivity)
pr(q's' + qs') = prs'(q' + q) 				(distributivity)
prs'(q' + q) = prs'(1)						(complement)
prs'(1) = prs'								(identity)

t = p'rs' + pq'r's + prs'

Take the first (p'rs') and third (prs') products.

p'rs' + prs' = r(p's' + ps')				(distributivity)
r(p's' + ps') = rs'(p' + p)					(distributivity)
rs'(p' + p) = rs'(1)						(complement)
rs'(1) = rs'								(identity)

t = rs' + pq'r's

*/
