`timescale 1ns / 1ns
module testbench();

reg pp;
reg qq;
reg rr;
reg ss;
wire tt;

source name(tt, pp, qq, rr, ss);

initial begin
    $dumpfile("TimingDiagram_Pos.vcd");
    $dumpvars(0, tt, pp, qq, rr, ss);
    	
	pp = 1'b0;
	qq = 1'b0;
	rr = 1'b0;
	ss = 1'b0;
	#20;
	pp = 1'b0;
	qq = 1'b0;
	rr = 1'b0;
	ss = 1'b1;
	#20;
	pp = 1'b0;
	qq = 1'b0;
	rr = 1'b1;
	ss = 1'b0;
	#20;
	pp = 1'b0;
	qq = 1'b0;
	rr = 1'b1;
	ss = 1'b1;
	#20;
	pp = 1'b0;
	qq = 1'b1;
	rr = 1'b0;
	ss = 1'b0;
	#20;
	pp = 1'b0;
	qq = 1'b1;
	rr = 1'b0;
	ss = 1'b1;
	#20;
	pp = 1'b0;
	qq = 1'b1;
	rr = 1'b1;
	ss = 1'b0;
	#20;
	pp = 1'b0;
	qq = 1'b1;
	rr = 1'b1;
	ss = 1'b1;
	#20;
	pp = 1'b1;
	qq = 1'b0;
	rr = 1'b0;
	ss = 1'b0;
	#20;
	pp = 1'b1;
	qq = 1'b0;
	rr = 1'b0;
	ss = 1'b1;
	#20;
	pp = 1'b1;
	qq = 1'b0;
	rr = 1'b1;
	ss = 1'b0;
	#20;
	pp = 1'b1;
	qq = 1'b0;
	rr = 1'b1;
	ss = 1'b1;
	#20;
	pp = 1'b1;
	qq = 1'b1;
	rr = 1'b0;
	ss = 1'b0;
	#20;
	pp = 1'b1;
	qq = 1'b1;
	rr = 1'b0;
	ss = 1'b1;
	#20;
	pp = 1'b1;
	qq = 1'b1;
	rr = 1'b1;
	ss = 1'b0;
	#20;
	pp = 1'b1;
	qq = 1'b1;
	rr = 1'b1;
	ss = 1'b1;
	#20;

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