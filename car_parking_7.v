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
     4'b0000 : seg =7'b1000000;
     4'b0000 : seg =7'b1000000;
     4'b0000 : seg =7'b1000000;
     4'b0000 : seg =7'b1000000;
     4'b0000 : seg =7'b1000000;
     4'b0000 : seg =7'b1000000;
     4'b0000 : seg =7'b1000000;
     4'b0000 : seg =7'b1000000;
     4'b0000 : seg =7'b1000000;   
     endcase
     end
endmodule
