//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Mon Mar  7 00:26:46 2022
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk,
    data_OUT_TDATA,
    data_OUT_TVALID,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET resetn, CLK_DOMAIN design_1_clk_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output [31:0]data_OUT_TDATA;
  output data_OUT_TVALID;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;

  wire clk_0_1;
  wire [31:0]datasrc_0_tdata;
  wire datasrc_0_tvalid;
  wire resetn_0_1;
  wire top_0_data_IN_TREADY;
  wire [31:0]top_0_data_OUT_TDATA;
  wire top_0_data_OUT_TVALID;
  wire [0:0]xlconstant_0_dout;

  assign clk_0_1 = clk;
  assign data_OUT_TDATA[31:0] = top_0_data_OUT_TDATA;
  assign data_OUT_TVALID = top_0_data_OUT_TVALID;
  assign resetn_0_1 = resetn;
  design_1_dataWrite_0_0 dataWrite_0
       (.clk(clk_0_1),
        .data(top_0_data_OUT_TDATA),
        .tlast(top_0_data_OUT_TVALID),
        .tvalid(top_0_data_OUT_TVALID));
  design_1_datasrc_0_0 datasrc_0
       (.clk(clk_0_1),
        .resetn(resetn_0_1),
        .tdata(datasrc_0_tdata),
        .tready(top_0_data_IN_TREADY),
        .tvalid(datasrc_0_tvalid));
  design_1_top_0_0 top_0
       (.ap_clk(clk_0_1),
        .ap_rst_n(resetn_0_1),
        .ap_start(xlconstant_0_dout),
        .data_IN_TDATA(datasrc_0_tdata),
        .data_IN_TREADY(top_0_data_IN_TREADY),
        .data_IN_TVALID(datasrc_0_tvalid),
        .data_OUT_TDATA(top_0_data_OUT_TDATA),
        .data_OUT_TREADY(xlconstant_0_dout),
        .data_OUT_TVALID(top_0_data_OUT_TVALID));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
