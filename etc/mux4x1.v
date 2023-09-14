module mux4x1(S, I, O);
  input [3:0] I;
  input [1:0] S;

  output O;

  reg O;

  always @(I, S) begin
    if( S==0 ) begin
      O = I[0];
    end
    else if( S == 1)begin
      O = I[1];
    end
    else if( S == 2)begin
      O = I[2];
    end
    else begin
      O = I[3];
    end
  end

endmodule
