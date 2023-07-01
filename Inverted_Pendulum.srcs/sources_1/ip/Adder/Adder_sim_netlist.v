// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri May 12 11:50:39 2023
// Host        : LAPTOP-PO5T5O89 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/VIVADO/homwork3question2/XADC_test/XADC_test.srcs/sources_1/ip/Adder/Adder_sim_netlist.v
// Design      : Adder
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "Adder,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module Adder
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
  Adder_c_addsub_v12_0_11 U0
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
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_addsub_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module Adder_c_addsub_v12_0_11
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
  Adder_c_addsub_v12_0_11_viv xst_addsub
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
ZIBJvJw6saj87ilOqM75vjOscF4qEkV6t5TsQNre4DIsbCt5KzOej3fXhw2LpbaPKxvmOs2NQM6w
5WLPsINtIuASp33cQDiRWdgViNLIZvi4v8OnaCfaKn/tgFbIjCUXiswO8KFM9JmN5i/7IcVCZcrt
yxaiZSa0pkxgmZqy6jjsj/hb9HYmB7PB3dmUsFqWAa5jFKEwJbxVtKKZfOHAWcAvN+8H/xyUeKML
MM45VNhorZsUvLb7+m0qm8IIrFdZ/Fk5B993boqSaHOtFNCqyd635NFcbEfEP0E+r0spB7yTgB2l
qiQM7cpwKAYu/duY8k66TDhepYjXRbyUn19lBA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
286vzY6qZdb8ntTaXKVKQckppHs8dgj/eiuR2Akes0xkVRqTodyrAVGX6q4zAzArf5gmPqNWP32+
vfFBLUlyglgYuad3gVs+iTRZtXSE91Z06K4cgP+O+RNWY1Nmv5Jb4BKLVNcn32vFsr8Y5ZL51gey
2gkYhYu4FchpyQoohvLkyCK7+CVMzl73yj+Xdr8jmGesjgGfUzoEcopqzwopAIVz/OeeaxYaIhf8
0Mx7xb++GcLnxvL7/99KQuO87MFRsIsI9vDln1ycQx/67mlj3ucq+fcJmGxhfBu+RJBTWOi/X5e3
XfRCJRA+lxqPNS4ZVHI1QafhitPQcnIrhQqKqw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11856)
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
