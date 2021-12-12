//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sun Dec 12 15:58:31 2021
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (aclk,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tvalid,
    nreset);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, CLK_DOMAIN design_1_clka, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input aclk;
  output [31:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output m_axis_data_tvalid;
  input nreset;

  wire [13:0]Controller_data_addr;
  wire [5:0]Controller_hamming_addr;
  wire [31:0]Controller_s_axis_tdata;
  wire Controller_s_axis_tlast;
  wire Controller_s_axis_tvalid;
  wire [0:0]DIGITAL_HIGH_dout;
  wire [31:0]Data_douta;
  wire [7:0]FFT_CONFIG_dout;
  wire [15:0]Hamming_Coefficients_douta;
  wire clka_0_1;
  wire nreset_0_1;
  wire [31:0]xfft_0_m_axis_data_tdata;
  wire xfft_0_m_axis_data_tlast;
  wire xfft_0_m_axis_data_tvalid;
  wire xfft_0_s_axis_data_tready;
  wire [0:0]xlconstant_0_dout;

  assign clka_0_1 = aclk;
  assign m_axis_data_tdata[31:0] = xfft_0_m_axis_data_tdata;
  assign m_axis_data_tlast = xfft_0_m_axis_data_tlast;
  assign m_axis_data_tvalid = xfft_0_m_axis_data_tvalid;
  assign nreset_0_1 = nreset;
  design_1_Controller_0_0 Controller
       (.aclk(clka_0_1),
        .data(Data_douta),
        .data_addr(Controller_data_addr),
        .hamming_addr(Controller_hamming_addr),
        .hamming_data(Hamming_Coefficients_douta),
        .nreset(nreset_0_1),
        .s_axis_tdata(Controller_s_axis_tdata),
        .s_axis_tlast(Controller_s_axis_tlast),
        .s_axis_tready(xfft_0_s_axis_data_tready),
        .s_axis_tvalid(Controller_s_axis_tvalid));
  design_1_DIGITAL_LOW_0 DIGITAL_HIGH
       (.dout(DIGITAL_HIGH_dout));
  design_1_xlconstant_0_0 DIGITAL_LOW
       (.dout(xlconstant_0_dout));
  design_1_blk_mem_gen_0_1 Data
       (.addra(Controller_data_addr),
        .clka(clka_0_1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(Data_douta),
        .ena(DIGITAL_HIGH_dout),
        .wea(xlconstant_0_dout));
  design_1_xfft_0_0 FFT
       (.aclk(clka_0_1),
        .m_axis_data_tdata(xfft_0_m_axis_data_tdata),
        .m_axis_data_tlast(xfft_0_m_axis_data_tlast),
        .m_axis_data_tready(DIGITAL_HIGH_dout),
        .m_axis_data_tvalid(xfft_0_m_axis_data_tvalid),
        .s_axis_config_tdata(FFT_CONFIG_dout),
        .s_axis_config_tvalid(DIGITAL_HIGH_dout),
        .s_axis_data_tdata(Controller_s_axis_tdata),
        .s_axis_data_tlast(Controller_s_axis_tlast),
        .s_axis_data_tready(xfft_0_s_axis_data_tready),
        .s_axis_data_tvalid(Controller_s_axis_tvalid));
  design_1_DIGITAL_LOW_1 FFT_CONFIG
       (.dout(FFT_CONFIG_dout));
  design_1_blk_mem_gen_0_2 Hamming_Coefficients
       (.addra(Controller_hamming_addr),
        .clka(clka_0_1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(Hamming_Coefficients_douta),
        .ena(DIGITAL_HIGH_dout),
        .wea(xlconstant_0_dout));
endmodule
