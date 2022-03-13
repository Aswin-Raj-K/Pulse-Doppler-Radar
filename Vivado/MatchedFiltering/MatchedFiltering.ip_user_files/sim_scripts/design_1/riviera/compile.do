vlib work
vlib riviera

vlib riviera/xbip_utils_v3_0_10
vlib riviera/axi_utils_v2_0_6
vlib riviera/fir_compiler_v7_2_15
vlib riviera/xil_defaultlib
vlib riviera/xlconstant_v1_1_7
vlib riviera/c_reg_fd_v12_0_6
vlib riviera/xbip_dsp48_wrapper_v3_0_4
vlib riviera/xbip_pipe_v3_0_6
vlib riviera/xbip_dsp48_addsub_v3_0_6
vlib riviera/xbip_addsub_v3_0_6
vlib riviera/c_addsub_v12_0_14

vmap xbip_utils_v3_0_10 riviera/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 riviera/axi_utils_v2_0_6
vmap fir_compiler_v7_2_15 riviera/fir_compiler_v7_2_15
vmap xil_defaultlib riviera/xil_defaultlib
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7
vmap c_reg_fd_v12_0_6 riviera/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 riviera/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 riviera/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 riviera/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 riviera/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_14 riviera/c_addsub_v12_0_14

vcom -work xbip_utils_v3_0_10 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/d117/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work fir_compiler_v7_2_15 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/9825/hdl/fir_compiler_v7_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_fir_compiler_0_0/sim/design_1_fir_compiler_0_0.vhd" \
"../../../bd/design_1/ip/design_1_FIR_IMAG_0/sim/design_1_FIR_IMAG_0.vhd" \
"../../../bd/design_1/ip/design_1_FIR_IMAG1_0/sim/design_1_FIR_IMAG1_0.vhd" \
"../../../bd/design_1/ip/design_1_FIR_REAL1_0/sim/design_1_FIR_REAL1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/ip/design_1_datasrc_0_0/sim/design_1_datasrc_0_0.v" \
"../../../bd/design_1/ip/design_1_splitter_0_0/sim/design_1_splitter_0_0.v" \
"../../../bd/design_1/ip/design_1_AND_0_0/sim/design_1_AND_0_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \

vcom -work c_reg_fd_v12_0_6 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/cfdd/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_14 -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/ebb8/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_c_addsub_0_0/sim/design_1_c_addsub_0_0.vhd" \
"../../../bd/design_1/ip/design_1_c_addsub_0_1/sim/design_1_c_addsub_0_1.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

