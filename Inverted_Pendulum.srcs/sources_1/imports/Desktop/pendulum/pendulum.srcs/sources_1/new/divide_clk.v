`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/26 10:15:58
// Design Name: 
// Module Name: divide_clk
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


module divide_clk(
    input in_clk,
    input rst,
    output reg clk
    );
    parameter n=511;
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
