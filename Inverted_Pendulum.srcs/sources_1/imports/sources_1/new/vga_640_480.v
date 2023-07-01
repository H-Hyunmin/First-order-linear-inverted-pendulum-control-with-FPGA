`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/06/04 10:41:41
// Design Name: 
// Module Name: vga_dis_num
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



module vga_640_480(clk_vga,rst_n,hsync,vsync,valid_x,valid_y,x_dis,y_dis);
    input clk_vga,rst_n;//输入时钟和重置
    output reg hsync,vsync;//输出同步信号
    output reg valid_x,valid_y;
    output [9:0] x_dis,y_dis;
    
    
    reg [9:0]x_cnt; //x计数
    reg [9:0]y_cnt; //y计数  
    always @(posedge clk_vga or negedge rst_n) begin
        if(!rst_n) 
            x_cnt<=10'd0;
        else if(x_cnt==10'd799) 
            x_cnt<=10'd0;
        else 
            x_cnt<=x_cnt+1'b1;
    end
    always @(posedge clk_vga or negedge rst_n) begin
        if(!rst_n) 
            y_cnt<=10'd0;
        else if(y_cnt==10'd524) 
            y_cnt<=10'd0;
        else if(x_cnt==10'd799) 
            y_cnt<=y_cnt+1'b1;
    end    
 
 
    
    always @(posedge clk_vga or negedge rst_n) begin  //480行
        if(!rst_n) 
            valid_y<=1'b0;
        else if(y_cnt==10'd32)  
            valid_y<=1'b1;
        else if(y_cnt==10'd511) 
            valid_y<=1'b0;
    end    
    always @(posedge clk_vga or negedge rst_n) begin   //640列
        if(!rst_n) 
            valid_x<=1'b0;
        else if((x_cnt==10'd141)&&valid_y)
            valid_x<=1'b1;
        else if((x_cnt==10'd781)&&valid_y)
            valid_x<=1'b0;    
    end
     
     
       
    //VGA场同步、行同步信号
    always @(posedge clk_vga or negedge rst_n) begin
        if(!rst_n)
            hsync<=1'b1;
        else if(x_cnt==10'd0)       //产生hsync信号
            hsync<=1'b0;
        else if(x_cnt==10'd96)
            hsync<=1'b1;
    end
    always @(posedge clk_vga or negedge rst_n) begin
        if(!rst_n)
            vsync<=1'b1;
        else if(y_cnt==10'd0)       //产生vsync信号
            vsync<=1'b0;         
        else if(y_cnt==10'd2)
            vsync<=1'b1;
    end       
 
    //减去消隐区，转换成易于理解的640*480
    assign x_dis=x_cnt-10'd142; //横坐标显示有效区域相对坐标值0-639
    assign y_dis=y_cnt-10'd33;  //纵坐标显示有效区域相对坐标值0-479

endmodule








