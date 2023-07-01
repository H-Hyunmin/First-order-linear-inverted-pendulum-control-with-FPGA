`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/07 20:11:11
// Design Name: 
// Module Name: clk_divide128
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


module clk_divide128(
    input in_clk,
    input rst,
    output reg clk
    );
    parameter n=127;
    reg [9:0]count;
    always @(posedge in_clk) begin
        if(!rst) begin count<=0; clk<=0; end
        else begin
            if(count==n) begin
                clk<=~clk;
                count<=0;
            end
            else
                count<=count+1;
        end
    end
endmodule
