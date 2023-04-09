`timescale 1ns / 1ns

module encoder(y, x);

// Implement here

input wire[6:0] x;
output reg[2:0] y;

always @(x) begin
   y <= x[0] + x[1] + x[2] + x[3] + x[4] + x[5] + x[6];
end

endmodule

module mux(z, y, s);


input wire[1:0] s;
input wire[2:0] y;
output reg z;

integer i;
always @(y,s) begin

    for (i = 0; i < 4; i++) begin
      if (s == i) begin
        if (y[0] + y[1] + y[2] == i)
          z <= 1'b1;
        else
          z <= 1'b0;
      end

    end
end

endmodule
