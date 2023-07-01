`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/02 12:01:03
// Design Name: 
// Module Name: pwm
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


module pwm(
    input in_clk,
    input rst,
    input [32:0]t,
    input np,
    output reg pos,
    output reg neg
    );
    reg [10:0]count;
    reg [10:0]tt;
    reg [31:0]ttt;
    wire clk;
    divide_clk u2(in_clk,rst,clk);
    always @(posedge clk) begin//remember to modify it in the end
        if(!rst) begin count<=0;neg<=0;pos<=0; end
        else begin
        count<=count+1;
        if(count==256)
            count<=0;
        if(count<tt+1)begin
            if(np==1'b0)begin
               pos<=1'b1;
               neg<=1'b0;
            end
            else begin
                pos<=1'b0;
                neg<=1'b1;
            end
        end
        else begin
            pos<=1'b0;
            neg<=1'b0;
        end
        end
    end
    always @(t) begin
        ttt=t[31:0];
        tt=0;    
        repeat(256) begin
            if(ttt>15'b100000000000000) begin
                ttt=ttt-15'b100000000000000;
                tt=tt+1;
            end
        end
        tt=tt+1;
    end
endmodule
