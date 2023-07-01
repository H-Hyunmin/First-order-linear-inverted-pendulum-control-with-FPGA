`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/26 10:06:27
// Design Name: 
// Module Name: pendulum
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


module pendulum(
    input in_clk,
    input rst,
    input elevel_rst,
    input [23:0]elevel,
    input [15:0]kp,
    input [15:0]ki,
    input [15:0]kd,
    output reg  [32:0]t,
    output reg np
    );
    //parameter midlevel=16'b0000111111110000;//0000111111101111
    wire clk;
    clk_divide128 u1(in_clk,rst,clk);
    reg [1:0]state,next_state;
    reg [4:0]counter;
    reg  [32:0]count;
    reg  [32:0]error,last_error;
    wire nnp;
    reg [32:0]mmidlevel;
    wire [32:0]kpp,kii,kdd;
    wire [32:0]eelevel;
    assign kpp=kp;
    assign kii=ki;
    assign kdd=kd;
    assign eelevel=elevel;
    assign nnp=np;
    always @(posedge clk) begin //remember to modify it in the end
        if(elevel_rst) begin state<=0;next_state<=0;counter<=0;count<=0;mmidlevel<=elevel; end
        else begin
            case(next_state)
                2'b00:next_state<=2'b01;
                2'b01:next_state<=2'b11;
                2'b11:next_state<=2'b10;
                2'b10:next_state<=2'b00;
            endcase     
            case(state)
                2'b00: begin   //
                    if(eelevel>mmidlevel) begin
                        np<=0;
                        error<=eelevel-mmidlevel;
                    end
                    else begin
                        np<=1;
                        error<=mmidlevel-eelevel;
                    end
                    counter<=counter+1;
                end
                2'b01:begin
                    t<=kpp*error+kii*count+kdd*(error-last_error);
                    if(counter==30)begin counter<=0; end   
                end  
                2'b11:begin
                    if(counter==29) begin count<=0;  end
                end
                2'b10:begin
                    last_error<=error;
                    if(nnp==0)
                        count<=count+error;  
                    else
                        count<=count-error;
                end
            endcase
            state<=next_state;
        end
    end
endmodule
