vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xlconstant_v1_1_7

vmap xil_defaultlib riviera/xil_defaultlib
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7

vlog -work xil_defaultlib  -v2k5 \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top_mac_muladd_6ns_7ns_6ns_11_4_1.v" \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top_mac_muladd_9ns_7ns_6ns_14_4_1.v" \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top_mat_A_M_real_V.v" \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top_mat_C_0.v" \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top_matmul.v" \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top_matmul_coeff_M_real_V.v" \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top_mul_mul_10s_16s_24_4_1.v" \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top_regslice_both.v" \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/1e40/hdl/verilog/top.v" \
"../../../bd/design_1/ip/design_1_top_0_0/sim/design_1_top_0_0.v" \
"../../../bd/design_1/ip/design_1_datasrc_0_0/sim/design_1_datasrc_0_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 \
"../../../../3PulseCanceler.gen/sources_1/bd/design_1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/sim/design_1.v" \
"../../../bd/design_1/ip/design_1_dataWrite_0_0/sim/design_1_dataWrite_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

