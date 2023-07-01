`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/01 01:04:23
// Design Name: 
// Module Name: TB_xadc
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


module TB_xadc
#( PERIOD_DCLK = 100
 )
();
    reg reset_in = 1'b1;
    reg dclk_in = 1'b0;
    wire [15:0] temperature,
    vccint ,
    vccaux ,
    vccbram ,
    vauxp1_vauxn1 ,
    v_ref_p ,
    v_ref_n ;
    wire busy_out,
    drdy_out,
    eoc_out,
    eos_out,
    ot_out,
    vccaux_alarm_out,
    vccint_alarm_out,
    user_temp_alarm_out,
    alarm_out;
    //
    fsm_drp
    instance_of_fsm_drp
    (
        .dclk_in(dclk_in) ,
        .reset_in(reset_in) ,
        .vp_in(),.vn_in(),
        .vauxp1() , .vauxn1() ,
        .temperature(temperature) ,
        .vccint(vccint) ,
        .vccaux(vccaux) ,
        .vccbram(vccbram) ,
        .vauxp1_vauxn1(vauxp1_vauxn1) ,
        .v_ref_p(v_ref_p) ,
        .v_ref_n(v_ref_n) ,
        .busy_out(busy_out) ,
        .drdy_out(drdy_out) ,
        .eoc_out(eoc_out) ,
        .eos_out(eos_out) ,
        .ot_out(ot_out) ,
        .vccaux_alarm_out(vccaux_alarm_out) ,
        .vccint_alarm_out(vccint_alarm_out) ,
        .user_temp_alarm_out(user_temp_alarm_out) ,
        .alarm_out(alarm_out)
    );
    //
    initial
    begin
        reset_in = 1'b0;
        #10
         reset_in = 1'b1;
        #( 1_000_000_000 / 1_000_000 * 5 )
         reset_in = 1'b1;
        //        #( 1_000_000_000 / 1_000 * 5 )
        //        reset_in = 1'b1;
        //        #( 1_000_000_000 / 1_000 * 5 )
        //        reset_in = 1'b0;
    end
    always
    begin
        #( PERIOD_DCLK / 2 )
        dclk_in = ~dclk_in;
    end
endmodule
