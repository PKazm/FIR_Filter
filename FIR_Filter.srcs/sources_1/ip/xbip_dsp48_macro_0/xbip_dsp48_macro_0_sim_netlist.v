// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Aug  8 13:35:54 2020
// Host        : Phoenix136DESKY running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Github_Repos/FIR_Filter_Type1/FIR_Filter_Type1.srcs/sources_1/ip/xbip_dsp48_macro_0/xbip_dsp48_macro_0_sim_netlist.v
// Design      : xbip_dsp48_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "xbip_dsp48_macro_0,xbip_dsp48_macro_v3_0_17,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "xbip_dsp48_macro_v3_0_17,Vivado 2020.1" *) 
(* NotValidForBitStream *)
module xbip_dsp48_macro_0
   (A,
    B,
    C,
    D,
    P);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [24:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [17:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [47:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [24:0]D;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;

  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire [24:0]D;
  wire [47:0]P;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "25" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "25" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "64" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000011010100001000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000000000000000000000000" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C(C),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(1'b1),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(1'b1),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D(D),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule

(* C_A_WIDTH = "25" *) (* C_B_WIDTH = "18" *) (* C_CONCAT_WIDTH = "48" *) 
(* C_CONSTANT_1 = "1" *) (* C_C_WIDTH = "48" *) (* C_D_WIDTH = "25" *) 
(* C_HAS_A = "1" *) (* C_HAS_ACIN = "0" *) (* C_HAS_ACOUT = "0" *) 
(* C_HAS_B = "1" *) (* C_HAS_BCIN = "0" *) (* C_HAS_BCOUT = "0" *) 
(* C_HAS_C = "1" *) (* C_HAS_CARRYCASCIN = "0" *) (* C_HAS_CARRYCASCOUT = "0" *) 
(* C_HAS_CARRYIN = "0" *) (* C_HAS_CARRYOUT = "0" *) (* C_HAS_CE = "0" *) 
(* C_HAS_CEA = "0" *) (* C_HAS_CEB = "0" *) (* C_HAS_CEC = "0" *) 
(* C_HAS_CECONCAT = "0" *) (* C_HAS_CED = "0" *) (* C_HAS_CEM = "0" *) 
(* C_HAS_CEP = "0" *) (* C_HAS_CESEL = "0" *) (* C_HAS_CONCAT = "0" *) 
(* C_HAS_D = "1" *) (* C_HAS_INDEP_CE = "0" *) (* C_HAS_INDEP_SCLR = "0" *) 
(* C_HAS_PCIN = "0" *) (* C_HAS_PCOUT = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_SCLRA = "0" *) (* C_HAS_SCLRB = "0" *) (* C_HAS_SCLRC = "0" *) 
(* C_HAS_SCLRCONCAT = "0" *) (* C_HAS_SCLRD = "0" *) (* C_HAS_SCLRM = "0" *) 
(* C_HAS_SCLRP = "0" *) (* C_HAS_SCLRSEL = "0" *) (* C_LATENCY = "64" *) 
(* C_MODEL_TYPE = "0" *) (* C_OPMODES = "000000000011010100001000" *) (* C_P_LSB = "0" *) 
(* C_P_MSB = "47" *) (* C_REG_CONFIG = "00000000000000000000000000000000" *) (* C_SEL_WIDTH = "0" *) 
(* C_TEST_CORE = "0" *) (* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) 
(* ORIG_REF_NAME = "xbip_dsp48_macro_v3_0_17" *) (* downgradeipidentifiedwarnings = "yes" *) 
module xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17
   (CLK,
    CE,
    SCLR,
    SEL,
    CARRYCASCIN,
    CARRYIN,
    PCIN,
    ACIN,
    BCIN,
    A,
    B,
    C,
    D,
    CONCAT,
    ACOUT,
    BCOUT,
    CARRYOUT,
    CARRYCASCOUT,
    PCOUT,
    P,
    CED,
    CED1,
    CED2,
    CED3,
    CEA,
    CEA1,
    CEA2,
    CEA3,
    CEA4,
    CEB,
    CEB1,
    CEB2,
    CEB3,
    CEB4,
    CECONCAT,
    CECONCAT3,
    CECONCAT4,
    CECONCAT5,
    CEC,
    CEC1,
    CEC2,
    CEC3,
    CEC4,
    CEC5,
    CEM,
    CEP,
    CESEL,
    CESEL1,
    CESEL2,
    CESEL3,
    CESEL4,
    CESEL5,
    SCLRD,
    SCLRA,
    SCLRB,
    SCLRCONCAT,
    SCLRC,
    SCLRM,
    SCLRP,
    SCLRSEL);
  input CLK;
  input CE;
  input SCLR;
  input [0:0]SEL;
  input CARRYCASCIN;
  input CARRYIN;
  input [47:0]PCIN;
  input [29:0]ACIN;
  input [17:0]BCIN;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [24:0]D;
  input [47:0]CONCAT;
  output [29:0]ACOUT;
  output [17:0]BCOUT;
  output CARRYOUT;
  output CARRYCASCOUT;
  output [47:0]PCOUT;
  output [47:0]P;
  input CED;
  input CED1;
  input CED2;
  input CED3;
  input CEA;
  input CEA1;
  input CEA2;
  input CEA3;
  input CEA4;
  input CEB;
  input CEB1;
  input CEB2;
  input CEB3;
  input CEB4;
  input CECONCAT;
  input CECONCAT3;
  input CECONCAT4;
  input CECONCAT5;
  input CEC;
  input CEC1;
  input CEC2;
  input CEC3;
  input CEC4;
  input CEC5;
  input CEM;
  input CEP;
  input CESEL;
  input CESEL1;
  input CESEL2;
  input CESEL3;
  input CESEL4;
  input CESEL5;
  input SCLRD;
  input SCLRA;
  input SCLRB;
  input SCLRCONCAT;
  input SCLRC;
  input SCLRM;
  input SCLRP;
  input SCLRSEL;

  wire \<const0> ;
  wire [24:0]A;
  wire [17:0]B;
  wire [47:0]C;
  wire [24:0]D;
  wire [47:0]P;
  wire NLW_i_synth_CARRYCASCOUT_UNCONNECTED;
  wire NLW_i_synth_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_i_synth_ACOUT_UNCONNECTED;
  wire [17:0]NLW_i_synth_BCOUT_UNCONNECTED;
  wire [47:0]NLW_i_synth_PCOUT_UNCONNECTED;

  assign ACOUT[29] = \<const0> ;
  assign ACOUT[28] = \<const0> ;
  assign ACOUT[27] = \<const0> ;
  assign ACOUT[26] = \<const0> ;
  assign ACOUT[25] = \<const0> ;
  assign ACOUT[24] = \<const0> ;
  assign ACOUT[23] = \<const0> ;
  assign ACOUT[22] = \<const0> ;
  assign ACOUT[21] = \<const0> ;
  assign ACOUT[20] = \<const0> ;
  assign ACOUT[19] = \<const0> ;
  assign ACOUT[18] = \<const0> ;
  assign ACOUT[17] = \<const0> ;
  assign ACOUT[16] = \<const0> ;
  assign ACOUT[15] = \<const0> ;
  assign ACOUT[14] = \<const0> ;
  assign ACOUT[13] = \<const0> ;
  assign ACOUT[12] = \<const0> ;
  assign ACOUT[11] = \<const0> ;
  assign ACOUT[10] = \<const0> ;
  assign ACOUT[9] = \<const0> ;
  assign ACOUT[8] = \<const0> ;
  assign ACOUT[7] = \<const0> ;
  assign ACOUT[6] = \<const0> ;
  assign ACOUT[5] = \<const0> ;
  assign ACOUT[4] = \<const0> ;
  assign ACOUT[3] = \<const0> ;
  assign ACOUT[2] = \<const0> ;
  assign ACOUT[1] = \<const0> ;
  assign ACOUT[0] = \<const0> ;
  assign BCOUT[17] = \<const0> ;
  assign BCOUT[16] = \<const0> ;
  assign BCOUT[15] = \<const0> ;
  assign BCOUT[14] = \<const0> ;
  assign BCOUT[13] = \<const0> ;
  assign BCOUT[12] = \<const0> ;
  assign BCOUT[11] = \<const0> ;
  assign BCOUT[10] = \<const0> ;
  assign BCOUT[9] = \<const0> ;
  assign BCOUT[8] = \<const0> ;
  assign BCOUT[7] = \<const0> ;
  assign BCOUT[6] = \<const0> ;
  assign BCOUT[5] = \<const0> ;
  assign BCOUT[4] = \<const0> ;
  assign BCOUT[3] = \<const0> ;
  assign BCOUT[2] = \<const0> ;
  assign BCOUT[1] = \<const0> ;
  assign BCOUT[0] = \<const0> ;
  assign CARRYCASCOUT = \<const0> ;
  assign CARRYOUT = \<const0> ;
  assign PCOUT[47] = \<const0> ;
  assign PCOUT[46] = \<const0> ;
  assign PCOUT[45] = \<const0> ;
  assign PCOUT[44] = \<const0> ;
  assign PCOUT[43] = \<const0> ;
  assign PCOUT[42] = \<const0> ;
  assign PCOUT[41] = \<const0> ;
  assign PCOUT[40] = \<const0> ;
  assign PCOUT[39] = \<const0> ;
  assign PCOUT[38] = \<const0> ;
  assign PCOUT[37] = \<const0> ;
  assign PCOUT[36] = \<const0> ;
  assign PCOUT[35] = \<const0> ;
  assign PCOUT[34] = \<const0> ;
  assign PCOUT[33] = \<const0> ;
  assign PCOUT[32] = \<const0> ;
  assign PCOUT[31] = \<const0> ;
  assign PCOUT[30] = \<const0> ;
  assign PCOUT[29] = \<const0> ;
  assign PCOUT[28] = \<const0> ;
  assign PCOUT[27] = \<const0> ;
  assign PCOUT[26] = \<const0> ;
  assign PCOUT[25] = \<const0> ;
  assign PCOUT[24] = \<const0> ;
  assign PCOUT[23] = \<const0> ;
  assign PCOUT[22] = \<const0> ;
  assign PCOUT[21] = \<const0> ;
  assign PCOUT[20] = \<const0> ;
  assign PCOUT[19] = \<const0> ;
  assign PCOUT[18] = \<const0> ;
  assign PCOUT[17] = \<const0> ;
  assign PCOUT[16] = \<const0> ;
  assign PCOUT[15] = \<const0> ;
  assign PCOUT[14] = \<const0> ;
  assign PCOUT[13] = \<const0> ;
  assign PCOUT[12] = \<const0> ;
  assign PCOUT[11] = \<const0> ;
  assign PCOUT[10] = \<const0> ;
  assign PCOUT[9] = \<const0> ;
  assign PCOUT[8] = \<const0> ;
  assign PCOUT[7] = \<const0> ;
  assign PCOUT[6] = \<const0> ;
  assign PCOUT[5] = \<const0> ;
  assign PCOUT[4] = \<const0> ;
  assign PCOUT[3] = \<const0> ;
  assign PCOUT[2] = \<const0> ;
  assign PCOUT[1] = \<const0> ;
  assign PCOUT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_WIDTH = "25" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "25" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "1" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "64" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000000000011010100001000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000000000000000000000000" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* KEEP_HIERARCHY = "soft" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  xbip_dsp48_macro_0_xbip_dsp48_macro_v3_0_17_viv i_synth
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_i_synth_ACOUT_UNCONNECTED[29:0]),
        .B(B),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_i_synth_BCOUT_UNCONNECTED[17:0]),
        .C(C),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_i_synth_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_i_synth_CARRYOUT_UNCONNECTED),
        .CE(1'b0),
        .CEA(1'b0),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEA3(1'b0),
        .CEA4(1'b0),
        .CEB(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEB3(1'b0),
        .CEB4(1'b0),
        .CEC(1'b0),
        .CEC1(1'b0),
        .CEC2(1'b0),
        .CEC3(1'b0),
        .CEC4(1'b0),
        .CEC5(1'b0),
        .CECONCAT(1'b0),
        .CECONCAT3(1'b0),
        .CECONCAT4(1'b0),
        .CECONCAT5(1'b0),
        .CED(1'b0),
        .CED1(1'b0),
        .CED2(1'b0),
        .CED3(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CESEL(1'b0),
        .CESEL1(1'b0),
        .CESEL2(1'b0),
        .CESEL3(1'b0),
        .CESEL4(1'b0),
        .CESEL5(1'b0),
        .CLK(1'b1),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D(D),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_i_synth_PCOUT_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
mVSg04jx48ohF6ET+GPgL/18xNlqSjc68SAwWWVL7ETIEhL/N/IEEa794563sOuKxSt0Kl67y+94
UB0egY5nGg==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lmyXeW6W5x34OcR/9HBy5DakFHbrAP2VPoaQ3ab68lLfG02ITRD3w7EdbM/TyvDE2AithtcpGANE
xoGGRFEy5XpfEmD0vRdB2QdH78Q3znXmRJJRNPPn0gBDy8HiV5ndsmD/LeinHmOe8eK7LpDgq37J
/At5o0EqFZW3WjRL3sk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ScNmNM0W62HGNpFgTi5FAXgfrWYsig59kPYL2q8QE5KGweGkCLDCL7Hkobrafd5P88QLcDON+uhX
IyI83xgtYqHn9XvdBn8HqJzARuJNNTON3Zj7Cg0wwXEkJtSsBQmXcAr8B8YlHB5Ot1eWfmo01yW2
ucT2GUyoADNv1dAw9b6BSTAsVTnSGRaLEFNmWdsXqE9NxNE2TgfO5x/a8DTy3f4g5X7/hJLCKpg4
wudzUxG+uR7hx57H8Q09kX8BvU+C37l5Ltf3PNYwwUbKRz/EM4tLYtmrZC9s12buYcsYbj6wNTU7
3gzKdMayi7u7lq3LMlQDerpr0jYxylPt4GrIOA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
e87Uz7OgoObx921b4TAOTFPf7RdEkGb5ZVAdacGLXY7GMiPCfCc7YMl+VeJl5YDir0JYQiTkbhLh
mLscEPt5ONOoiBzAJqkKFldx6auMyo+P/7DiauuYIbPgkW7umqOxwZfrmjnw20eMtarltmzr6AGp
6aopNGbAJEL+hwyM5JFo5kit3y/Ea4LUEzIW9ld9DY+p0Ihvdhdfy0zQmToIHb/Np9zzKX8tpOC3
Fa4uXF8qCvbeUJr6LjjXyQB+06m7Lz0C23RJ4hC9KIerHxpF3jfuAzHKSvlLatWH1Yh0cIKx7k/y
DKMp82d5B3CU6d7/9rRzzzXEniDDeg47rWYfDg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
N9AuFk0bI81JYG49sYg/AXtRGVFdClaczQEWHn/vG0tDAjhQ2qA0GYN+86AxMP6Eq5ZUOynxdshU
bN1lWaCpVjK938uUJqRzJ07jB62cIexo8C/g1/2x8b1jzFGqoZaH8XuvvhE2jws7SBqjDWp6QqwF
DccZxmM0BtqxnQ0vOxg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
ksqAObrv2EPWm9QjMQbS9Jri8+lbIuMSp3qiCFd7V5lqBbL7GPCdYLZeldgitO6uJU6g/HJUdlqY
vAtACW1AEC8JJxRRn91cFSbi+kvg64hC5Vnug+KdRN6vjapzUK4c/DIOy6/+2jRigEC+IX4vaS+x
i+Oi2k1i9ZiAzw7qzBPTCbiy3fIyNxT8GQf6HanMu/28I8MRYfhgvQ7ol1S003awbKh+hQ0F0PzV
QKh9CDlIz8s1WyXc+huI2QS1FG60KK6XWZ0aalbB+Lt5+x9Z8uV4zUAwJB1XlcNRMiM5SkjkIg9r
y6yFAGmNR5T5BqgWguE62jSBd9Zfnh8JXP2NOQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yejHCke96a3eh+No32kwjUcXbwCyaPKyFR3prOsF6TJCbrqwfvvxDeC6TSDIUBXnczwcjZGdrJzh
kWpgjQJo/+Fhj4Ofu3XGUwSa6fkycuNX9V9NKeCjQKWKmMwRn7y3etJWdJ9gQzeiKRshRI1cO1mT
xKbyArTNkWP2ZyuWXsKVeN/uv2UAnGmIkXXlm+ydbtEEypSYfKGvayajQjpQkN9HKz13nMpeuMc9
6DMCTp2atZYYbmvMLGsYr48d8enLKwx68sd7DuvTAfi41FUDiRNDI4vopTU0JcRKcjXGPRMY8yoc
XZdRPSINaUGZCdPmtfc2gza4Uxt7sTq51XGfrg==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qGh3mlgVn/697cVM/wVbbB7SoNiFJgOKvbMq77owzjnL3crAcnY8GFt3Q08R5QyrP2hHuw8Lswju
dXYOZ3/oAi7aUy1kyPLhuKPWeWxo3+dYvubUpGt2JG+EAT+jldyl+H25jnvNn+t3heQmGgAsd2nd
MIq2UzPXQ2RVJZa9xZCPPHg1CnXHeNMi4uv/6DX4+JoQGVTyGQXjGOxnxJ5b8V7W4BbY/opssAME
iaFMorNt/wd5IaLUhZ9xN1hAax910Vrp1kXD6WAysFoxMIabE4Oq3hm6M7fi2AGw5K+4HIYSfrvh
X+3VnMAwckadGO97+iJkxqNFTAR1vyW1StWhFw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Pui+6jIzuAMgIrqBhLPkObysF1xlKfNhOoUcMAEnnCukOSOFRG7FlFnE35Y7dv5tVrcj1zyjpjBM
sXZv8anrAKSRvqeJBa6ob74VpJPjY03nbvpX9cKAy/35SoT0G/h13Vq3R2V8237P13necwIXQCfi
FgiqLcEwSK/bMDkKeuJaUpwJpR8qwpPU/FFCN+14kb6y7BVbAlPLvxPiBFnHkQ0W9XitUAeU5Av4
b/BxC9luLD7NZ4l0iN1eD7w84NtO4AbC9x8FYMuqAJcqo8/Zjs/UMMfZBMLhUGeSSe0TmZVZxuPo
q7heU5cfCjNVluZN/Uc2IX1ahWmYJ5tO7GDp5A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
I5SnHDymmg8jT9fc32kLqK4lq9bmsfQJBqDS9H/TNR+iv68zMoeIJjUPXhLYyIoQdCGT7e2ClFw4
0UeJ470m8rbKlgIBiISpLQ8hd+nsa5e1yvnoKiR2U18ZmdAdl/fWANXPlbguX8QhV+zKgANuKJJL
fluJYuYJoaLXQT4uaM1WSzhB/1a1CrgFaJIGTqW7E4pihuNHI27WOx3p6esOPKHvBH8bPjwTS/jh
daYnB/w11NcTwsGMmE0I/86chqKx853MiQF3bu+wihy4B0VFm2M4OC3L00Lp0CaTuRFfAMMU25mm
Q6GvQcS2GLg6p4Kpd7HZicnmtH+cuZDuO3KYGw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ma3k8ZMoUiBzNVB/C53Sht93QFTUQQvl3W94T1fe4xi0KPLe3rxwV1BrsXVHN43yIHtT6yNrz5pk
6JFm5nny/95cYl9qVIQXB3UTfW/cmT7TQTsRKuxOR71XsqUi8o2RceDNqPRblpDQgW40bh+Io7nK
UjnFsKLYHphIj2pgdm14b+zrN8ey0utxnqbS4zGfRfSSOQSwQOk7k7jpjqBijvw1zhkQOLQVa4aF
+gjNj6nRc9JVI1sPJIahwwL6/4mi3u7TQTXcsF38gksC1jW5B5x45+0idhsam5tE/oau096LDvyi
pq0qJsb3pggq2YysbhaHMsOBvtEpZZ+CjpawGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14672)
`pragma protect data_block
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
cuVRV3j6FxvWTbI/S3v3ExDUbpgUUBU=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
