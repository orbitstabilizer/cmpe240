
module test();

integer a,b;
initial begin
   a = 0;
   b = 0;
   a <= 2;
   b <= a;
   #1;
   $display("a = %d, b = %d", a, b);
end


endmodule
