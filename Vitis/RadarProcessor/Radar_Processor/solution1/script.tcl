############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Radar_Processor
set_top top
add_files ../SourceCodes/radarProcessor.hpp
add_files ../SourceCodes/radarProcessor.cpp
add_files -tb ../SourceCodes/radar_inp_cpp_real.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../SourceCodes/radar_inp_cpp_imag.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../SourceCodes/radar_inp_cpp.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../SourceCodes/radarProcessor_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
add_files -tb ../OuputFiles/out_cpp.txt -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -description {Radar Processor with fixed point 32,24} -display_name RadarProcessor -format ip_catalog -output E:/Academics/BTP/Vitis/IPs/RadarProcessor/top.zip -rtl verilog -vendor ARK -version 1.0
source "./Radar_Processor/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -description "Radar Processor with fixed point 32,24" -vendor "ARK" -display_name "RadarProcessor" -output E:/Academics/BTP/Vitis/IPs/RadarProcessor/top.zip
