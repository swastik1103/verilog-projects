`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2025 08:46:08 AM
// Design Name: 
// Module Name: ALU_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] opcode,
    output reg [7:0] Y,
    output reg       carry,     
    output reg [7:0] mul_hi     
);
    reg  [8:0] addsub9;
    reg [15:0] prod16;

    always @* begin
        // safe defaults
        Y       = 8'h00;
        carry   = 1'b0;
        mul_hi  = 8'h00;

        case (opcode)
            3'b000: begin // ADD
                addsub9 = {1'b0, A} + {1'b0, B};
                Y       = addsub9[7:0];
                carry   = addsub9[8];
            end
            3'b001: begin // SUB  (A - B), carry=borrow
                addsub9 = {1'b0, A} + {1'b0, ~B} + 9'd1; // A + (~B) + 1
                Y       = addsub9[7:0];
                carry   = ~addsub9[8]; // 1 means borrow occurred? Choose convention:
                // If you prefer carry=borrow, uncomment below and comment above:
                // carry = (A < B);
            end
            3'b010: begin // MUL
                prod16 = A * B;
                Y      = prod16[7:0];
                mul_hi = prod16[15:8];
            end
            3'b011: begin // LSH A<<1
                Y     = A << 1;
                carry = A[7]; // bit shifted out (optional)
            end
            3'b100: begin // RSH A>>1
                Y     = A >> 1;
                carry = A[0]; // bit shifted out (optional)
            end
            3'b101: Y = A & B;        // AND
            3'b110: Y = A | B;        // OR
            3'b111: Y = A ^ B;        // XOR
            default: Y = 8'h00;
        endcase
    end
endmodule


