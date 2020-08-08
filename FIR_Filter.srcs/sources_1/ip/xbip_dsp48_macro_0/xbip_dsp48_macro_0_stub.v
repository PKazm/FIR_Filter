// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Sat Aug  8 13:35:54 2020
// Host        : Phoenix136DESKY running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Github_Repos/FIR_Filter_Type1/FIR_Filter_Type1.srcs/sources_1/ip/xbip_dsp48_macro_0/xbip_dsp48_macro_0_stub.v
// Design      : xbip_dsp48_macro_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "xbip_dsp48_macro_v3_0_17,Vivado 2020.1" *)
module xbip_dsp48_macro_0(A, B, C, D, P)
/* synthesis syn_black_box black_box_pad_pin="A[24:0],B[17:0],C[47:0],D[24:0],P[47:0]" */;
  input [24:0]A;
  input [17:0]B;
  input [47:0]C;
  input [24:0]D;
  output [47:0]P;
endmodule
