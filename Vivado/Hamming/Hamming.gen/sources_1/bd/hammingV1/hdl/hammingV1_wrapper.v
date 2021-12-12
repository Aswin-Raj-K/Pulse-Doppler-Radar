//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sun Dec 12 14:24:45 2021
//Host        : DESKTOP-GK40GO9 running 64-bit major release  (build 9200)
//Command     : generate_target hammingV1_wrapper.bd
//Design      : hammingV1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module hammingV1_wrapper
   (I,
    R,
    clk);
  output [15:0]I;
  output [15:0]R;
  input clk;

  wire [15:0]I;
  wire [15:0]R;
  wire clk;

  hammingV1 hammingV1_i
       (.I(I),
        .R(R),
        .clk(clk));
endmodule
