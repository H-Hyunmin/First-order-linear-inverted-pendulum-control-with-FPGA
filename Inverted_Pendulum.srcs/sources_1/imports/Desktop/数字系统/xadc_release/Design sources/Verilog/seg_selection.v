`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/22 20:55:12
// Design Name: 
// Module Name: seg_selection
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


//seg_selection
//instance_of_seg_selection
//(
//    .ena(),
//    .clk_in(),
//    .c_bcd(),
//    .sign(),
//    .seg_selection_1(),
//    .seg_selection_0(),
//    .bits_selection()//"bits selection"
//);
module seg_selection(
    input ena,
    input clk_in,
    input display_mode,
    input [3:0] direction,
    thousands,
    hundreds,
    tens,
    ones,
    deciles,
    percentiles,
    output reg [3:0] seg_selection_1,
    output reg [3:0] seg_selection_0,
    output reg [7:0] bits_selection = 8'h00 //"bits selection"
);
    wire [3:0] half_byte_sign,
               half_byte_7,
               half_byte_6,
               half_byte_5,
               half_byte_4,
               half_byte_3,
               half_byte_2,
               half_byte_1,
               half_byte_0;
    //      half_byte_7,6,5,4
    assign half_byte_sign = ( direction == 4'h1 ) ? 4'hC : 4'hB;
    assign { 
             half_byte_7,
             half_byte_6,
             half_byte_5,
             half_byte_4
            } =
             //---------------------------------------------------------------------
             //if
             ( display_mode )?
                    (
                         { ( ( half_byte_sign == 4'hB )?( 4'hD ):( 4'hE ) ) , thousands , hundreds , tens } 
                     ):
             //else
                    (
                    //if
                        ( thousands == 4'h0 )?
                        (        //if
                                    ( hundreds == 4'h0 )?
                                (        //if
                                            ( tens == 4'h0 )?  
                                        ( 
                                                    { 12'hBBB , half_byte_sign } 
                                        ):
                                        //else
                                        ( { 8'hBB , half_byte_sign , tens } )
                                ):
                                //else
                                ( { 4'hB , half_byte_sign , hundreds , tens } )
                        ):
                    //else
                        ( { half_byte_sign , thousands , hundreds , tens } )
                    );
             //----------------------------------------------------------------------
    //      half_byte_3,2,1,0
    assign half_byte_3 = ones;
    assign half_byte_2 = 4'hA;
    assign half_byte_1 = deciles;
    assign half_byte_0 = percentiles;
    reg initialized = 1'b0;
    
    always@( posedge clk_in )
    begin
        if(~ena)
            begin
                bits_selection = 8'h00;
                initialized = 1'b0;
                seg_selection_1 = 8'hBB;
                seg_selection_0 = 8'hBB;
            end
        else
            begin
                bits_selection = initialized ? { bits_selection[6:0],bits_selection[7] } : 8'h11 ;
                initialized = 1'b1;
                seg_selection_1 =
                  ( {4{bits_selection[7]}} & half_byte_7 )
                | ( {4{bits_selection[6]}} & half_byte_6 )
                | ( {4{bits_selection[5]}} & half_byte_5 )
                | ( {4{bits_selection[4]}} & half_byte_4 ) ;
                seg_selection_0 =
                  ( {4{bits_selection[3]}} & half_byte_3 )
                | ( {4{bits_selection[2]}} & half_byte_2 )
                | ( {4{bits_selection[1]}} & half_byte_1 )
                | ( {4{bits_selection[0]}} & half_byte_0 );
            end
    end
endmodule

