
module combo ( input a, b, c, d, output reg z);
  always @ (a or b or c or d) begin
    z = (a & b) | (c & d);
  end
endmodule
