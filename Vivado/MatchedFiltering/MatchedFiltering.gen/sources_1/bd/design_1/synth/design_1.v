//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sat Feb 26 16:04:26 2022
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (OUT_IMAG,
    OUT_REAL,
    clk,
    m_axis_data_tvalid_1,
    m_axis_data_tvalid_2,
    m_axis_data_tvalid_3,
    m_axis_data_tvalid_4,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_IMAG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_IMAG, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 16}" *) output [15:0]OUT_IMAG;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.OUT_REAL DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.OUT_REAL, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 16} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 16}" *) output [15:0]OUT_REAL;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET resetn, CLK_DOMAIN design_1_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;
  output m_axis_data_tvalid_1;
  output m_axis_data_tvalid_2;
  output m_axis_data_tvalid_3;
  output m_axis_data_tvalid_4;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input resetn;

  wire AND_0_tready;
  wire [15:0]FIR_IMAG1_m_axis_data_tdata;
  wire FIR_IMAG1_m_axis_data_tvalid;
  wire FIR_IMAG1_s_axis_data_tready;
  wire [15:0]FIR_IMAG2_m_axis_data_tdata;
  wire FIR_IMAG2_m_axis_data_tvalid;
  wire FIR_IMAG2_s_axis_data_tready;
  wire [15:0]FIR_REAL1_m_axis_data_tdata;
  wire FIR_REAL1_m_axis_data_tvalid;
  wire FIR_REAL1_s_axis_data_tready;
  wire [15:0]FIR_REAL2_m_axis_data_tdata;
  wire FIR_REAL2_m_axis_data_tvalid;
  wire FIR_REAL2_s_axis_data_tready;
  wire [15:0]c_addsub_0_S;
  wire [15:0]c_addsub_1_S;
  wire clk_0_1;
  wire [31:0]datasrc_tdata;
  wire datasrc_tvalid;
  wire resetn_0_1;
  wire [15:0]splitter_0_dataImag;
  wire [15:0]splitter_0_dataReal;
  wire [0:0]xlconstant_0_dout;

  assign OUT_IMAG[15:0] = c_addsub_1_S;
  assign OUT_REAL[15:0] = c_addsub_0_S;
  assign clk_0_1 = clk;
  assign m_axis_data_tvalid_1 = FIR_IMAG1_m_axis_data_tvalid;
  assign m_axis_data_tvalid_2 = FIR_REAL2_m_axis_data_tvalid;
  assign m_axis_data_tvalid_3 = FIR_IMAG2_m_axis_data_tvalid;
  assign m_axis_data_tvalid_4 = FIR_REAL1_m_axis_data_tvalid;
  assign resetn_0_1 = resetn;
  design_1_AND_0_0 AND_GATE
       (.tready(AND_0_tready),
        .tready1(FIR_IMAG1_s_axis_data_tready),
        .tready2(FIR_IMAG2_s_axis_data_tready),
        .tready3(FIR_REAL2_s_axis_data_tready),
        .tready4(FIR_REAL1_s_axis_data_tready));
  design_1_c_addsub_0_1 Adder
       (.A(FIR_IMAG2_m_axis_data_tdata),
        .B(FIR_REAL1_m_axis_data_tdata),
        .S(c_addsub_1_S));
  design_1_fir_compiler_0_0 FIR_IMAG1
       (.aclk(clk_0_1),
        .m_axis_data_tdata(FIR_IMAG1_m_axis_data_tdata),
        .m_axis_data_tready(xlconstant_0_dout),
        .m_axis_data_tvalid(FIR_IMAG1_m_axis_data_tvalid),
        .s_axis_data_tdata(splitter_0_dataImag),
        .s_axis_data_tready(FIR_IMAG1_s_axis_data_tready),
        .s_axis_data_tvalid(datasrc_tvalid));
  design_1_FIR_IMAG1_0 FIR_IMAG2
       (.aclk(clk_0_1),
        .m_axis_data_tdata(FIR_IMAG2_m_axis_data_tdata),
        .m_axis_data_tready(xlconstant_0_dout),
        .m_axis_data_tvalid(FIR_IMAG2_m_axis_data_tvalid),
        .s_axis_data_tdata(splitter_0_dataReal),
        .s_axis_data_tready(FIR_IMAG2_s_axis_data_tready),
        .s_axis_data_tvalid(datasrc_tvalid));
  design_1_FIR_IMAG_0 FIR_REAL1
       (.aclk(clk_0_1),
        .m_axis_data_tdata(FIR_REAL1_m_axis_data_tdata),
        .m_axis_data_tready(xlconstant_0_dout),
        .m_axis_data_tvalid(FIR_REAL1_m_axis_data_tvalid),
        .s_axis_data_tdata(splitter_0_dataReal),
        .s_axis_data_tready(FIR_REAL1_s_axis_data_tready),
        .s_axis_data_tvalid(datasrc_tvalid));
  design_1_FIR_REAL1_0 FIR_REAL2
       (.aclk(clk_0_1),
        .m_axis_data_tdata(FIR_REAL2_m_axis_data_tdata),
        .m_axis_data_tready(xlconstant_0_dout),
        .m_axis_data_tvalid(FIR_REAL2_m_axis_data_tvalid),
        .s_axis_data_tdata(splitter_0_dataImag),
        .s_axis_data_tready(FIR_REAL2_s_axis_data_tready),
        .s_axis_data_tvalid(datasrc_tvalid));
  design_1_xlconstant_0_0 HIGH
       (.dout(xlconstant_0_dout));
  design_1_c_addsub_0_0 Substractor
       (.A(FIR_IMAG1_m_axis_data_tdata),
        .B(FIR_REAL2_m_axis_data_tdata),
        .S(c_addsub_0_S));
  design_1_datasrc_0_0 datasrc
       (.clk(clk_0_1),
        .resetn(resetn_0_1),
        .tdata(datasrc_tdata),
        .tready(AND_0_tready),
        .tvalid(datasrc_tvalid));
  design_1_splitter_0_0 splitter_0
       (.dataImag(splitter_0_dataImag),
        .dataReal(splitter_0_dataReal),
        .tdata(datasrc_tdata));
endmodule
