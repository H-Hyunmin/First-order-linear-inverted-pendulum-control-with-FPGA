`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 21:28:13
// Design Name: 
// Module Name: led
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


//led
//instance_of_led_1
//    (
//    .seg_selection(),
//    .led()
//);
module led
#(parameter ZERO = 4'h0,ONE = 4'h1,TWO = 4'h2,THREE = 4'h3,
    FOUR = 4'h4,FIVE = 4'h5,SIX = 4'h6,SEVEN = 4'h7,
    EIGHT = 4'h8,NINE = 4'h9,DECIMAL_POINT = 4'hA,
    BLANK = 4'hB,MINUS = 4'hC,FORWARD = 4'hD,BACKWARD = 4'hE
)
    (
    input [3:0] seg_selection,
    output reg [7:0] led
);
    always@(*)
    begin
        case(seg_selection)
            ZERO:
            led = 8'hFC;
            ONE:
            led = 8'h60;
            TWO:
            led = 8'hDA;
            THREE:
            led = 8'hF2;
            FOUR:
            led = 8'h66;
            FIVE:
            led = 8'hB6;
            SIX:
            led = 8'hBE;
            SEVEN:
            led = 8'hE0;
            EIGHT:
            led = 8'hFE;
            NINE:
            led = 8'hF6;
            DECIMAL_POINT:
            led = 8'h01;
            BLANK:
            led = 8'h00;
            MINUS:
            led = 8'h02;
            FORWARD:
            led = 8'h8E;
            BACKWARD:
            led = 8'h3E;
            default:
            led = 8'h00;
        endcase
    end
endmodule
