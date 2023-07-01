`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/02 03:42:18
// Design Name: 
// Module Name: top_module
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


module top_module
#( parameter F_CLK_SYS = 100_000_000 ,
    F_CLK_LED = 1000 , F_CLK_ALGORITHM = 2_000_000 , F_DCLK = 10_000_000 , F_CLK_1Hz = 1 ,
    M = 15 , N = 27
)
(
    input wire clk_sys,
    input wire rst_n,
    input wire elevel_rst,
    input wire vp_in , vn_in , vauxp1 , vauxn1 ,vauxp2 , vauxn2 , vauxp3 , vauxn3 ,
 //   input wire [2:0] switch,
    
    output wire [7:0] bit_selection,
    output wire [7:0] led_1_seg_selection,
    output wire [7:0] led_0_seg_selection,
  //  output reg  [15:0] cout,

    output  pos,
    output  neg,
    
  //vga+blue  
  
      output hsync,vsync,
  output [3:0]vga_r,vga_g,vga_b,
  
   input  rst_pin,        // Active HIGH reset (from pin)
 
   // RS232 signals
  input            rxd_pin,        // RS232 RXD pin
   output           txd_pin,        // RS232 RXD pin

   input            lb_sel_pin,     // Loopback selector 
   //BT 
     output bt_pw_on,
     output bt_master_slave,
     output bt_sw_hw,
     output bt_rst_n,
     output bt_sw,
     input  [5:0]  sw_pin,
     input [2:0] switch,
    
    
    input [2:0] WAVE_ADJUST
    
);

    wire [32:0]ila_t;
    wire ila_np;
    wire [15:0]kp;
    wire [15:0]ki;
    wire [15:0]kd;

    wire dclk_in_10MHz , clk_algorithm_wire , clk_led_wire , clk_1Hz,eos ;
    wire [23:0] vaux2,vaux3;
    wire [15:0] temperature,
    vccint,
    vccaux,
    vccbram,
    vauxp1_vauxn1,
    v_ref_p,  //vaux2
    v_ref_n;  //vaux3
    wire [3:0] direction,
    thousands,
    hundreds,
    tens,
    ones,
    deciles,
    percentiles;
    reg [15:0] word_to_display = 'h0;
    wire [( M + N - 1 ):0] c;
    wire [3:0] seg_selection_1,seg_selection_0;
    //10MHz dclk_in
    clk_division #(.F_CLK_SYS( F_CLK_SYS ) , .F_CLK_DIVISION( F_DCLK ) )
    instance_of_dclk_in
    (
        .ena( 1'b1 ),
        .clk_in( clk_sys ),
        .clk_out( dclk_in_10MHz )
    );
    //---------------------------------------------------------------------------------
    fsm_drp
    instance_of_fsm_drp
    (
        .dclk_in(dclk_in_10MHz) ,
        .reset_in( ~rst_n ) ,
        .vp_in(vp_in) ,
        .vn_in(vn_in) ,
        .vauxp1(vauxp1) ,
        .vauxn1(vauxn1) ,
        .vauxp2(vauxp2) ,
        .vauxn2(vauxn2) ,
        .vauxp3(vauxp3) ,
        .vauxn3(vauxn3) ,
        .temperature(temperature) ,
        .vccint(vccint) ,
        .vccaux(vccaux) ,
        .vccbram(vccbram) ,
        .vauxp1_vauxn1(vauxp1_vauxn1) ,
        .v_ref_p(v_ref_p) , //vauxp_vauxn2
        .v_ref_n(v_ref_n) , //vauxp_vauxn3
        .busy_out() ,
        .drdy_out() ,
        .eoc_out() ,
        .eos_out(eos) ,
        .ot_out() ,
        .vccaux_alarm_out() ,
        .vccint_alarm_out() ,
        .user_temp_alarm_out() ,
        .alarm_out()
    );

    //---------------------------------------------------------------------------------
    clk_division #(.F_CLK_SYS(F_CLK_SYS) , .F_CLK_DIVISION(F_CLK_ALGORITHM) )
    instance_clk_algorithm
    (
        .ena( 1'b1 ),
        .clk_in( clk_sys ),
        .clk_out( clk_algorithm_wire )
    );
    //
    switch_convert_16_to_42
    instance_of_switch_convert_16_to_42
    (
        .sclr( ~rst_n ) ,
        .clk_algorithm( clk_algorithm_wire ) ,
        .switch( switch ) ,
        .temperature( temperature ),
        .vccint( vccint ) ,
        .vccaux( vccaux ) ,
        .vccbram( vccbram ) ,
        .vauxp1_vauxn1( vauxp1_vauxn1 ),
        .v_ref_p( v_ref_p ) ,
        .v_ref_n( v_ref_n ) ,
        .c( c )
    );
    /////////////////////////////////////////////////////////////////////////////////////
    hex_to_bcd
    instance_of_hex_to_bcd
    (
        .c( c ),
        .clk_algorithm( clk_algorithm_wire ),
        .sclr( ~rst_n ), //1'b0),
        .c_bcd(
        {
        direction,
        thousands,
        hundreds,
        tens,
        ones,
        deciles,
        percentiles
        }
        )
    );
    //---------------------------------------------------------------------------------
    clk_division #(.F_CLK_SYS(F_CLK_SYS) , .F_CLK_DIVISION(F_CLK_LED) )
    instance_clk_led
    (
        .ena( 1'b1 ),
        .clk_in( clk_sys ),
        .clk_out( clk_led_wire )
    );
    reg [3:0] direction_1Hz = 'h0,
    thousands_1Hz = 'h0,
    hundreds_1Hz = 'h0,
    tens_1Hz = 'h0,
    ones_1Hz = 'h0,
    deciles_1Hz = 'h0,
    percentiles_1Hz = 'h0;
    //1Hz clk
    clk_division #(.F_CLK_SYS( F_CLK_SYS ) , .F_CLK_DIVISION( F_CLK_1Hz ) )
    instance_of_CLK_1
    (
        .ena( 1'b1 ),
        .clk_in( clk_sys ),
        .clk_out( clk_1Hz )
    );
    always@( posedge clk_1Hz )
    begin
        direction_1Hz <= direction;
        thousands_1Hz <= thousands;
        hundreds_1Hz <= hundreds;
        tens_1Hz <= tens;
        ones_1Hz <= ones;
        deciles_1Hz <= deciles;
        percentiles_1Hz <= percentiles;
    end
    //---------------------------------------------------------------------------------
    seg_selection
    instance_of_seg_selection
    (
        .ena( 1'b1 ),
        .clk_in( clk_led_wire ),
        .display_mode( 1'b0 ), //from fsm_interface 1'b1 means manaul,1'b0 means holding
        .direction( direction_1Hz ),
        .thousands( thousands_1Hz ),
        .hundreds( hundreds_1Hz ),
        .tens( tens_1Hz ),
        .ones( ones_1Hz ),
        .deciles( deciles_1Hz ),
        .percentiles( percentiles_1Hz ),
        .seg_selection_1( seg_selection_1 ),
        .seg_selection_0( seg_selection_0 ),
        .bits_selection( bit_selection ) //"bits selection"
    );
    //---------------------------------------------------------------------------------
    led
    instance_of_led_1
    (
        .seg_selection( seg_selection_1 ),
        .led( led_1_seg_selection )
    );
    //---------------------------------------------------------------------------------
    led
    instance_of_led_0
    (
        .seg_selection( seg_selection_0 ),
        .led( led_0_seg_selection )
    );
    
    
   pid_top instance_of_pid(
        .clk(clk_sys),
        .rst(rst_n),
        .elevel_rst(elevel_rst),
        .elevel(vaux2),
        .kp(kp),
        .ki(ki),
        .kd(kd),
        .pos(pos),
        .neg(neg),
        .ila_t(ila_t),
        .ila_np(ila_np)
        );
    
    
    
    
    
        assign vaux2={8'b00000000,v_ref_p};
        assign vaux3={8'b00000000,v_ref_n};
    
    
    
    
ila_0 instance_of_led (
        .clk(clk_sys), // input wire clk
        .probe0(temperature), // input wire [15:0]  probe0  
        .probe1(v_ref_p), // input wire [15:0]  probe1
        .probe2(v_ref_n), // input wire [15:0]  probe2 
        .probe3(vaux2), // input wire [23:0]  probe3        
        .probe4(ila_np), // input wire [0:0]  probe4 
        .probe5(neg), // input wire [0:0]  probe5 
        .probe6(ila_t) // input wire [32:0]  probe6
    );
    
/*    always @(posedge eos)
        if (rst_n==1) begin
            cout<=0;
        end
        else 
            begin
                cout <= cout + 16'd1;
            end
*/
  VGA_top instance_of_VGA(
     .clk(clk_sys),
     .rst_n(rst_n),
     .hsync(hsync),
     .vsync(vsync),
     .vga_r(vga_r),
     .vga_g(vga_g),
     .vga_b(vga_b),
     .wave_in(vaux2[13:4]),
     .wave_adjust(WAVE_ADJUST),
    .rst_pin(rst_pin),        // Active HIGH reset (from pin)
   
     // RS232 signals
                .rxd_pin(rxd_pin),        // RS232 RXD pin
                .txd_pin(txd_pin),        // RS232 RXD pin

     .lb_sel_pin(lb_sel_pin),     // Loopback selector 
     //BT 
       .bt_pw_on(bt_pw_on),
       .bt_master_slave(bt_master_slave),
       .bt_sw_hw(bt_sw_hw),
       . bt_rst_n(bt_rst_n),
       . bt_sw(bt_sw),
       . sw_pin(sw_pin),
       .kp(kp),
       .ki(ki),
       .kd(kd)
  );


endmodule