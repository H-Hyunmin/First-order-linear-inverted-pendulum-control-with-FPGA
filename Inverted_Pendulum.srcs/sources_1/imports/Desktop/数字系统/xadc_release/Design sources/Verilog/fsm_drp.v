`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/07/02 02:53:54
// Design Name: 
// Module Name: fsm_drp
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


module fsm_drp
#(  RESET = 4'h0 , WAITTING = 4'h1 ,
    EN_TEMP = 4'h2 , READ_TEMP = 4'h3,
    EN_VCCINT = 4'h4 , READ_VCCINT = 4'h5,
    EN_VCCAUX = 4'h6 , READ_VCCAUX = 4'h7,
    EN_VAUXP1_VAUXN1 = 4'h8 , READ_VAUXP1_VAUXN1 = 4'h9,
    EN_V_REF_P = 4'hA , READ_V_REF_P = 4'hB,
    EN_V_REF_N = 4'hC , READ_V_REF_N = 4'hD,
    EN_VCCBRAM = 4'hE , READ_VCCBRAM = 4'hF
)
(
    input wire dclk_in,
    input wire reset_in,
    input wire vp_in , vn_in , vauxp1 , vauxn1 , vauxp2 , vauxn2 , vauxp3 , vauxn3 ,
    output reg [15:0] temperature,
    vccint, //内核电压
    vccaux, //内核辅助电压
    vccbram, //供电电压
    vauxp1_vauxn1,
    v_ref_p, //vauxp2_vauxn2
    v_ref_n, //vauxp3_vauxn3
    output wire busy_out,
    drdy_out,
    eoc_out,
    eos_out,
    ot_out,
    vccaux_alarm_out,
    vccint_alarm_out,
    user_temp_alarm_out,
    alarm_out
);
    reg [6:0]daddr_in = 'h0;
    reg [1:0] den_in_vec = 'h0;
    reg [1:0] dwe_in_vec = 'h0;
    reg [15:0]di_in = 'h0;
    wire [4:0]channel_out;
    wire [15:0]do_out;
    reg [3:0] state = RESET;
    always@( posedge dclk_in )
    begin
        if( reset_in )
            begin
                dwe_in_vec <= 2'h0;
                di_in <= 16'h0000;
                //
                temperature <= 16'h0000;
                vccint <= 16'h0000;
                vccaux <= 16'h0000;
                vccbram <= 16'h0000;
                vauxp1_vauxn1 <= 16'h0000;
                v_ref_p <= 16'h0000;
                v_ref_n <= 16'h0000;
                daddr_in <= 7'h00;
                den_in_vec <= 2'h0;
                state <= RESET;
            end
        else
            begin
                case( state )
                    RESET:
                    begin
                        state <= WAITTING;
                    end
                    WAITTING:
                    begin
                        den_in_vec = 2'h2;
                        if( eos_out )   //完成一组转换后eos_out置1
                            begin
                                state <= EN_TEMP;  //开始读取温度
                            end
                        else
                            begin
                                state <= WAITTING;
                            end
                    end
                    EN_TEMP: 
                    begin
                        daddr_in <= 7'h00;  //温度地址
                        den_in_vec <= { 1'b0 , den_in_vec[1] }; //使能温度读取
                        if( drdy_out )  //drdy_out为1表示数据准备好
                            state <= READ_TEMP; //数据准备好后进入读取温度状态
                        else
                            state <= EN_TEMP;
                    end
                    READ_TEMP: 
                    begin
                        temperature <= do_out; //读取温度
                        den_in_vec = 2'h2;  //使能VCCINT读取
                        state <= EN_VCCINT;
                    end
                    EN_VCCINT:
                    begin
                        daddr_in <= 7'h01; //VCCINT地址
                        den_in_vec <= { 1'b0 , den_in_vec[1] };
                        if( drdy_out ) //drdy_out为1表示数据准备好
                            state <= READ_VCCINT;
                        else
                            state <= EN_VCCINT;

                    end
                    READ_VCCINT:
                    begin 
                        vccint <= do_out; //读取VCCINT
                        den_in_vec = 2'h2; //使能VCCAUX读取
                        state <= EN_VCCAUX; //进入读取VCCAUX状态
                    end
                    EN_VCCAUX:
                    begin
                        daddr_in <= 7'h02;
                        den_in_vec <= { 1'b0 , den_in_vec[1] };
                        if( drdy_out )
                            state <= READ_VCCAUX;
                        else
                            state <= EN_VCCAUX;
                    end
                    READ_VCCAUX:
                    begin
                        vccaux <= do_out;
                        den_in_vec = 2'h2;
                        state <= EN_VAUXP1_VAUXN1;
                    end
                    EN_VAUXP1_VAUXN1:
                    begin
                        daddr_in <= 7'h11;
                        den_in_vec <= { 1'b0 , den_in_vec[1] };
                        if( drdy_out )
                            state <= READ_VAUXP1_VAUXN1;
                        else
                            state <= EN_VAUXP1_VAUXN1;
                    end
                    READ_VAUXP1_VAUXN1:
                    begin
                        vauxp1_vauxn1 <= do_out;
                        den_in_vec = 2'h2;
                        state <= EN_V_REF_P;
                    end
                    EN_V_REF_P:     //读取vauxp2_vauxn2
                    begin
                        //daddr_in <= 7'h04;  //改成vauxp2_vauxn2地址其他不变
                        daddr_in <=7'h12;
                        den_in_vec <= { 1'b0 , den_in_vec[1] };
                        if( drdy_out )
                            state <= READ_V_REF_P;
                        else
                            state <= EN_V_REF_P;
                    end
                    READ_V_REF_P:  
                    begin
                        v_ref_p <= do_out;  //读入vauxp2_vauxn2
                        den_in_vec = 2'h2;
                        state <= EN_V_REF_N;
                    end
                    EN_V_REF_N:     //读取vauxp3_vauxn3
                    begin
                       // daddr_in <= 7'h05;  更改地址
                        daddr_in <=7'h13;
                        den_in_vec <= { 1'b0 , den_in_vec[1] };
                        if( drdy_out )
                            state <= READ_V_REF_N;
                        else
                            state <= EN_V_REF_N;
                    end
                    READ_V_REF_N:
                    begin
                        v_ref_n <= do_out;
                        den_in_vec = 2'h2;
                        state <= EN_VCCBRAM;
                    end
                    EN_VCCBRAM:
                    begin
                        daddr_in <= 7'h06;
                        den_in_vec <= { 1'b0 , den_in_vec[1] };
                        if( drdy_out )
                            state <= READ_VCCBRAM;
                        else
                            state <= EN_VCCBRAM;
                    end
                    READ_VCCBRAM:
                    begin
                        vccbram <= do_out;
                        den_in_vec = 2'h2;
                        state <= WAITTING; //一组信号读取完毕，回到等待状态，等待下一组信号
                    end
                    default:
                    begin
                        state <= RESET;
                    end
                endcase
            end
    end
    //ip_xadc
    xadc_wiz_0
    instance_of_xadc
    (
        .di_in(di_in), // input wire [15 : 0] di_in //数据输入
        .daddr_in(daddr_in), // input wire [6 : 0] daddr_in //地址
        .den_in(den_in_vec[0]), // input wire den_in//DPR使能信号
        .dwe_in(dwe_in_vec[0]), // input wire dwe_in//写使能信号
        .drdy_out(drdy_out), // output wire drdy_out//数据准备好信号，输出时拉高
        .do_out(do_out), // output wire [15 : 0] do_out //数据输出
        .dclk_in(dclk_in), // input wire dclk_in //时钟输入
        .reset_in(reset_in), // input wire reset_in //复位信号
        .vp_in(vp_in), // input wire vp_in 
        .vn_in(vn_in), // input wire vn_in
        .vauxp1(vauxp1), // input wire vauxp1
        .vauxn1(vauxn1), // input wire vauxn1
        .vauxp2(vauxp2), // input wire vauxn2
        .vauxn2(vauxn2), // input wire vauxn2
        .vauxp3(vauxp3), // input wire vauxp3
        .vauxn3(vauxn3), // input wire vauxn3
        .user_temp_alarm_out(user_temp_alarm_out), // output wire user_temp_alarm_out //用户温度报警
        .vccint_alarm_out(vccint_alarm_out), // output wire vccint_alarm_out //VCCINT报警
        .vccaux_alarm_out(vccaux_alarm_out), // output wire vccaux_alarm_out //VCCAUX报警
        .ot_out(ot_out), // output wire ot_out 
        .channel_out(channel_out), // output wire [4 : 0] channel_out //通道号
        .eoc_out(eoc_out), // output wire eoc_out //转换完成后拉高,完成一次转换
        .alarm_out(alarm_out), // output wire alarm_out //报警信号
        .eos_out(eos_out), // output wire eos_out //转换序列完成后拉高，完成一组转换
        .busy_out(busy_out) // output wire busy_out //忙信号，转换进行时拉高
    );
endmodule
