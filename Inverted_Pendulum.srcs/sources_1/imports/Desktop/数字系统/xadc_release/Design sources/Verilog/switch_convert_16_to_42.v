`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/02 19:03:48
// Design Name: 
// Module Name: switch_convert_16_to_42
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


module switch_convert_16_to_42
#(
    parameter M = 15,N = 27,
    CONSTANT_503_975 = 42'h0_0FBFC_CCCCC , CONSTANT_273_150 = 42'h0_08893_33333 ,
    CONSTANT_THREE = 42'h0_00180_00000
)
(
    input wire sclr ,
    input wire clk_algorithm ,
    //input wire clk_1Hz ,
    input wire [2:0] switch ,
    input wire [15:0] temperature,
    vccint,
    vccaux,
    vccbram,
    vauxp1_vauxn1,
    v_ref_p,
    v_ref_n,
    output reg [( M + N - 1 ):0] c
);
    wire [( M + N - 1 ):0] temperature_15_27 , temperature_15_27_kelvin , temperature_15_27_celsius ,
    vccint_15_27,vccint_15_27_times_3,
    vccaux_15_27,vccaux_15_27_times_3,
    vccbram_15_27,vccbram_15_27_times_3,
    vauxp1_vauxn1_15_27,
    v_ref_p_15_27,v_ref_p_15_27_times_3,
    v_ref_n_15_27,v_ref_n_15_27_times_3;
    assign temperature_15_27 = {{M{1'b0}} , temperature , {(N-16){1'b0}}};
    assign vccint_15_27 = {{M{1'b0}} , vccint , {(N-16){1'b0}}};
    assign vccaux_15_27 = {{M{1'b0}} , vccaux , {(N-16){1'b0}}};
    assign vccbram_15_27 = {{M{1'b0}} , vccbram , {(N-16){1'b0}}};
    assign vauxp1_vauxn1_15_27 = {{M{1'b0}} , vauxp1_vauxn1 , {(N-16){1'b0}}};
    assign v_ref_p_15_27 = {{M{1'b0}} , v_ref_p , {(N-16){1'b0}}};
    assign v_ref_n_15_27 = {{M{1'b0}} , v_ref_n , {(N-16){1'b0}}};
    //TEMPERATURE in celsius
    Multiplier
    instance_of_Multiplier_1
    (
        .CLK(clk_algorithm), // input wire CLK
        .A(temperature_15_27), // input wire [41 : 0] A
        .B(CONSTANT_503_975), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(temperature_15_27_kelvin) // output wire [41 : 0] P
    );
    Adder
    instance_of_Adder_1
    (
        .A(temperature_15_27_kelvin), // input wire [41 : 0] A
        .B(CONSTANT_273_150), // input wire [41 : 0] B
        .CLK(clk_algorithm), // input wire CLK
        .ADD(1'b0), // input wire ADD
        .SCLR(sclr), // input wire SCLR
        .S(temperature_15_27_celsius) // output wire [41 : 0] S
    );
    //VCCINT
    Multiplier
    instance_of_Multiplier_2
    (
        .CLK(clk_algorithm), // input wire CLK
        .A(vccint_15_27), // input wire [41 : 0] A
        .B(CONSTANT_THREE), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(vccint_15_27_times_3) // output wire [41 : 0] P
    );
    //VCCAUX
    Multiplier
    instance_of_Multiplier_3
    (
        .CLK(clk_algorithm), // input wire CLK
        .A(vccaux_15_27), // input wire [41 : 0] A
        .B(CONSTANT_THREE), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(vccaux_15_27_times_3) // output wire [41 : 0] P
    );
    //VCCBRAM
    Multiplier
    instance_of_Multiplier_4
    (
        .CLK(clk_algorithm), // input wire CLK
        .A(vccbram_15_27), // input wire [41 : 0] A
        .B(CONSTANT_THREE), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(vccbram_15_27_times_3) // output wire [41 : 0] P
    );
    //VAUXP1_VAUXN1

    //V_REF_P
    Multiplier
    instance_of_Multiplier_5
    (
        .CLK(clk_algorithm), // input wire CLK
        .A(v_ref_p_15_27), // input wire [41 : 0] A
        .B(CONSTANT_THREE), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(v_ref_p_15_27_times_3) // output wire [41 : 0] P
    );
    //V_REF_N
    Multiplier
    instance_of_Multiplier_6
    (
        .CLK(clk_algorithm), // input wire CLK
        .A(v_ref_n_15_27), // input wire [41 : 0] A
        .B(CONSTANT_THREE), // input wire [41 : 0] B
        .SCLR(sclr), // input wire SCLR
        .P(v_ref_n_15_27_times_3) // output wire [41 : 0] P
    );
    always@( * )
    begin
        case( switch )
            3'h0:
            c = temperature_15_27_celsius;
            3'h1:
            c = vccint_15_27_times_3;
            3'h2:
            c = vccaux_15_27_times_3 ;
            3'h3:
            c = vauxp1_vauxn1_15_27 ;
            3'h4:
            c = v_ref_p_15_27_times_3 ;
            3'h5:
            c = v_ref_n_15_27_times_3 ;
            3'h6:
            c = vccbram_15_27_times_3 ;
            default:
            c = 16'h0000;
        endcase
    end
//    always@( posedge clk_1Hz )
//    begin
//        c = c_fast;
//    end
endmodule
