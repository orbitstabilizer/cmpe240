`timescale 1ns / 1ns

// Put the last sequence you have tried below.
// parameter inputseq = 64'b0000000000000000000000000000000000000000000000000000000000000000;

module source(y, stateReg, nextStateReg, x, rst, clk);

  input wire x, rst, clk;
  output reg [2:0] nextStateReg, stateReg;
  output reg y;

  parameter START = 3'b000,
            S1    = 3'b001,
            S2    = 3'b010,
            S3    = 3'b011,
            T1    = 3'b101,
            T2    = 3'b110,
            T3    = 3'b111;

  always@(stateReg, x) begin
    case(stateReg) 
      START : begin 
                y<= 0;
                if (x == 0) 
                  nextStateReg <= S1;
                else
                  nextStateReg <= T1;
              end

      S1    : begin 
                y<= 0;
                if (x == 0) 
                  nextStateReg <= S2;
                else
                  nextStateReg <= T1;
              end

      S2    : begin 
                y<= 0;
                if (x == 1) 
                  nextStateReg <= S3;
                else
                  nextStateReg <= S2;
             
              end

      S3    : begin 
                y<= 1;
                if (x == 1) 
                  nextStateReg <= T2;
                else
                  nextStateReg <= S1;
              end

      T1    : begin 
                y<= 0;
                if (x == 1) 
                  nextStateReg <= T2;
                else
                  nextStateReg <= S1;
             end

      T2    : begin 
                y<= 0;
                if (x == 0) 
                  nextStateReg <= T3;
                else
                  nextStateReg <= T2;
              end

      T3    : begin 
                y<= 1;
                if (x == 0) 
                  nextStateReg <= S2;
                else
                  nextStateReg <= T1;
              end

    endcase

  end

  always@(posedge clk)begin
    if(rst) 
		  stateReg <= START;
    else 
      stateReg <= nextStateReg;
  end
  


endmodule
