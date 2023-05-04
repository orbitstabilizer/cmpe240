`timescale 1ns / 1ns

module source(memory, instruction, r1, r2, r3, clk);

input wire [15:0] instruction;
input wire clk;
parameter 	S0  = 4'b0000,  //0000 r3 = instruction[11:4]  S0
            S1  = 4'b0001,  //0001 r3 = r1 == r2           S1
            S2  = 4'b0010,  //0010 r3 = r1 < r2            S2
            S3  = 4'b0011,  //0011 r3 = r1 <= r2           S3
            S4  = 4'b0100,  //0100 r3 = r1 | r2 (or)       S4
            S5  = 4'b1000,  //1000 r3 = r1 & r2 (and)      S5
            S6  = 4'b1001,  //1001 r3 = r1 ^ r2 (xor)      S6
            S7  = 4'b1010,  //1010 r3 = ~r1 (r2 is unused) S7
            S8  = 4'b1011,  //1011 r3 = r1 + r2            S8
            S9  = 4'b1100,  //1100 r3 = r1 - r2            S9
            S10 = 4'b1101,  //1101 r3 = r1 * r2            S10
            S11 = 4'b1110,  //1110 r3 = r1 / r2            S11
            S12 = 4'b1111;  //1111 r3 = r1 % r2            S12

integer i;
integer s;
		
output reg [127:0] memory;
output reg [7:0]r1,r2,r3;

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

	case(instruction[15:12])
    S0: begin //0000 r3 = instruction[11:4]  S0
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = instruction[11:4] >> s; // LSB
        s = s + 1;
      end 
    end
    S1: begin //0001 r3 = r1 == r2           S1
      r3 = r1 == r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end 
    end
    S2: begin //0010 r3 = r1 < r2            S2
      r3 = r1 < r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end 
    end
    S3: begin //0011 r3 = r1 <= r2           S3
      r3 = r1 <= r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end 
    end
    S4: begin //0100 r3 = r1 | r2 (or)       S4
      r3 = r1 | r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end 
    end
    S5: begin //1000 r3 = r1 & r2 (and)      S5
      r3 = r1 & r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end 
    end
    S6: begin //1001 r3 = r1 ^ r2 (xor)      S6
      r3 = r1 ^ r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end 
    end
    S7: begin //1010 r3 = ~r1 (r2 is unused) S7
      r3 = ~r1;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end
    end
    S8: begin //1011 r3 = r1 + r2            S8
      r3 = r1 + r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end
    end
    S9: begin //1100 r3 = r1 - r2            S9
      r3 = r1 - r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end
    end
    S10: begin //1101 r3 = r1 * r2            S10
      r3 = r1 * r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end
    end
    S11: begin //1110 r3 = r1 / r2            S11
      r3 = r1 / r2;
      s = 0;
      for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
        memory[i] = r3[s];
        s = s + 1;
      end
    end
    S12: begin //1111 r3 = r1 % r2            S12
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
