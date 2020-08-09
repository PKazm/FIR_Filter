//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
//Date        : Sun Aug  9 13:47:16 2020
//Host        : Phoenix136DESKY running 64-bit major release  (build 9200)
//Command     : generate_target FIR_Filter_AXI_test_bd_wrapper.bd
//Design      : FIR_Filter_AXI_test_bd_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module FIR_Filter_AXI_test_bd_wrapper
   (clk,
    interrupt,
    rst,
    rstn);
  input clk;
  output interrupt;
  input rst;
  input rstn;

  wire clk;
  wire interrupt;
  wire rst;
  wire rstn;

  FIR_Filter_AXI_test_bd FIR_Filter_AXI_test_bd_i
       (.clk(clk),
        .interrupt(interrupt),
        .rst(rst),
        .rstn(rstn));
endmodule
