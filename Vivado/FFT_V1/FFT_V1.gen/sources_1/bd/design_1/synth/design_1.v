//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Thu Nov 25 03:22:59 2021
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk,
    m_axis_data_tdata,
    m_axis_data_tvalid,
    resetn,
    s_axis_data_tlast);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET resetn, CLK_DOMAIN design_1_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output [31:0]m_axis_data_tdata;
  output m_axis_data_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;
  input s_axis_data_tlast;

  wire aclk_0_1;
  wire [31:0]datasrc_0_tdata;
  wire datasrc_0_tvalid;
  wire resetn_0_1;
  wire s_axis_data_tlast_0_1;
  wire [31:0]xfft_0_m_axis_data_tdata;
  wire xfft_0_m_axis_data_tlast;
  wire xfft_0_m_axis_data_tvalid;
  wire xfft_0_s_axis_data_tready;
  wire [7:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;

  assign aclk_0_1 = clk;
  assign m_axis_data_tdata[31:0] = xfft_0_m_axis_data_tdata;
  assign m_axis_data_tvalid = xfft_0_m_axis_data_tvalid;
  assign resetn_0_1 = resetn;
  assign s_axis_data_tlast_0_1 = s_axis_data_tlast;
  design_1_dataWrite_0_0 dataWrite_0
       (.clk(aclk_0_1),
        .data(xfft_0_m_axis_data_tdata),
        .tlast(xfft_0_m_axis_data_tlast),
        .tvalid(xfft_0_m_axis_data_tvalid));
  design_1_datasrc_0_0 datasrc_0
       (.clk(aclk_0_1),
        .resetn(resetn_0_1),
        .tdata(datasrc_0_tdata),
        .tready(xfft_0_s_axis_data_tready),
        .tvalid(datasrc_0_tvalid));
  design_1_xfft_0_0 xfft_0
       (.aclk(aclk_0_1),
        .m_axis_data_tdata(xfft_0_m_axis_data_tdata),
        .m_axis_data_tlast(xfft_0_m_axis_data_tlast),
        .m_axis_data_tready(xlconstant_1_dout),
        .m_axis_data_tvalid(xfft_0_m_axis_data_tvalid),
        .s_axis_config_tdata(xlconstant_0_dout),
        .s_axis_config_tvalid(xlconstant_1_dout),
        .s_axis_data_tdata(datasrc_0_tdata),
        .s_axis_data_tlast(s_axis_data_tlast_0_1),
        .s_axis_data_tready(xfft_0_s_axis_data_tready),
        .s_axis_data_tvalid(datasrc_0_tvalid));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  design_1_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
endmodule
