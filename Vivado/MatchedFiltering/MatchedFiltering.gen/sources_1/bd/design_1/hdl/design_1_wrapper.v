//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sat Feb 26 16:04:26 2022
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (OUT_IMAG,
    OUT_REAL,
    clk,
    m_axis_data_tvalid_1,
    m_axis_data_tvalid_2,
    m_axis_data_tvalid_3,
    m_axis_data_tvalid_4,
    resetn);
  output [15:0]OUT_IMAG;
  output [15:0]OUT_REAL;
  input clk;
  output m_axis_data_tvalid_1;
  output m_axis_data_tvalid_2;
  output m_axis_data_tvalid_3;
  output m_axis_data_tvalid_4;
  input resetn;

  wire [15:0]OUT_IMAG;
  wire [15:0]OUT_REAL;
  wire clk;
  wire m_axis_data_tvalid_1;
  wire m_axis_data_tvalid_2;
  wire m_axis_data_tvalid_3;
  wire m_axis_data_tvalid_4;
  wire resetn;

  design_1 design_1_i
       (.OUT_IMAG(OUT_IMAG),
        .OUT_REAL(OUT_REAL),
        .clk(clk),
        .m_axis_data_tvalid_1(m_axis_data_tvalid_1),
        .m_axis_data_tvalid_2(m_axis_data_tvalid_2),
        .m_axis_data_tvalid_3(m_axis_data_tvalid_3),
        .m_axis_data_tvalid_4(m_axis_data_tvalid_4),
        .resetn(resetn));
endmodule
