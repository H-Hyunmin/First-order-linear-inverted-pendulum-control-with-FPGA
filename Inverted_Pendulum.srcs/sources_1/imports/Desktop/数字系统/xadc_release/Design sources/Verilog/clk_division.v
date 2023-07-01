`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 17:53:01
// Design Name: 
// Module Name: clk_division
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


//clk_division #(.F_CLK_SYS() , .F_CLK_DIVISION() )
//name_of_instance
//    (
//    .ena(),
//    .clk_in(),
//    .clk_out()
//    );
module clk_division
#(parameter F_CLK_SYS = 100_000_000 , F_CLK_DIVISION = 20 )//,COUNTER_MAX = F_CLK_SYS / F_CLK_DIVISION / 2 - 1 )
    (
    input ena,
    input clk_in,
    output reg clk_out = 1'b0
    );
    integer counter = 0;
    always@(posedge clk_in)
        begin
            if( ~ena )
                begin
                    counter = 32'b0;
                    clk_out = 1'b0;
                end
            else
                begin
                    if( counter == F_CLK_SYS / F_CLK_DIVISION / 2 - 1 )
                        begin
                            counter = 32'b0;
                            clk_out = ~clk_out;
                        end
                    else
                        begin
                            counter = counter + 32'b1;
                            clk_out = clk_out;
                        end
                end
        end
endmodule