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
    input clk_vga,rst_n;//����ʱ�Ӻ�����
    output reg hsync,vsync;//���ͬ���ź�
    output reg valid_x,valid_y;
    output [9:0] x_dis,y_dis;
    
    
    reg [9:0]x_cnt; //x����
    reg [9:0]y_cnt; //y����  
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
 
 
    
    always @(posedge clk_vga or negedge rst_n) begin  //480��
        if(!rst_n) 
            valid_y<=1'b0;
        else if(y_cnt==10'd32)  
            valid_y<=1'b1;
        else if(y_cnt==10'd511) 
            valid_y<=1'b0;
    end    
    always @(posedge clk_vga or negedge rst_n) begin   //640��
        if(!rst_n) 
            valid_x<=1'b0;
        else if((x_cnt==10'd141)&&valid_y)
            valid_x<=1'b1;
        else if((x_cnt==10'd781)&&valid_y)
            valid_x<=1'b0;    
    end
     
     
       
    //VGA��ͬ������ͬ���ź�
    always @(posedge clk_vga or negedge rst_n) begin
        if(!rst_n)
            hsync<=1'b1;
        else if(x_cnt==10'd0)       //����hsync�ź�
            hsync<=1'b0;
        else if(x_cnt==10'd96)
            hsync<=1'b1;
    end
    always @(posedge clk_vga or negedge rst_n) begin
        if(!rst_n)
            vsync<=1'b1;
        else if(y_cnt==10'd0)       //����vsync�ź�
            vsync<=1'b0;         
        else if(y_cnt==10'd2)
            vsync<=1'b1;
    end       
 
    //��ȥ��������ת������������640*480
    assign x_dis=x_cnt-10'd142; //��������ʾ��Ч�����������ֵ0-639
    assign y_dis=y_cnt-10'd33;  //��������ʾ��Ч�����������ֵ0-479

endmodule








