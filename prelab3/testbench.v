`timescale 1ns/1ns
module testbench();
wire  y;
wire [2:0] cs;
wire [2:0] ns;
reg x;
reg rst;
reg clk;
parameter inputseq = 64'b001100110011001010011010110110101000100010111101101010110010011;
integer i;

source s(y, cs, ns, x, rst, clk);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, y, cs, ns, x, rst, clk);
    
    rst = 1;
    x = 0;
    #20;
    rst = 0;
    
    for (i=63; i>=0; i--) begin
        x = inputseq[i];
        #20;
    end
    
    $finish;
end

always begin	
	clk = 1;
	#10;
	clk = 0;
	#10;
end

endmodule
