`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/04 12:22:42
// Design Name: 
// Module Name: VGA_top
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


module VGA_top(
    input clk,rst_n,
    output hsync,vsync,
    output [3:0]vga_r,vga_g,vga_b,
    input [9:0] wave_in,
    input [2:0] wave_adjust,
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
       output [15:0] kp,
       output [15:0] ki,
       output [15:0] kd
  );
    
    reg clk_vga=0;  //vga时钟
    reg clk_cnt=0;  //分频计数
    
    
    wire [15:0] num_P;
    wire [15:0] num_I;
    wire [15:0] num_D;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            clk_vga<=1'b0;
        else if(clk_cnt==1) begin
            clk_vga=~clk_vga;
            clk_cnt<=0;
        end else 
            clk_cnt<=clk_cnt+1;
    end 
    wire valid_x,valid_y;
    wire [9:0] x_dis,y_dis;
    
    
     bt_uart instance_of_bt (
                  .clk_pin(clk),      // Clock input (from pin)
                  .rst_pin(rst_pin),        // Active HIGH reset (from pin)
    
      // RS232 signals
                  .rxd_pin(rxd_pin),        // RS232 RXD pin
                  .txd_pin(txd_pin),        // RS232 RXD pin
    
      // Loopback selector
                  .lb_sel_pin(lb_sel_pin),     // Loopback selector 
      //BT 
         .bt_pw_on(bt_pw_on),
         .bt_master_slave(bt_master_slave),
         .bt_sw_hw(bt_sw_hw),
         .bt_rst_n(bt_rst_n),
         .bt_sw(bt_sw),
         .sw_pin(sw_pin),
        
      //seg7
            .seg7_0_7bit(),
            .seg7_1_7bit(),
            .seg7_0_an(),
            .seg7_1_an(),
            .seg7_0_dp(),
            .seg7_1_dp(),
      // LED outputs
            .led_pins(),
            .p(num_P),
            .i(num_I),
            .d(num_D)
        
    );

    
    
    
    //module vga_dis_num(clk_vga,rst_n,valid_x,valid_y,x_dis,y_dis,num_P,num_I,num_D,vga_r,vga_g,vga_b);
    vga_640_480 v(clk_vga,rst_n,hsync,vsync,valid_x,valid_y,x_dis,y_dis);
    vga_dis_num v2(clk_vga,rst_n,valid_x,valid_y,x_dis,y_dis,num_P,num_I,num_D,vga_r,vga_g,vga_b,wave_in,wave_adjust);
    assign kp=num_P;
        assign ki=num_I;
        assign kd=num_D;
endmodule
