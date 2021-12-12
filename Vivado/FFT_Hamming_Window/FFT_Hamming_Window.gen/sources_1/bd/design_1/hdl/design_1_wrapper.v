//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sun Dec 12 15:58:32 2021
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (aclk,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tvalid,
    nreset);
  input aclk;
  output [31:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output m_axis_data_tvalid;
  input nreset;

  wire aclk;
  wire [31:0]m_axis_data_tdata;
  wire m_axis_data_tlast;
  wire m_axis_data_tvalid;
  wire nreset;

  design_1 design_1_i
       (.aclk(aclk),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(m_axis_data_tlast),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .nreset(nreset));
endmodule
