`timescale 1ns / 1ns

// Put the last sequence you have tried below.
// parameter inputseq = 64'b0000000000000000000000000000000000000000000000000000000000000000;

module source(y, stateReg, nextStateReg, x, rst, clk);

//You are going to implement a Moore Machine to detect input sequences 001 and 110. The source module receives input x continuously. 
//For each positive edge of the clock, the module reads the value of x, either 0 or 1. Whenever the last three read values are 001 or 110, 
//the value of the output y becomes 1. For any other input sequences, the value of y becomes 0. You can implement the system with seven states. 
//One of them is the initial state, three of them recognize 001, and the other three of them recognize 110. You need to draw proper arcs for the values of x.

//For example, input sequence 00110011 makes the value of y 00010101.

input wire x;
input wire rst;
input wire clk;

parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110;
// S0 initial state
// S1 has read 0
// S2 has read 00
// S3 has read 001
// S4 has read 1
// S5 has read 11
// S6 has read 110

output reg y;
output reg[2:0] stateReg;
output reg[2:0] nextStateReg;


always @(stateReg, x) begin
    case (stateReg)
        S0: begin // initial state
            y <= 1'b0;
            if (x) begin
                nextStateReg <= S4;
            end 
            else begin
                nextStateReg <= S1;
            end
        end
        S1: begin
            y <= 1'b0;
            if (x) begin
                nextStateReg <= S4;
            end 
            else begin
                nextStateReg <= S2;
            end
        end
        S2: begin
            y <= 1'b0;
            if (x) begin
                nextStateReg <= S3;
            end 
            else begin
                nextStateReg <= S2;
            end
        end
        S3: begin
            y <= 1'b1;
            if (x) begin
                nextStateReg <= S5;
            end 
            else begin
                nextStateReg <= S1;
            end
        end
        S4: begin
            y <= 1'b0;
            if (x) begin
                nextStateReg <= S5;
            end else begin
                nextStateReg <= S1;
            end
        end
        S5: begin
            y <= 1'b0;
            if (x) begin
                nextStateReg <= S5;
            end else begin
                nextStateReg <= S6;
            end
        end
        S6: begin
            y <= 1'b1;
            if (x) begin
                nextStateReg <= S4;
            end 
            else begin
                nextStateReg <= S2;
            end
        end
    endcase
end

always@(posedge clk) begin
	if(rst) begin
		stateReg <= S0;
	end
	else begin
		stateReg <= nextStateReg;
	end
end

endmodule

