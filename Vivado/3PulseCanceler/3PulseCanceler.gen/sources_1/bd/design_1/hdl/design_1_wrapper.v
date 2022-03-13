//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Mon Mar  7 00:26:46 2022
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk,
    data_OUT_TDATA,
    data_OUT_TVALID,
    resetn);
  input clk;
  output [31:0]data_OUT_TDATA;
  output data_OUT_TVALID;
  input resetn;

  wire clk;
  wire [31:0]data_OUT_TDATA;
  wire data_OUT_TVALID;
  wire resetn;

  design_1 design_1_i
       (.clk(clk),
        .data_OUT_TDATA(data_OUT_TDATA),
        .data_OUT_TVALID(data_OUT_TVALID),
        .resetn(resetn));
endmodule
