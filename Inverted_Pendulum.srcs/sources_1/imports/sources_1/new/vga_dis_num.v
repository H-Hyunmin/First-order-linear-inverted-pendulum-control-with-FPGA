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


module vga_dis_num(clk_vga,rst_n,valid_x,valid_y,x_dis,y_dis,num_P,num_I,num_D,vga_r,vga_g,vga_b,wave_in,wave_adjust);
    input clk_vga,rst_n;
    input valid_x,valid_y;
    input [9:0] x_dis,y_dis;
    input [15:0]num_P,num_I,num_D;
    output [3:0] vga_r,vga_g,vga_b;
    input [9:0] wave_in;
    input [2:0] wave_adjust;
    
    reg [11:0] vga_rgb;
    
    
    reg  [767:0] char_wave[0:3];
    initial begin//对应亚运加油四个字
        char_wave[0] = 768'h00000000000000000000000000000000000003800003FF8000FE6000000C7000000C6000000C60C0000C60E0030C618001CC630000CC6400006C7800000C6000000C6000000C6000000C7FF817FFFFFC0F000000000000000000000000000000;
        char_wave[1] = 768'h0000000000000000000000000000000003001E000383F80000C000000000000000000FE0000FFC00038060001F00C000030084000201030003030F800107F1C001060080038000003C7E00000003FFFC00003FE0000001000000000000000000;
        char_wave[2] = 768'h0000000000000000000000000030000000380000003800000030000000300000003F80001FE3803000637FFC0043303800C3303801833030010610300206103004061FF0084C1000103800002030000000000000000000000000000000000000;
        char_wave[3] = 768'h000000000000000000000000000070000000380001C0300000C030000040300000003000000037F0001FF8380E18303006083030004C3E30008CF830008C3070018C306003043F600707C1E00E0400E0060000C0000000000000000000000000;
    end
    reg [22:0] wave_cnt=0;//时钟分频 
     parameter DIV=4_200_000;
    reg [9:0] wave_point[0:19];
    initial begin
        wave_point[0]=10'd767; wave_point[1]=10'd767; wave_point[2]=10'd767; wave_point[3]=10'd767; wave_point[4]=10'd767;
        wave_point[5]=10'd767; wave_point[6]=10'd767; wave_point[7]=10'd767; wave_point[8]=10'd767; wave_point[9]=10'd767;
        wave_point[10]=10'd767; wave_point[11]=10'd767; wave_point[12]=10'd767; wave_point[13]=10'd767; wave_point[14]=10'd767;
        wave_point[15]=10'd767; wave_point[16]=10'd767; wave_point[17]=10'd767; wave_point[18]=10'd767; wave_point[19]=10'd767; 
    end
    //3位线宽的wave用于定位
    
    reg [3:0] wave [0:19];
    reg [1:0] choose_wave[0:19];
    initial begin
        choose_wave[0]<=0; choose_wave[1]<=1; choose_wave[2]<=2; choose_wave[3]<=3;
        choose_wave[4]<=0; choose_wave[5]<=1; choose_wave[6]<=2; choose_wave[7]<=3;
        choose_wave[8]<=0; choose_wave[9]<=1; choose_wave[10]<=2; choose_wave[11]<=3;
        choose_wave[12]<=0; choose_wave[13]<=1; choose_wave[14]<=2; choose_wave[15]<=3;
        choose_wave[16]<=0; choose_wave[17]<=1; choose_wave[18]<=2; choose_wave[19]<=3;
    end
    always @(posedge clk_vga)begin
        if(wave_cnt==DIV-1)begin
        choose_wave[0]<=choose_wave[1];choose_wave[1]<=choose_wave[2];choose_wave[2]<=choose_wave[3];choose_wave[3]<=choose_wave[4];
        choose_wave[4]<=choose_wave[5];choose_wave[5]<=choose_wave[6];choose_wave[6]<=choose_wave[7];choose_wave[7]<=choose_wave[8];
        choose_wave[8]<=choose_wave[9];choose_wave[9]<=choose_wave[10];choose_wave[10]<=choose_wave[11];choose_wave[11]<=choose_wave[12];
        choose_wave[12]<=choose_wave[13];choose_wave[13]<=choose_wave[14];choose_wave[14]<=choose_wave[15];choose_wave[15]<=choose_wave[16];
        choose_wave[16]<=choose_wave[17];choose_wave[17]<=choose_wave[18];choose_wave[18]<=choose_wave[19];choose_wave[19]<=choose_wave[0];
        end
    end
    always @(posedge clk_vga or negedge rst_n)begin
            if(!rst_n||wave_cnt==DIV-1)begin
            wave_point[0]=10'd767; wave_point[1]=10'd767; wave_point[2]=10'd767; wave_point[3]=10'd767; wave_point[4]=10'd767;
            wave_point[5]=10'd767; wave_point[6]=10'd767; wave_point[7]=10'd767; wave_point[8]=10'd767; wave_point[9]=10'd767;
            wave_point[10]=10'd767; wave_point[11]=10'd767; wave_point[12]=10'd767; wave_point[13]=10'd767; wave_point[14]=10'd767;
            wave_point[15]=10'd767; wave_point[16]=10'd767; wave_point[17]=10'd767; wave_point[18]=10'd767; wave_point[19]=10'd767;             
            end
            else if(wave_point[0]==0||(x_dis==0&&(y_dis==260+24*wave[0]))) wave_point[0]<=10'd767;
            else if(x_dis>0&&x_dis<=32&&(y_dis>260+24*wave[0]) && (y_dis<=284+24*wave[0])) wave_point[0]<=wave_point[0]-1'b1;              
            
            else if(wave_point[1]==0||(x_dis==32&&(y_dis==260+24*wave[1]))) wave_point[1]<=10'd767;
            else if(x_dis>32&&x_dis<=64&&(y_dis>260+24*wave[1]) && (y_dis<=284+24*wave[1]))wave_point[1]<=wave_point[1]-1'b1;
            
            else if(wave_point[2]==0||(x_dis==64&&(y_dis==260+24*wave[2]))) wave_point[2]<=10'd767;
            else if(x_dis>64&&x_dis<=96&&(y_dis>260+24*wave[2]) && (y_dis<=284+24*wave[2]))wave_point[2]<=wave_point[2]-1'b1;

            else if(wave_point[3]==0||(x_dis==96&&(y_dis==260+24*wave[3]))) wave_point[3]<=10'd767;
            else if(x_dis>96&&x_dis<=128&&(y_dis>260+24*wave[3]) && (y_dis<=284+24*wave[3]))wave_point[3]<=wave_point[3]-1'b1;
                          
            else if(wave_point[4]==0||(x_dis==128&&(y_dis==260+24*wave[4]))) wave_point[4]<=10'd767;
            else if(x_dis>128&&x_dis<=160&&(y_dis>260+24*wave[4]) && (y_dis<=284+24*wave[4]))wave_point[4]<=wave_point[4]-1'b1;
            
            else if(wave_point[5]==0||(x_dis==160&&(y_dis==260+24*wave[5]))) wave_point[5]<=10'd767;
            else if(x_dis>160&&x_dis<=192&&(y_dis>260+24*wave[5]) && (y_dis<=284+24*wave[5]))wave_point[5]<=wave_point[5]-1'b1;
            
            else if(wave_point[6]==0||(x_dis==192&&(y_dis==260+24*wave[6]))) wave_point[6]<=10'd767;
            else if(x_dis>192&&x_dis<=224&&(y_dis>260+24*wave[6]) && (y_dis<=284+24*wave[6]))wave_point[6]<=wave_point[6]-1'b1;
            
            else if(wave_point[7]==0||(x_dis==224&&(y_dis==260+24*wave[7]))) wave_point[7]<=10'd767;
            else if(x_dis>224&&x_dis<=256&&(y_dis>260+24*wave[7]) && (y_dis<=284+24*wave[7]))wave_point[7]<=wave_point[7]-1'b1;
            
            else if(wave_point[8]==0||(x_dis==256&&(y_dis==260+24*wave[8]))) wave_point[8]<=10'd767;
            else if(x_dis>256&&x_dis<=288&&(y_dis>260+24*wave[8]) && (y_dis<=284+24*wave[8]))wave_point[8]<=wave_point[8]-1'b1;
            
            else if(wave_point[9]==0||(x_dis==288&&(y_dis==260+24*wave[9]))) wave_point[9]<=10'd767;
            else if(x_dis>288&&x_dis<=320&&(y_dis>260+24*wave[9]) && (y_dis<=284+24*wave[9]))wave_point[9]<=wave_point[9]-1'b1;
            
            else if(wave_point[10]==0||(x_dis==320&&(y_dis==260+24*wave[10]))) wave_point[10]<=10'd767;
            else if(x_dis>320&&x_dis<=352&&(y_dis>260+24*wave[10]) && (y_dis<=284+24*wave[10]))wave_point[10]<=wave_point[10]-1'b1;
            
            else if(wave_point[11]==0||(x_dis==352&&(y_dis==260+24*wave[11]))) wave_point[11]<=10'd767;
            else if(x_dis>352&&x_dis<=384&&(y_dis>260+24*wave[11]) && (y_dis<=284+24*wave[11]))wave_point[11]<=wave_point[11]-1'b1;
            
            else if(wave_point[12]==0||(x_dis==384&&(y_dis==260+24*wave[12]))) wave_point[12]<=10'd767;
            else if(x_dis>384&&x_dis<=416&&(y_dis>260+24*wave[12]) && (y_dis<=284+24*wave[12]))wave_point[12]<=wave_point[12]-1'b1;
            
            else if(wave_point[13]==0||(x_dis==416&&(y_dis==260+24*wave[13]))) wave_point[13]<=10'd767;
            else if(x_dis>416&&x_dis<=448&&(y_dis>260+24*wave[13]) && (y_dis<=284+24*wave[13]))wave_point[13]<=wave_point[13]-1'b1;
            
            else if(wave_point[14]==0||(x_dis==448&&(y_dis==260+24*wave[14]))) wave_point[14]<=10'd767;
            else if(x_dis>448&&x_dis<=480&&(y_dis>260+24*wave[14]) && (y_dis<=284+24*wave[14]))wave_point[14]<=wave_point[14]-1'b1;
            
            else if(wave_point[15]==0||(x_dis==480&&(y_dis==260+24*wave[15]))) wave_point[15]<=10'd767;
            else if(x_dis>480&&x_dis<=512&&(y_dis>260+24*wave[15]) && (y_dis<=284+24*wave[15]))wave_point[15]<=wave_point[15]-1'b1;
            
            else if(wave_point[16]==0||(x_dis==512&&(y_dis==260+24*wave[16]))) wave_point[16]<=10'd767;
            else if(x_dis>512&&x_dis<=544&&(y_dis>260+24*wave[16]) && (y_dis<=284+24*wave[16]))wave_point[16]<=wave_point[16]-1'b1;
            
            else if(wave_point[17]==0||(x_dis==544&&(y_dis==260+24*wave[17]))) wave_point[17]<=10'd767;
            else if(x_dis>544&&x_dis<=576&&(y_dis>260+24*wave[17]) && (y_dis<=284+24*wave[17]))wave_point[17]<=wave_point[17]-1'b1;
            
            else if(wave_point[18]==0||(x_dis==576&&(y_dis==260+24*wave[18]))) wave_point[18]<=10'd767;
            else if(x_dis>576&&x_dis<=608&&(y_dis>260+24*wave[18]) && (y_dis<=284+24*wave[18]))wave_point[18]<=wave_point[18]-1'b1;                     
            
            else if(wave_point[19]==0||(x_dis==608&&(y_dis==260+24*wave[19]))) wave_point[19]<=10'd767;
            else if(x_dis>608&&x_dis<=640&&(y_dis>260+24*wave[19]) && (y_dis<=284+24*wave[19]))wave_point[19]<=wave_point[19]-1'b1;                     
                        
    end
    
    
   
    always @(posedge clk_vga or negedge rst_n)begin
        if(!rst_n) wave_cnt <= 0;
        else begin
            if(wave_cnt==DIV-1) wave_cnt <= 0;
            else wave_cnt <= wave_cnt + 1'b1; 
        end
    end
   
    initial begin
    wave[0]<=0; wave[1]<=1; wave[2]<=3; wave[3]<=5; wave[4]<=7;
    wave[5]<=8; wave[6]<=7; wave[7]<=5; wave[8]<=3; wave[9]<=1;
    wave[10]<=0; wave[11]<=1; wave[12]<=3; wave[13]<=5; wave[14]<=7;
    wave[15]<=8; wave[16]<=7; wave[17]<=5; wave[18]<=3; wave[19]<=wave_in;    
    end
    always @(posedge clk_vga or negedge rst_n)begin
        if(!rst_n)begin
            wave[0]<=2; wave[1]<=3; wave[2]<=4; wave[3]<=5; wave[4]<=2;
            wave[5]<=2; wave[6]<=3; wave[7]<=4; wave[8]<=5; wave[9]<=2;
            wave[10]<=2; wave[11]<=3; wave[12]<=4; wave[13]<=5; wave[14]<=2;
            wave[15]<=2; wave[16]<=3; wave[17]<=4; wave[18]<=5; wave[19]<=wave_in;
        end
        else if(wave_cnt==DIV-1)begin//这里我写成了循环的形式，后面可以改输入。
            wave[0]<=wave[1]; wave[1]<=wave[2]; wave[2]<=wave[3]; wave[3]<=wave[4]; wave[4]<=wave[5];
            wave[5]<=wave[6]; wave[6]<=wave[7]; wave[7]<=wave[8]; wave[8]<=wave[9]; wave[9]<=wave[10];
            wave[10]<=wave[11]; wave[11]<=wave[12]; wave[12]<=wave[13]; wave[13]<=wave[14]; wave[14]<=wave[15];
            wave[15]<=wave[16]; wave[16]<=wave[17]; wave[17]<=wave[18]; wave[18]<=wave[19]; 
            if(wave_adjust==3'b000) wave[19]<=wave_in[2:0];
            else if(wave_adjust==3'b001) wave[19]<=wave_in[3:1];
            else if(wave_adjust==3'b010) wave[19]<=wave_in[4:2];
            else if(wave_adjust==3'b011) wave[19]<=wave_in[5:3];
            else if(wave_adjust==3'b100) wave[19]<=wave_in[6:4];
            else if(wave_adjust==3'b101) wave[19]<=wave_in[7:5];
            else if(wave_adjust==3'b110) wave[19]<=wave_in[8:6];
            else if(wave_adjust==3'b111) wave[19]<=wave_in[9:7];
        end
    end 
    
    
    reg  [511:0] char_num [0:15];
    initial begin
        char_num[0]= 512'h00000000000000000000000003C006200C30181818181808300C300C300C300C300C300C300C300C300C300C1808181818180C30062003C00000000000000000;
        char_num[1]= 512'h000000000000000000000000008001801F800180018001800180018001800180018001800180018001800180018001800180018003C01FF80000000000000000;
        char_num[2]= 512'h00000000000000000000000007E008381018200C200C300C300C000C001800180030006000C0018003000200040408041004200C3FF83FF80000000000000000;
        char_num[3]= 512'h00000000000000000000000007C018603030301830183018001800180030006003C0007000180008000C000C300C300C30083018183007C00000000000000000;
        char_num[4]= 512'h0000000000000000000000000060006000E000E0016001600260046004600860086010603060206040607FFC0060006000600060006003FC0000000000000000;
        char_num[5]= 512'h0000000000000000000000000FFC0FFC10001000100010001000100013E0143018181008000C000C000C000C300C300C20182018183007C00000000000000000;
        char_num[6]= 512'h00000000000000000000000001E006180C180818180010001000300033E0363038183808300C300C300C300C300C180C18080C180E3003E00000000000000000;
        char_num[7]= 512'h0000000000000000000000001FFC1FFC100830102010202000200040004000400080008001000100010001000300030003000300030003000000000000000000;
        char_num[8]= 512'h00000000000000000000000007E00C301818300C300C300C380C38081E180F2007C018F030783038601C600C600C600C600C3018183007C00000000000000000;
        char_num[9]= 512'h00000000000000000000000007C01820301030186008600C600C600C600C600C701C302C186C0F8C000C0018001800103030306030C00F800000000000000000;
        char_num[10]= 512'h000000000000000000000000000000000000000000000000000007E01830301830183018003807D81C183018601860186018601930791F8E0000000000000000;
        char_num[11]= 512'h000000000000000000000800780018001800180018001800180019E01A381C181C0C180C180C180C180C180C180C180C18081C181C3013E00000000000000000;
        char_num[12]= 512'h000000000000000000000000000000000000000000000000000003E00E100C1818183018300030003000300030003004180418080C1003E00000000000000000;
        char_num[13]= 512'h000000000000000000000008007800180018001800180018001807D80C38181818183018301830183018301830183018101818380C5E07900000000000000000;
        char_num[14]= 512'h000000000000000000000000000000000000000000000000000003C00C3008181808300C300C300C3FFC300030003000180418080E1803E00000000000000000;
        char_num[15]= 512'h000000000000000000000000007C0186010603060300030003003FF803000300030003000300030003000300030003000300030003001FF00000000000000000;
    end
    parameter
        char_P = 512'h0000000000000000000000007FF01818180C180618061806180618061806180C18181FE01800180018001800180018001800180018007E000000000000000000,
        char_I = 512'h0000000000000000000000001FF8018001800180018001800180018001800180018001800180018001800180018001800180018001801FF80000000000000000,
        char_D = 512'h0000000000000000000000007FC0187018181808180C180C1806180618061806180618061806180618061804180C180C1818181818607FC00000000000000000;
            
    reg [8:0]point_P,point_I,point_D;
    initial begin
        point_P<=9'd511;point_I<=9'd511;point_D<=9'd511;
    end
     
     
            
    always @(posedge clk_vga or negedge rst_n)begin
        if(!rst_n)begin
            point_P<=9'd511;
            point_I<=9'd511;
            point_D<=9'd511;           
        end
        else if(point_P==0) point_P<=9'd511;
        else if(x_dis>10'd60&&x_dis<=10'd76&&y_dis>10'd100&&y_dis<=10'd132) point_P<=point_P - 1'b1;
        else if(point_I==0) point_I<=9'd511;
        else if(x_dis>10'd60&&x_dis<=10'd76&&y_dis>10'd150&&y_dis<=10'd182) point_I<=point_I - 1'b1;
        else if(point_D==0) point_D=9'd511;
        else if(x_dis>10'd60&&x_dis<=10'd76&&y_dis>10'd200&&y_dis<=10'd232) point_D<=point_D - 1'b1;                        
    end
            
    wire [3:0] num_adjust_register [0:11];
    
    assign   num_adjust_register [11] = num_P[15:12];
    assign   num_adjust_register [10] = num_P[11:8];
    assign   num_adjust_register [9]  = num_P[7:4];
    assign   num_adjust_register [8]  = num_P[3:0];
    assign   num_adjust_register [7]  = num_I[15:12];
    assign   num_adjust_register [6]  = num_I[11:8];
    assign   num_adjust_register [5]  = num_I[7:4];
    assign   num_adjust_register [4]  = num_I[3:0];
    assign   num_adjust_register [3]  = num_D[15:12];
    assign   num_adjust_register [2]  = num_D[11:8];
    assign   num_adjust_register [1]  = num_D[7:4];
    assign   num_adjust_register [0]  = num_D[3:0];   

    reg  [8:0]  point_num_ [0:11];//12个数据 
    parameter
                P3=11,P2=10,P1=9,P0=8,
                I3=7,I2=6,I1=5,I0=4,
                D3=3,D2=2,D1=1,D0=0;
   
   
    always @(posedge clk_vga or negedge rst_n)begin
        if(!rst_n)begin 
            point_num_[P3]<=9'd511;
            point_num_[P2]<=9'd511;
            point_num_[P1]<=9'd511;
            point_num_[P0]<=9'd511;
            point_num_[I3]<=9'd511;
            point_num_[I2]<=9'd511;
            point_num_[I1]<=9'd511;
            point_num_[I0]<=9'd511;
            point_num_[D3]<=9'd511;
            point_num_[D2]<=9'd511;
            point_num_[D1]<=9'd511;
            point_num_[D0]<=9'd511;
            end
               
                     
                     
            //P3
            else if(point_num_[P3]==0) point_num_[P3]<=9'd511;
            else if(x_dis>10'd100&&x_dis<=10'd116&&y_dis>10'd100&&y_dis<=10'd132)point_num_[P3] <= point_num_[P3] - 1'b1;
            //P2
            else if(point_num_[P2]==0) point_num_[P2]<=9'd511;
            else if(x_dis>10'd120&&x_dis<=10'd136&&y_dis>10'd100&&y_dis<=10'd132)point_num_[P2] <= point_num_[P2] - 1'b1;
            //P1
            else if(point_num_[P1]==0) point_num_[P1]<=9'd511;
            else if(x_dis>10'd140&&x_dis<=10'd156&&y_dis>10'd100&&y_dis<=10'd132)point_num_[P1] <= point_num_[P1] - 1'b1;
            //P0
            else if(point_num_[P0]==0) point_num_[P0]<=9'd511;
            else if(x_dis>10'd160&&x_dis<=10'd176&&y_dis>10'd100&&y_dis<=10'd132)point_num_[P0] <= point_num_[P0] - 1'b1;
            //I3
            else if(point_num_[I3]==0) point_num_[I3]<=9'd511;
            else if(x_dis>10'd100&&x_dis<=10'd116&&y_dis>10'd150&&y_dis<=10'd182)point_num_[I3] <= point_num_[I3] - 1'b1;
            //I2
            else if(point_num_[I2]==0) point_num_[I2]<=9'd511;
            else if(x_dis>10'd120&&x_dis<=10'd136&&y_dis>10'd150&&y_dis<=10'd182)point_num_[I2] <= point_num_[I2] - 1'b1;
            //I1
            else if(point_num_[I1]==0) point_num_[I1]<=9'd511;
            else if(x_dis>10'd140&&x_dis<=10'd156&&y_dis>10'd150&&y_dis<=10'd182)point_num_[I1] <= point_num_[I1] - 1'b1;
            //I0
            else if(point_num_[I0]==0) point_num_[I0]<=9'd511;
            else if(x_dis>10'd160&&x_dis<=10'd176&&y_dis>10'd150&&y_dis<=10'd182)point_num_[I0] <= point_num_[I0] - 1'b1;
            //D3
            else if(point_num_[D3]==0) point_num_[D3]<=9'd511;
            else if(x_dis>10'd100&&x_dis<=10'd116&&y_dis>10'd200&&y_dis<=10'd232)point_num_[D3] <= point_num_[D3] - 1'b1;
            //D2
            else if(point_num_[D2]==0) point_num_[D2]<=9'd511;
            else if(x_dis>10'd120&&x_dis<=10'd136&&y_dis>10'd200&&y_dis<=10'd232)point_num_[D2] <= point_num_[D2] - 1'b1;
            //D1
            else if(point_num_[D1]==0) point_num_[D1]<=9'd511;
            else if(x_dis>10'd140&&x_dis<=10'd156&&y_dis>10'd200&&y_dis<=10'd232)point_num_[D1] <= point_num_[D1] - 1'b1;
            //D0
            else if(point_num_[D0]==0) point_num_[D0]<=9'd511;
            else if(x_dis>10'd160&&x_dis<=10'd176&&y_dis>10'd200&&y_dis<=10'd232)point_num_[D0] <= point_num_[D0] - 1'b1;

                                            
   end           
           
           
           
   /*
     rom_video_p1 p1(
           .clka(clk_vga),    // input wire clka
           .addra(addr_video),  // input wire [13 : 0] addra
           .douta(rgb_rom)  // output wire [15 : 0] douta
           );
   */
   reg [15:0] addr_video=0;//取地址；
   wire [15:0] rgb_rom;//从rom里面读取的16位数据。
   
   reg [16:0] addr_video_title=0;//取地址；
   wire [15:0] rgb_rom_title;//从rom里面读取的16位数据。
 
   /*
   rom_video_p1 p1(
         .clka(clk_vga),    // input wire clka
         .addra(addr_video),  // input wire [15 : 0] addra
         .douta(rgb_rom)  // output wire [15 : 0] douta
         );
         */
   //地址驱动
    rom_title p2(
            .clka(clk_vga),    // input wire clka
            .addra(addr_video_title),  // input wire [16 : 0] addra
            .douta(rgb_rom_title)  // output wire [15 : 0] douta
            );
   always @(posedge clk_vga or negedge rst_n)begin
       if(!rst_n) begin addr_video <= 0; addr_video_title <= 0;end
       /*
       else if(x_dis>10'd300 && x_dis<=10'd600 && y_dis>10'd260&&y_dis<=10'd461) begin
           if(addr_video==16'd60299) addr_video <= 0;//注意这里比总像素少一位即可。
           else addr_video <= addr_video + 16'b0000_0000_0000_0001;
       end
       */
       else if(x_dis>10'd300 && x_dis<=10'd600 && y_dis>10'd20&&y_dis<=10'd255) begin
           if(addr_video_title==17'd70499) addr_video_title <= 0;//注意这里比总像素少一位即可。
           else addr_video_title <= addr_video_title + 17'b0000_0000_0000_0001;
       end
   end    
   always @(posedge clk_vga)begin
        if(!valid_x) vga_rgb<=12'h000;
        //pic
        /*
            else if(x_dis>10'd300 && x_dis<=10'd600 && y_dis>10'd260&&y_dis<=10'd461)          
                    vga_rgb <=  {rgb_rom[15:12],rgb_rom[10:7],rgb_rom[4:1]};*/
            else if(x_dis>10'd300 && x_dis<=10'd600 && y_dis>10'd20&&y_dis<=10'd255)          
                    vga_rgb <=  {rgb_rom_title[15:12],rgb_rom_title[10:7],rgb_rom_title[4:1]};            
            
            else if(x_dis>10'd100&&x_dis<=10'd116&&y_dis>10'd100&&y_dis<=10'd132)begin              
                 if(char_num[num_adjust_register[P3]][point_num_[P3]])vga_rgb <= 12'hfff;
                 else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd120&&x_dis<=10'd136&&y_dis>10'd100&&y_dis<=10'd132)begin
                    if(char_num[num_adjust_register[P2]][point_num_[P2]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd140&&x_dis<=10'd156&&y_dis>10'd100&&y_dis<=10'd132)begin 
                    if(char_num[num_adjust_register[P1]][point_num_[P1]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd160&&x_dis<=10'd176&&y_dis>10'd100&&y_dis<=10'd132)begin 
                    if(char_num[num_adjust_register[P0]][point_num_[P0]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd100&&x_dis<=10'd116&&y_dis>10'd150&&y_dis<=10'd182)begin 
                    if(char_num[num_adjust_register[I3]][point_num_[I3]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd120&&x_dis<=10'd136&&y_dis>10'd150&&y_dis<=10'd182)begin 
                    if(char_num[num_adjust_register[I2]][point_num_[I2]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd140&&x_dis<=10'd156&&y_dis>10'd150&&y_dis<=10'd182)begin 
                    if(char_num[num_adjust_register[I1]][point_num_[I1]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd160&&x_dis<=10'd176&&y_dis>10'd150&&y_dis<=10'd182)begin 
                    if(char_num[num_adjust_register[I0]][point_num_[I0]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd100&&x_dis<=10'd116&&y_dis>10'd200&&y_dis<=10'd232)begin 
                    if(char_num[num_adjust_register[D3]][point_num_[D3]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd120&&x_dis<=10'd136&&y_dis>10'd200&&y_dis<=10'd232)begin 
                    if(char_num[num_adjust_register[D2]][point_num_[D2]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd140&&x_dis<=10'd156&&y_dis>10'd200&&y_dis<=10'd232)begin 
                    if(char_num[num_adjust_register[D1]][point_num_[D1]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd160&&x_dis<=10'd176&&y_dis>10'd200&&y_dis<=10'd232)begin 
                    if(char_num[num_adjust_register[D0]][point_num_[D0]])vga_rgb <= 12'hfff;
                    else vga_rgb <= 12'h000;
            end
            
            
            
            else if(x_dis>10'd60&&x_dis<=10'd76&&y_dis>10'd100&&y_dis<=10'd132)begin              
                if(char_P[point_P])vga_rgb <= 12'hfff;
                else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd60&&x_dis<=10'd76&&y_dis>10'd150&&y_dis<=10'd182)begin              
                if(char_I[point_I])vga_rgb <= 12'hfff;
                else vga_rgb <= 12'h000;
            end
            else if(x_dis>10'd60&&x_dis<=10'd76&&y_dis>10'd200&&y_dis<=10'd232)begin              
                if(char_D[point_D])vga_rgb <= 12'hfff;
                else vga_rgb <= 12'h000;
            end      
            
            
            
            
            else if(x_dis>0&&x_dis<=32&&(y_dis>260+24*wave[0]) && (y_dis<=284+24*wave[0]))begin
                if(char_wave[choose_wave[0]][wave_point[0]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end
            else if(x_dis>32&&x_dis<=64&&(y_dis>260+24*wave[1]) && (y_dis<=284+24*wave[1]))begin
                if(char_wave[choose_wave[1]][wave_point[1]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end        
            else if(x_dis>64&&x_dis<=96&&(y_dis>260+24*wave[2]) && (y_dis<=284+24*wave[2]))begin
                if(char_wave[choose_wave[2]][wave_point[2]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end        
            else if(x_dis>96&&x_dis<=128&&(y_dis>260+24*wave[3]) && (y_dis<=284+24*wave[3]))begin
                if(char_wave[choose_wave[3]][wave_point[3]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end         
            else if(x_dis>128&&x_dis<=160&&(y_dis>260+24*wave[4]) && (y_dis<=284+24*wave[4]))begin
                if(char_wave[choose_wave[4]][wave_point[4]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end
            else if(x_dis>160&&x_dis<=192&&(y_dis>260+24*wave[5]) && (y_dis<=284+24*wave[5]))begin
                if(char_wave[choose_wave[5]][wave_point[5]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end        
            else if(x_dis>192&&x_dis<=224&&(y_dis>260+24*wave[6]) && (y_dis<=284+24*wave[6]))begin
                if(char_wave[choose_wave[6]][wave_point[6]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end        
            else if(x_dis>224&&x_dis<=256&&(y_dis>260+24*wave[7]) && (y_dis<=284+24*wave[7]))begin
                if(char_wave[choose_wave[7]][wave_point[7]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end                 
            else if(x_dis>256&&x_dis<=288&&(y_dis>260+24*wave[8]) && (y_dis<=284+24*wave[8]))begin
                if(char_wave[choose_wave[8]][wave_point[8]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end
            else if(x_dis>288&&x_dis<=320&&(y_dis>260+24*wave[9]) && (y_dis<=284+24*wave[9]))begin
                if(char_wave[choose_wave[9]][wave_point[9]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end
            else if(x_dis>320&&x_dis<=352&&(y_dis>260+24*wave[10]) && (y_dis<=284+24*wave[10]))begin
                if(char_wave[choose_wave[10]][wave_point[10]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end             
            else if(x_dis>352&&x_dis<=384&&(y_dis>260+24*wave[11]) && (y_dis<=284+24*wave[11]))begin
                if(char_wave[choose_wave[11]][wave_point[11]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end        
            else if(x_dis>384&&x_dis<=416&&(y_dis>260+24*wave[12]) && (y_dis<=284+24*wave[12]))begin
                if(char_wave[choose_wave[12]][wave_point[12]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end
            else if(x_dis>416&&x_dis<=448&&(y_dis>260+24*wave[13]) && (y_dis<=284+24*wave[13]))begin
                if(char_wave[choose_wave[13]][wave_point[13]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end
            else if(x_dis>448&&x_dis<=480&&(y_dis>260+24*wave[14]) && (y_dis<=284+24*wave[14]))begin
                if(char_wave[choose_wave[14]][wave_point[14]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end        
            else if(x_dis>480&&x_dis<=512&&(y_dis>260+24*wave[15]) && (y_dis<=284+24*wave[15]))begin
                if(char_wave[choose_wave[15]][wave_point[15]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end        
            else if(x_dis>512&&x_dis<=544&&(y_dis>260+24*wave[16]) && (y_dis<=284+24*wave[16]))begin
                if(char_wave[choose_wave[16]][wave_point[16]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end  
            else if(x_dis>544&&x_dis<=576&&(y_dis>260+24*wave[17]) && (y_dis<=284+24*wave[17]))begin
                if(char_wave[choose_wave[17]][wave_point[17]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end
            else if(x_dis>576&&x_dis<=608&&(y_dis>260+24*wave[18]) && (y_dis<=284+24*wave[18]))begin
                if(char_wave[choose_wave[18]][wave_point[18]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end
            else if(x_dis>608&&x_dis<=640&&(y_dis>260+24*wave[19]) && (y_dis<=284+24*wave[19]))begin
                if(char_wave[choose_wave[19]][wave_point[19]])vga_rgb<=12'hfff;
                else vga_rgb<=12'h000;
            end        

            else  vga_rgb <= 12'h000;
   end
    
    assign vga_r = vga_rgb[11:8];//红色
    assign vga_g = vga_rgb[7:4];//绿色
    assign vga_b = vga_rgb[3:0];//蓝色
    
endmodule
