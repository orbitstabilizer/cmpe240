`timescale 1ns / 1ns

module testbench();


reg [6:0] x;
wire [2:0] y;
encoder enc( .y(y), .x(x) );

reg [2:0] ym;
reg [1:0] sm;
wire zm;
mux mux( .z(zm), .y(ym), .s(sm) );
integer i,j;
initial begin
  $dumpfile("TimingDiagram.vcd");
  $dumpvars(0, y, x, ym, sm, zm);
  x <= 7'b0000000;
  #10 x <= 7'b0100001;
  #10 x <= 7'b1000010;
  #10 x <= 7'b1100011;
  #10 x <= 7'b0000100;
  #10 x <= 7'b0100101;
  #10 x <= 7'b1110110;
  #10 x <= 7'b1110111;
  #10 x <= 7'b1111000;

end
initial begin
    for (i =0 ; i< 8 ; i++) begin
    for (j = 0 ; j< 4 ; j++) begin
        ym <= i;
        sm <= j;
        #10;
      end
  end
  $finish;
end
  

endmodule
