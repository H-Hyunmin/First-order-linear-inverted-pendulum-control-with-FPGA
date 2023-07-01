`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/26 13:51:48
// Design Name: 
// Module Name: hex_to_bcd
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


//hex_to_bcd #( .M() , .N() ,
//    .BCD_M() , .BCD_N() ,
//    .CONSTANT_ONE_TENTH() , .CONSTANT_TEN() ,
//    .ALGORITHM_ZERO(),
//    .ABS_INT() , .ABS_DECIMAL())
//instance_hex_to_bcd
//(
//    .c(),
//    .clk_algorithm(),
//    .sclr(),
//    .c_bcd(),
//    .sign()
//);
module hex_to_bcd #(parameter M = 15,N = 27 ,
    BCD_M = 4 , BCD_N = 2 ,
    CONSTANT_ONE_TENTH = 42'h0_0000C_CCCCD , CONSTANT_TEN = 42'h0_00500_00000 ,
    ALGORITHM_ZERO = 42'h0_00000_00000 ,
    ABS_INT = 42'h3_FFF80_00000 , ABS_DECIMAL = 42'h0_0007F_FFFFF )
(
    input [ ( M + N - 1 ):0] c,
    input clk_algorithm,
    input sclr,
    output reg [4*( BCD_M + BCD_N + 1 ) - 1:0] c_bcd = 'h0
);
    wire [ ( M + N - 1 ):0] c_abs_wire,
    multiplier_one_tenth_1_product_wire,
    multiplier_one_tenth_2_product_wire,
    multiplier_one_tenth_3_product_wire,
    multiplier_one_tenth_4_product_wire,
    multiplier_ten_1_product_wire,
    multiplier_ten_2_product_wire,
    multiplier_ten_3_product_wire,
    multiplier_ten_4_product_wire,
    multiplier_ten_5_product_wire,
    multiplier_ten_6_product_wire;
    reg [3:0] direction = 'h0,
    thousands = 'h0,
    hundreds = 'h0,
    tens = 'h0,
    ones = 'h0,
    deciles = 'h0,
    percentiles = 'h0;
    wire sign_wire;
    //Abs
    Abs #( .M(M) , .N(N) , .ALGORITHM_ZERO(ALGORITHM_ZERO) )
    instance_of_Abs
    (
        .original(c),
        .clk_algorithm(clk_algorithm),
        .sclr(sclr),
        .abs(c_abs_wire),
        .sign(sign_wire)
    );
    //    Multiplier_one_tenth_1
    Multiplier
    instance_of_Multiplier_one_tenth_1
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( c_abs_wire & ABS_INT ), // input wire [41 : 0] A
        .B(CONSTANT_ONE_TENTH), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_one_tenth_1_product_wire) // output wire [41 : 0] P
    );

    //    Multiplier_one_tenth_ 
    Multiplier
    instance_of_Multiplier_one_tenth_2
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( multiplier_one_tenth_1_product_wire & ABS_INT ), // input wire [41 : 0] A
        .B(CONSTANT_ONE_TENTH), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_one_tenth_2_product_wire) // output wire [41 : 0] P
    );
    //   Multiplier_one_tenth_3
    Multiplier
    instance_of_Multiplier_one_tenth_3
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( multiplier_one_tenth_2_product_wire & ABS_INT ), // input wire [41 : 0] A
        .B(CONSTANT_ONE_TENTH), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_one_tenth_3_product_wire) // output wire [41 : 0] P
    );
    //   Multiplier_one_tenth_4
    Multiplier
    instance_of_Multiplier_one_tenth_4
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( multiplier_one_tenth_3_product_wire & ABS_INT ), // input wire [41 : 0] A
        .B(CONSTANT_ONE_TENTH), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_one_tenth_4_product_wire) // output wire [41 : 0] P
    );
    //  Multiplier_ten_1
    Multiplier
    instance_of_Multiplier_ten_1
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( multiplier_one_tenth_1_product_wire & ABS_DECIMAL ), // input wire [41 : 0] A
        .B(CONSTANT_TEN), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_ten_1_product_wire) // output wire [41 : 0] P
    );
    //   Multiplier_ten_2
    Multiplier
    instance_of_Multiplier_ten_2
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( multiplier_one_tenth_2_product_wire & ABS_DECIMAL ), // input wire [41 : 0] A
        .B(CONSTANT_TEN), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_ten_2_product_wire) // output wire [41 : 0] P
    );
    //    Multiplier_ten_3
    Multiplier
    instance_of_Multiplier_ten_3
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( multiplier_one_tenth_3_product_wire & ABS_DECIMAL ), // input wire [41 : 0] A
        .B(CONSTANT_TEN), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_ten_3_product_wire) // output wire [41 : 0] P
    );
    //    Multiplier_ten_4
    Multiplier
    instance_of_Multiplier_ten_4
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( multiplier_one_tenth_4_product_wire & ABS_DECIMAL ), // input wire [41 : 0] A
        .B(CONSTANT_TEN), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_ten_4_product_wire) // output wire [41 : 0] P
    );
    //    Multiplier_ten_5
    Multiplier
    instance_of_Multiplier_ten_5
    (
        .CLK(clk_algorithm), // input wire CLK
        .A( c_abs_wire & ABS_DECIMAL ), // input wire [41 : 0] A
        .B(CONSTANT_TEN), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_ten_5_product_wire) // output wire [41 : 0] P
    );
    //   Multiplier_ten_6   
    Multiplier 
    instance_of_Multiplier_ten_6 
    (
        .CLK(clk_algorithm), // input wire CLK
        .A(multiplier_ten_5_product_wire & ABS_DECIMAL), // input wire [41 : 0] A
        .B(CONSTANT_TEN), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(multiplier_ten_6_product_wire) // output wire [41 : 0] P
    );
    //    assign direction = sign_wire ? 4'h1 : 4'h0;
    //    assign thousands = multiplier_ten_4_product_wire[(N+3):N] ;
    //    assign hundreds = multiplier_ten_3_product_wire[(N+3):N] ;
    //    assign tens = multiplier_ten_2_product_wire[(N+3):N] ;
    //    assign ones = multiplier_ten_1_product_wire[(N+3):N] ;
    //    assign deciles = multiplier_ten_5_product_wire[(N+3):N] ;
    //    assign percentiles = multiplier_ten_6_product_wire[(N+3):N] ;
    //    assign c_bcd = { direction , thousands , hundreds , tens , ones , deciles , percentiles };
    // Define delay-variables to eliminate glitches
    reg sign_1 = 1'b0,
    sign_2 = 1'b0,
    sign_3 = 1'b0,
    sign_4 = 1'b0,
    sign_5 = 1'b0;
    reg [3:0] hundreds_1 = 4'h0;
    reg [3:0] tens_1 = 4'h0,
    tens_2 = 4'h0;
    reg [3:0] ones_1 = 4'h0,
    ones_2 = 4'h0,
    ones_3 = 4'h0;
    reg [3:0] deciles_1 = 4'h0,
    deciles_2 = 4'h0,
    deciles_3 = 4'h0,
    deciles_4 = 4'h0;
    reg [3:0] percentiles_1 = 4'h0,
    percentiles_2 = 4'h0,
    percentiles_3 = 4'h0;
    always@(posedge clk_algorithm)
    begin
        //-------------Define delay-variables to eliminate glitches-------------
        sign_1 <= sclr ? 'b0 : sign_wire;
        sign_2 <= sclr ? 'b0 : sign_1;
        sign_3 <= sclr ? 'b0 : sign_2;
        sign_4 <= sclr ? 'b0 : sign_3;
        sign_5 <= sclr ? 'b0 : sign_4;
        direction <= sign_5 ? 4'h1 : 4'h0;
        //
        thousands <= sclr ? 'b0 : multiplier_ten_4_product_wire[(N+3):N] ;
        //
        hundreds_1 <= sclr ? 'b0 : multiplier_ten_3_product_wire[(N+3):N] ;
        hundreds <= sclr ? 'b0 : hundreds_1;
        //
        tens_1 <= sclr ? 'b0 : multiplier_ten_2_product_wire[(N+3):N] ;
        tens_2 <= sclr ? 'b0 : tens_1;
        tens <= sclr ? 'b0 : tens_2;
        //
        ones_1 <= sclr ? 'b0 : multiplier_ten_1_product_wire[(N+3):N] ;
        ones_2 <= sclr ? 'b0 : ones_1;
        ones_3 <= sclr ? 'b0 : ones_2;
        ones <= sclr ? 'b0 : ones_3;
        //
        deciles_1 <= sclr ? 'b0 : multiplier_ten_5_product_wire[(N+3):N] ;
        deciles_2 <= sclr ? 'b0 : deciles_1;
        deciles_3 <= sclr ? 'b0 : deciles_2;
        deciles_4 <= sclr ? 'b0 : deciles_3;
        deciles <= sclr ? 'b0 : deciles_4;
        //
        percentiles_1 <= sclr ? 'b0 : multiplier_ten_6_product_wire[(N+3):N] ;
        percentiles_2 <= sclr ? 'b0 : percentiles_1;
        percentiles_3 <= sclr ? 'b0 : percentiles_2;
        percentiles <= sclr ? 'b0 : percentiles_3;
        //------------------------------------------------------------------------
        c_bcd <= { direction , thousands , hundreds , tens , ones , deciles , percentiles };
    end
endmodule
