`timescale 1ns / 1ns

module encoder(y, x);

// Implement here

input wire[6:0] x;
output reg[2:0] y;

integer  count;
always @(x) begin
   count = x[0] + x[1] + x[2] + x[3] + x[4] + x[5] + x[6];
   if (count == 0) begin
        y = 3'b000;
     end
    else if (count == 1) begin
        y = 3'b001;
    end
    else if (count == 2) begin
        y = 3'b010;
    end
    else if (count == 3) begin
        y = 3'b011;
    end
    else if (count == 4) begin
        y = 3'b100;
    end
    else if (count == 5) begin
        y = 3'b101;
    end
    else if (count == 6) begin
        y = 3'b110;
    end
    else if (count == 7) begin
        y = 3'b111;
    end 
end

endmodule

module mux(z, y, s);

// Implement here

input wire[1:0] s;
input wire[2:0] y;
output reg z;

parameter   S0 = 2'b00;
            S1 = 2'b01;
            S2 = 2'b10;
            S3 = 2'b11;
always @(y,s) begin
    if (s == S0) begin
        if(y == 3'b000) begin
            z <= 1'b1;
        end
        else begin
            z <= 1'b0;
        end
    end
    else if (s == S1) begin
        if(y == 3'b001) begin
            z <= 1'b1;
        end
        else if(y == 3'b010) begin
            z <= 1'b1;
        end
        else if(y == 3'b100) begin
            z <= 1'b1;
        end
        else begin
            z <= 1'b0;
        end
    end
    else if (s == S2) begin
        if (y == 3'b011) begin
            z <= 1'b1;
        end
        else if (y == 3'b101) begin
            z <= 1'b1;
        end
        else if (y == 3'b110) begin
            z <= 1'b1;
        end
        else begin
            z <= 1'b0;
        end
    end
    else if (s == S3) begin
        if(y == 3'b111) begin
            z <= 1'b1;
        end
        else begin
            z <= 1'b0;
        end
    end
end

endmodule