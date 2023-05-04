`timescale 1ns / 1ns

module source(memory, instruction, r1, r2, r3, clk);

input wire [15:0] instruction;
input wire clk;
parameter 	S0 = 4'b0000,
			S1 = 4'b0001,
			S2 = 4'b0010,
			S3 = 4'b0011,
			S4 = 4'b0100,
			S5 = 4'b1000,
			S6 = 4'b1001,
			S7 = 4'b1010,
            S8 = 4'b1011,
            S9 = 4'b1100,
            S10 = 4'b1101,
            S11 = 4'b1110,
            S12 = 4'b1111;

integer i;
integer s;
		
output reg [127:0] memory;
output reg [7:0]r1;
output reg [7:0]r2;
output reg [7:0]r3;

initial begin
	memory = 0;
	r1 = 0;
	r2 = 0;
	r3 = 0;
end

always@(posedge clk) begin
	// Read the first operand from the memory.
	s = 0;
	for (i = instruction[11:8] * 8; i < (instruction[11:8] * 8) + 8; i++) begin
		r1[s] = memory[i];
		s = s + 1;
	end
	// Read the second operand from the memory.
	s = 0;
	for (i = instruction[7:4] * 8; i < (instruction[7:4] * 8) + 8; i++) begin
		r2[s] = memory[i];
		s = s + 1;
	end
	//0000 r3 = instruction[11:4]  S0
    //0001 r3 = r1 == r2           S1
    //0010 r3 = r1 < r2            S2
    //0011 r3 = r1 <= r2           S3
    //0100 r3 = r1 | r2 (or)       S4
    //1000 r3 = r1 & r2 (and)      S5
    //1001 r3 = r1 ^ r2 (xor)      S6
    //1010 r3 = ~r1 (r2 is unused) S7
    //1011 r3 = r1 + r2            S8
    //1100 r3 = r1 - r2            S9
    //1101 r3 = r1 * r2            S10
    //1110 r3 = r1 / r2            S11
    //1111 r3 = r1 % r2            S12
	case(instruction[15:12])
		S0: begin
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = instruction[11:4] >> s;
				s = s + 1;
			end 
		end
		S1: begin
            r3 = r1 == r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S2: begin
            r3 = r1 < r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S3: begin
            r3 = r1 <= r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S4: begin
            r3 = r1 | r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S5: begin
			r3 = r1 & r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S6: begin
			r3 = r1 ^ r2;
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S7: begin
            r3 = ~r1;
            s = 0;
            for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
                memory[i] = r3[s];
                s = s + 1;
            end
		end
        S8: begin
            r3 = r1 + r2;
            s = 0;
            for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
                memory[i] = r3[s];
                s = s + 1;
            end
        end
        S9: begin
            r3 = r1 - r2;
            s = 0;
            for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
                memory[i] = r3[s];
                s = s + 1;
            end
        end
        S10: begin
            r3 = r1 * r2;
            s = 0;
            for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
                memory[i] = r3[s];
                s = s + 1;
            end
        end
        S11: begin
            r3 = r1 / r2;
            s = 0;
            for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
                memory[i] = r3[s];
                s = s + 1;
            end
        end
        S12: begin
            r3 = r1 % r2;
            s = 0;
            for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
                memory[i] = r3[s];
                s = s + 1;
            end
        end
	endcase
end

endmodule
