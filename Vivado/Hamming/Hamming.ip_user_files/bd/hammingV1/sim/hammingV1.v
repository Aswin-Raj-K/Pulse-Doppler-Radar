//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sun Dec 12 14:24:30 2021
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target hammingV1.bd
//Design      : hammingV1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "hammingV1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=hammingV1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=4,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "hammingV1.hwdef" *) 
module hammingV1
   (I,
    R,
    clk);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.I DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.I, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) output [15:0]I;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.R DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.R, LAYERED_METADATA xilinx.com:interface:datatypes:1.0 {DATA {datatype {name {attribs {resolve_type immediate dependency {} format string minimum {} maximum {}} value data} bitwidth {attribs {resolve_type generated dependency bitwidth format long minimum {} maximum {}} value 32} bitoffset {attribs {resolve_type immediate dependency {} format long minimum {} maximum {}} value 0} integer {signed {attribs {resolve_type generated dependency signed format bool minimum {} maximum {}} value TRUE}}}} DATA_WIDTH 32}" *) output [15:0]R;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, CLK_DOMAIN hammingV1_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input clk;

  wire [5:0]AddressGenerator_addHamming;
  wire [31:0]Data_douta;
  wire [0:0]HIGH_dout;
  wire [15:0]HammingWindowCoefficients_douta;
  wire [15:0]Splitter_imgData;
  wire [15:0]Splitter_realData;
  wire [13:0]addressGenerator_0_address;
  wire clk_0_1;
  wire [15:0]fixedPointMultiplier_0_dataOut;
  wire [15:0]fixedPointMultiplier_1_dataOut;

  assign I[15:0] = fixedPointMultiplier_0_dataOut;
  assign R[15:0] = fixedPointMultiplier_1_dataOut;
  assign clk_0_1 = clk;
  hammingV1_addressGenerator_0_0 AddressGenerator
       (.addData(addressGenerator_0_address),
        .addHamming(AddressGenerator_addHamming),
        .clk(clk_0_1));
  hammingV1_blk_mem_gen_0_0 Data
       (.addra(addressGenerator_0_address),
        .clka(clk_0_1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(Data_douta),
        .ena(HIGH_dout),
        .wea(1'b0));
  hammingV1_xlconstant_0_0 HIGH
       (.dout(HIGH_dout));
  hammingV1_BlockMemoryGenerator_0 HammingWindowCoefficients
       (.addra(AddressGenerator_addHamming),
        .clka(clk_0_1),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b0,1'b0}),
        .douta(HammingWindowCoefficients_douta),
        .ena(HIGH_dout),
        .wea(1'b0));
  hammingV1_splitter_0_0 Splitter
       (.clk(clk_0_1),
        .dataIn(Data_douta),
        .imgData(Splitter_imgData),
        .realData(Splitter_realData));
  hammingV1_fixedPointMultiplier_0_0 fixedPointMultiplier_0
       (.clk(clk_0_1),
        .data1(Splitter_imgData),
        .data2(HammingWindowCoefficients_douta),
        .dataOut(fixedPointMultiplier_0_dataOut));
  hammingV1_fixedPointMultiplier_0_1 fixedPointMultiplier_1
       (.clk(clk_0_1),
        .data1(Splitter_realData),
        .data2(HammingWindowCoefficients_douta),
        .dataOut(fixedPointMultiplier_1_dataOut));
endmodule
