// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri May 12 11:50:38 2023
// Host        : LAPTOP-PO5T5O89 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ Adder_sim_netlist.v
// Design      : Adder
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Adder,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (A,
    B,
    CLK,
    ADD,
    SCLR,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [41:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [41:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 add_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME add_intf, LAYERED_METADATA undef" *) input ADD;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [41:0]S;

  wire [41:0]A;
  wire ADD;
  wire [41:0]B;
  wire CLK;
  wire [41:0]S;
  wire SCLR;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_ADD_MODE = "2" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "42" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "000000000000000000000000000000000000000000" *) 
  (* C_B_WIDTH = "42" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "42" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11 U0
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "2" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "42" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "000000000000000000000000000000000000000000" *) 
(* C_B_WIDTH = "42" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "1" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "42" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [41:0]A;
  input [41:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [41:0]S;

  wire \<const0> ;
  wire [41:0]A;
  wire ADD;
  wire [41:0]B;
  wire CLK;
  wire [41:0]S;
  wire SCLR;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_MODE = "2" *) 
  (* C_AINIT_VAL = "0" *) 
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "42" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_BYPASS_LOW = "0" *) 
  (* C_B_CONSTANT = "0" *) 
  (* C_B_TYPE = "0" *) 
  (* C_B_VALUE = "000000000000000000000000000000000000000000" *) 
  (* C_B_WIDTH = "42" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_BYPASS = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_C_IN = "0" *) 
  (* C_HAS_C_OUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "1" *) 
  (* C_LATENCY = "2" *) 
  (* C_OUT_WIDTH = "42" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_c_addsub_v12_0_11_viv xst_addsub
       (.A(A),
        .ADD(ADD),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
iO2Bdkfy0dqqValMR4KhTWXpD0gDQF+kyoly3tZBTZTVs0CbWJ4Owhu4jxMCf8X2gbWR6iweF6Ks
B5dmLHZTDA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
dbcEbgyZfx3YLmYpvjegvD9sRQCV1qBv0GqFBvCakC3SMR/H82zqo5uv5MZldBGUVmNHnxF3Vejx
zSqxUKfTNc90CS6quuoQe0eeq3T5XSdgwbNtjPZKvJuJTmQKT96yB3CfQOz13fGjaLrn/8NBUBBh
I7OEoGGg7ADph9V3vRg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bD3a4YgAnaoJx9/hljj2C1rODcUhawTVE1gtdPkNj8/YjemaFM6/sF7Q0CXbDJ7a+OBrB5pUgj3O
Vesi4yVmFp+mGmFarftWat5KmZiP3RVWrXwdzMj+f8T7p+lE3iD4njqUxIUz0TsUaNvFeW0xVNNb
OwTEX04nyt5HrU82dltJCclpFxE6yrP9YvI7l328bphwnC63xxk8T3yXwCrvj3VrIYuDT2yMRxrB
TBCv/Fe2f07JQyV73J7+DGAeJG0B1dTHeu48auQT63g1HsYaUXREihEUKgZe70QlOqlPbrr6Quhx
2LXE8LSdCA+FbJ7LlQc/Sgasj3ZYjM5lhEKleQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GCfR7acMSeEtOw1DhZKkUXjh9Uw/vUar7CGDRG9rZcB9NFDtQTltJeuKjFg8eaeKH9HFBMryuX72
/tmzhtFaiSTjr2na4ncL2XV3QRXe7nQaiHdc7cKBcZDvdSSMzOSYcIxLunwLwQTLC7sCvINmlxO1
NXnYzJVL1xb9HP8QVnSYpo1p+gCXcRBZzrOjZjCUnl7F2t3ZZStSGjBEyXVLnV+ouU3+247oJAOa
kC7v+pOtG2ho4KclIg0MGijjPs+jyOFU+b5C+ufQp/zL9GiZ5waCjb/0Y1vkBc9jZKR7YRnv+ASG
ju1uP8oqEXR9742kXRnW4HkMKkCK1MLDgWYdqw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L+AGKmFZ1zoRJFd2cA+zxJhkgQ1R0aEjGQCGRFLNNhLHZXpzGDIjdSLjralBVRJ2rD6UcJutapF5
YaMoV9kphGGG2B07dxBuIimVjOxS3ZQJ7ru59ddfGBxUe9EHrv00Q5hTwoxig0lxqnmjSSnfsDeF
weTIqNnXkG5kqqezKC8a2FvUD5QWQBibhK69OAdmhhIOwZmpfvQKbEKgLX70BzcNlmLnttRL7G+q
XZ3fabZ42+JJHDLiIfveB3Gp2Lf2tzTH1u2xx5aEUr9154pnC9PWIwL3y3VBAT1oHR7ScdoGDOEy
HoYUiDibldOidIeKW0KrTeAIuBNmtM4R0R+RSA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
V5ClnklUs5Wo++EDemG/KeowZlAfqB8SUrvSxPQGrdIwGfUvoCajhuABAWdS/L/pQl7Eyz51aiuw
KzPMrWtQozAEITf1xzvzgKbWZqoi4PQD3rThywFsFq60u8DdvHYM/kEvit0cZVFvG8rAbtlseHLu
0vU1kbrNgxb3bxjOovg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cRqAgScIUeXUwYGfCC0XDtpcc+mFNm3p8oTcFdtIU1nnlMagpBMqRm5ELc+m/Yw8jBwvcvt4tUFv
u/ypEEw+y12B+5Pr6SmnLJ+NVB3Q3Eyh4Q/d7p3jReIIsUxrlENpCTi4PVXMKr1B1Htzm8F8mXDq
y2UV+0SC+4yrBIntsdS0S8jPBERhfJhzNC5z38pPHANtM4wGGIUuKxIALLz1aq+2AjLbEgFHNrzw
2bJiDwRSTwrY4Yx2MSzYJk3O+cQBUe8nJDPx+aGEvDzQ4ZdJMNg2z+iaiE7OTaqK492Jb/1jvU0j
wlI+n35s2rrnc9QgfljdOJuueruPuYDi5vTTxA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
X+RmNXf5R4ejRWtpxlvDtvdm1BI6bgiAb9DbRlDuKf7T2aErCcyjva6lStFqLJJaZ9ggKuUL7zt6
XaVH5mdLaxx5yDq+h488hqOIJDdHgEiHGFAjhBYSFSjOMnqcVd12mFIBRG48qeuYKr4l3e4Hl4tS
WDmAkiqxwC4sqhUGTu093SPVOJjU4TNCOYUbWibwW8Qzn10Au5M2H0bzf48O6ACE3lM2i3nHEeXe
A/0TsyKWI/qTsIkIt8BK7BM60wQs6d6iaVMFmiCIqcGxpaH5XiVBh+oDbVzMqIN7XNijklzxM3Kw
w5qXR/lxcXOSQoui3mNHbMD7cijM7Lq69DSj4Q==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jDVGtVlDuvl7XLEtrYx2V8Lahm3gDh8znfOACTdWTDJMtW3rD4xy2ZoZ5onVwV5BaDg1sF/5xOeB
ZDcc//fgn/jDK2+4q8GGo/sekmUfwypS3E6YzOgJLXU2Z4Un0r50qkgKFptiarKojdyXh2+mEFpe
WrGjTkAzYMdYknrfaAlXK4B6IvnRSgq8pMDirGp8Xbfb3ZpFRqAM/njPPXYkWsgtI0YkxgQOewMd
PR0oX1LEnfcc13GKZL/COn58SBLHFdYdt+z3lpVK5RUBRwYaUwj++qRnymBsElrRibrb7aCsBff8
PJEbB56EQ+lgGLjigaayGyBN6VMFAZjjucdNDw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11952)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
