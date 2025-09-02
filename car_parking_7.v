`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2025 09:49:33 AM
// Design Name: 
// Module Name: car_parking_7
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


module car_parking_7(
    input [7:0] car,
    output [6:0] seg,
    output [7:0] AN
    );
    reg [3:0] num ;
    reg [6:0] seg;
    always@(car)
        num = car[7] + car[6] + car[5]+ car[4]+ car[3] +car[2] + car[1] +car[0];
        assign AN = 7'b1000000;
        
     always@(num)
     begin
     case(num)
     4'd0: seg = 7'b1000000; 
            4'd1: seg = 7'b1111001; 
            4'd2: seg = 7'b0100100; 
            4'd3: seg = 7'b0110000; 
            4'd4: seg = 7'b0011001; 
            4'd5: seg = 7'b0010010; 
            4'd6: seg = 7'b0000010; 
            4'd7: seg = 7'b1111000; 
            4'd8: seg = 7'b0000000; 
            4'd9: seg = 7'b0010000; 
            default: seg = 7'b1111111;  
     endcase
     end
endmodule
