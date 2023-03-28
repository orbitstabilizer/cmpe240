`timescale 1ns / 1ns
module source(c, a, b);

input wire [1:0] a; // 2 bit
input wire [1:0] b; // 2 bit
output wire [1:0] c; // 2 bit

// c0 = p'rs+  p'qr + pr'
// p  a[1]
// q  a[0]
// r  b[1]
// s  b[0]


wire np;
wire nr;

wire np_and_r;//p'r

wire npandr_and_s;//p'rs

wire np_and_q;//p'q

wire npandq_and_r;//p'qr

wire p_and_nr;//pr'

wire npandrands_or_npandqandr; // p'rs+  p'qr 

// c1  // p'rs+  p'qr + pr' 




not(np,a[1] );
not(nr,b[1] );
and(np_and_r, np, b[1]);
and(npandr_and_s,np_and_r , b[0] );
and(np_and_q, np, a[0]);
and(npandq_and_r,np_and_q, b[1] );
and(p_and_nr, a[1], nr);
or(npandrands_or_npandqandr ,npandr_and_s , npandq_and_r);
or(c[1], npandrands_or_npandqandr , p_and_nr);





// (p + q)
wire _p_or_q;
// (p + q  + s)
wire _porq_or_s;
// ( q + r ) 
wire _q_or_r;
// (p' + r )
wire _np_or_r;
// (p'+ r + s)
wire _nporr_or_s;
// (p + q  + s)( q + r )
wire _pqs_and_qr;
// (p' + r )(p'+ r + s)
wire _npr_and_nprs;
// p  a[0]
// q  a[1]
// r  b[0]
// s  b[1]
or(_p_or_q, a[1], a[0]);
or(_porq_or_s, _p_or_q , b[0]);

or(_q_or_r, a[0], b[1]);

or(_np_or_r, np, b[1]);

or(_nporr_or_s, _np_or_r, b[0]);

and(_pqs_and_qr, _porq_or_s , _q_or_r);//////////
and(_npr_and_nprs, _np_or_r, _nporr_or_s); 

and(c[0], _pqs_and_qr,_npr_and_nprs );


//c0 = (p + q  + s)( q + r )(p' + r )(p'+ r + s)

endmodule
