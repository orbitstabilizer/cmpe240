`timescale 1ns / 1ns
module testbench();

reg [1:0] xx;
wire [1:0] ss;

source variable_name(ss, xx);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, ss, xx);
    	
	xx = 2'b10;
	#20;
	xx = 2'b01;
	#20;
	xx = 2'b10;
	#20;
	xx = 2'b11;
	#20;
	
    $finish;
end

endmodule
