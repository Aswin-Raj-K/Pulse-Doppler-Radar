vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_10
vlib modelsim_lib/msim/axi_utils_v2_0_6
vlib modelsim_lib/msim/fir_compiler_v7_2_15
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlconstant_v1_1_7
vlib modelsim_lib/msim/c_reg_fd_v12_0_6
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_4
vlib modelsim_lib/msim/xbip_pipe_v3_0_6
vlib modelsim_lib/msim/xbip_dsp48_addsub_v3_0_6
vlib modelsim_lib/msim/xbip_addsub_v3_0_6
vlib modelsim_lib/msim/c_addsub_v12_0_14

vmap xbip_utils_v3_0_10 modelsim_lib/msim/xbip_utils_v3_0_10
vmap axi_utils_v2_0_6 modelsim_lib/msim/axi_utils_v2_0_6
vmap fir_compiler_v7_2_15 modelsim_lib/msim/fir_compiler_v7_2_15
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_7 modelsim_lib/msim/xlconstant_v1_1_7
vmap c_reg_fd_v12_0_6 modelsim_lib/msim/c_reg_fd_v12_0_6
vmap xbip_dsp48_wrapper_v3_0_4 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_4
vmap xbip_pipe_v3_0_6 modelsim_lib/msim/xbip_pipe_v3_0_6
vmap xbip_dsp48_addsub_v3_0_6 modelsim_lib/msim/xbip_dsp48_addsub_v3_0_6
vmap xbip_addsub_v3_0_6 modelsim_lib/msim/xbip_addsub_v3_0_6
vmap c_addsub_v12_0_14 modelsim_lib/msim/c_addsub_v12_0_14

vcom -work xbip_utils_v3_0_10  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/d117/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_6  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/1971/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work fir_compiler_v7_2_15  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/9825/hdl/fir_compiler_v7_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design_1/ip/design_1_fir_compiler_0_0/sim/design_1_fir_compiler_0_0.vhd" \
"../../../bd/design_1/ip/design_1_FIR_IMAG_0/sim/design_1_FIR_IMAG_0.vhd" \
"../../../bd/design_1/ip/design_1_FIR_IMAG1_0/sim/design_1_FIR_IMAG1_0.vhd" \
"../../../bd/design_1/ip/design_1_FIR_REAL1_0/sim/design_1_FIR_REAL1_0.vhd" \

vlog -work xil_defaultlib  -incr \
"../../../bd/design_1/ip/design_1_datasrc_0_0/sim/design_1_datasrc_0_0.v" \
"../../../bd/design_1/ip/design_1_splitter_0_0/sim/design_1_splitter_0_0.v" \
"../../../bd/design_1/ip/design_1_AND_0_0/sim/design_1_AND_0_0.v" \

vlog -work xlconstant_v1_1_7  -incr \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \

vcom -work c_reg_fd_v12_0_6  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/edec/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_4  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/cdbf/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_6  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/7468/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_6  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/910d/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_6  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/cfdd/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_14  -93 \
"../../../../MatchedFiltering.gen/sources_1/bd/design_1/ipshared/ebb8/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/design_1/ip/design_1_c_addsub_0_0/sim/design_1_c_addsub_0_0.vhd" \
"../../../bd/design_1/ip/design_1_c_addsub_0_1/sim/design_1_c_addsub_0_1.vhd" \

vlog -work xil_defaultlib  -incr \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

