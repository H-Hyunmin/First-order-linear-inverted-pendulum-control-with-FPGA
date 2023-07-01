`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/07 20:51:50
// Design Name: 
// Module Name: pid_top
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


module pid_top(
    input clk,
    input elevel_rst,
    input rst,
    input [23:0]elevel,
    input [15:0]kp,
    input [15:0]ki,
    input [15:0]kd,
    output  pos,
    output  neg,
    output [32:0]ila_t,
    output ila_np
    );
    wire [32:0]t;
    wire np;
    assign ila_np=np;
    assign ila_t=t;
    pendulum pendulum(clk,rst,elevel_rst,elevel,kp,ki,kd,t,np);
    pwm pwm(clk,rst,t,np,pos,neg);
endmodule
