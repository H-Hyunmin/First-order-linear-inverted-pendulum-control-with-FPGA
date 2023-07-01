`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/26 14:09:18
// Design Name: 
// Module Name: Abs
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


//Abs #( .M() , .N() , .ALGORITHM_ZERO() )
//instance_of_
//(
//    .original(),
//    .clk_algorithm(),
//    .sclr(),
//    .abs(),
//    .sign()
//);

module Abs #(parameter M = 15,N = 27,ALGORITHM_ZERO = 42'h0_00000_00000)
(
    input [(M+N-1):0] original,
    input clk_algorithm,
    input sclr,
    output [(M+N-1):0] abs,
    output reg sign = 1'b0
);
    wire add; //1'b0 means a - b , 1'b1 means a + b
    reg sign_next = 1'b0;
    assign add = ~original[( M + N - 1 )];

    Adder 
    instance_of_Adder_absolute_value 
    (
        .A(ALGORITHM_ZERO), // input wire [41 : 0] A
        .B(original), // input wire [41 : 0] B
        .CLK(clk_algorithm), // input wire CLK
        .ADD(add), // input wire ADD
        .SCLR(sclr), // input wire SCLR
        .S(abs) // output wire [41 : 0] S
    );
    always@(posedge clk_algorithm)
    begin
        sign_next <= original[( M + N - 1 )];
        sign <= sign_next;
    end
endmodule

