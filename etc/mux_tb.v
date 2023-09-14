`timescale 1ns/1ns


module mux_tb;

reg [3:0] i;
reg [1:0] s;

wire o;

integer m, n;

mux4x1 mux(
    .I(i),
    .S(s),
    .O(o)
);

initial begin
  $dumpfile("mux_tb.vcd");
  $dumpvars(0, i, s, o);
  for (n = 0; n < 4; n = n + 1)
  begin
    for (m = 0; m < 16; m = m + 1)
    begin
      i <= m;
      s <= n;
      #10;
    end
  end

end

endmodule
