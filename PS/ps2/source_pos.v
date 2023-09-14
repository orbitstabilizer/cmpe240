`timescale 1ns / 1ns
module source(t, p, q, r, s);

input wire p;
input wire q;
input wire r;
input wire s;
output wire t;

wire pr;

wire rn;
wire sn;
wire rnsn;

wire pn;
wire pnr;
wire pnrs;

wire qn;
wire pnqnr;

wire and1;
wire and2;

or (pr, p, r);

not (rn, r);
not (sn, s);
or (rnsn, rn, sn);

not (pn, p);
or (pnr, pn, r);
or (pnrs, pnr, s);

not (qn, q);
or (pnqnr, pnr, qn);

and (and1, pr, rnsn);
and (and2, pnrs, pnqnr);

and (t, and1, and2);

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

The value of t is 0 in 11 entries.

t =	(p + q + r + s)(p + q + r + s')(p + q + r' + s')(p + q' + r + s)
	(p + q' + r + s')(p + q' + r' + s')(p' + q + r + s)(p' + q + r' + s')
	(p' + q' + r + s)(p' + q' + r + s')(p' + q' + r' + s')
	
Take the first (p + q + r + s) and second (p + q + r + s') summations.

(p + q + r + s)(p + q + r + s') = (p + q + r) + ss'				(distributivity)
(p + q + r) + ss' = (p + q + r) + 0								(complement)
(p + q + r) + 0 = (p + q + r)									(identity)

t =	(p + q + r)(p + q + r' + s')(p + q' + r + s)(p + q' + r + s')
	(p + q' + r' + s')(p' + q + r + s)(p' + q + r' + s')(p' + q' + r + s)
	(p' + q' + r + s')(p' + q' + r' + s')
	
Take the third (p + q' + r + s) and fourth (p + q' + r + s') summations.

(p + q' + r + s)(p + q' + r + s') = (p + q' + r) + ss'			(distributivity)
(p + q' + r) + ss' = (p + q' + r) + 0							(complement)
(p + q' + r) + 0 = (p + q' + r)									(identity)

t =	(p + q + r)(p + q + r' + s')(p + q' + r)(p + q' + r' + s')
	(p' + q + r + s)(p' + q + r' + s')(p' + q' + r + s)(p' + q' + r + s')
	(p' + q' + r' + s')
	
Take the first (p + q + r) and third (p + q' + r) summations.

(p + q + r)(p + q' + r) = (p + r) + qq'							(distributivity)
(p + r) + qq' = (p + r) + 0										(complement)
(p + r) + 0 = (p + r)											(identity)
	
t =	(p + r)(p + q + r' + s')(p + q' + r' + s')(p' + q + r + s)
	(p' + q + r' + s')(p' + q' + r + s)(p' + q' + r + s')(p' + q' + r' + s')
	
Take the second (p + q + r' + s') and third (p + q' + r' + s') summations.

(p + q + r' + s')(p + q' + r' + s') = (p + r' + s') + qq'		(distributivity)
(p + r' + s') + qq' = (p + r' + s') + 0							(complement)
(p + r' + s') + 0 = (p + r' + s')								(identity)

t =	(p + r)(p + r' + s')(p' + q + r + s)(p' + q + r' + s')
	(p' + q' + r + s)(p' + q' + r + s')(p' + q' + r' + s')

Take the fourth (p' + q + r' + s') and seventh (p' + q' + r' + s') summations.

(p' + q + r' + s')(p' + q' + r' + s') = (p' + r' + s') + qq'	(distributivity)
(p' + r' + s') + qq' = (p' + r' + s') + 0						(complement)
(p' + r' + s') + 0 = (p' + r' + s')								(identity)

t =	(p + r)(p + r' + s')(p' + q + r + s)(p' + r' + s')
	(p' + q' + r + s)(p' + q' + r + s')

Take the second (p + r' + s') and fourth (p' + r' + s') summations.

(p + r' + s')(p' + r' + s') = (r' + s') + pp'					(distributivity)
(r' + s') + pp' = (r' + s') + 0									(complement)
(r' + s') + 0 = (r' + s')										(identity)

t =	(p + r)(r' + s')(p' + q + r + s)(p' + q' + r + s)
	(p' + q' + r + s')

Take the third (p' + q + r + s) and fourth (p' + q' + r + s) summations.

(p' + q + r + s)(p' + q' + r + s) = (p' + r + s)+ pp'			(distributivity)
(p' + r + s) + pp' = (p' + r + s) + 0							(complement)
(p' + r + s) + 0 = (p' + r + s)									(identity)

t =	(p + r)(r' + s')(p' + r + s)(p' + q' + r + s')

Add (p' + q' + r + s) again to minimize (p' + q' + r + s').

t =	(p + r)(r' + s')(p' + r + s)(p' + q' + r + s)				(idempotent)
	(p' + q' + r + s')
	
Take the fourth (p' + q' + r + s) and fifth (p' + q' + r + s') summations.

(p' + q' + r + s)(p' + q' + r + s') = (p' + q' + r) + ss'		(distributivity)
(p' + q' + r) + ss' = (p' + q' + r) + 0							(complement)
(p' + q' + r) + 0 = (p' + q' + r)								(identity)

t =	(p + r)(r' + s')(p' + r + s)(p' + q' + r)

(p' + r) + q's    // This is not a PoS equation, but I put it to show you SoP or PoS may not realize the fewest number of gates for a truth table.

*/
