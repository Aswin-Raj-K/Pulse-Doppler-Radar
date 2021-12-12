vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/blk_mem_gen_v8_4_4
vlib activehdl/xil_defaultlib
vlib activehdl/xlconstant_v1_1_7

vmap xpm activehdl/xpm
vmap blk_mem_gen_v8_4_4 activehdl/blk_mem_gen_v8_4_4
vmap xil_defaultlib activehdl/xil_defaultlib
vmap xlconstant_v1_1_7 activehdl/xlconstant_v1_1_7

vlog -work xpm  -sv2k12 \
"D:/Vivado2020/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/Vivado2020/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 \
"../../../../Hamming.gen/sources_1/bd/hammingV1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/hammingV1/ip/hammingV1_blk_mem_gen_0_0/sim/hammingV1_blk_mem_gen_0_0.v" \

vlog -work xlconstant_v1_1_7  -v2k5 \
"../../../../Hamming.gen/sources_1/bd/hammingV1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/hammingV1/ip/hammingV1_xlconstant_0_0/sim/hammingV1_xlconstant_0_0.v" \
"../../../bd/hammingV1/ip/hammingV1_BlockMemoryGenerator_0/sim/hammingV1_BlockMemoryGenerator_0.v" \
"../../../bd/hammingV1/ip/hammingV1_addressGenerator_0_0/sim/hammingV1_addressGenerator_0_0.v" \
"../../../bd/hammingV1/ip/hammingV1_fixedPointMultiplier_0_0/sim/hammingV1_fixedPointMultiplier_0_0.v" \
"../../../bd/hammingV1/ip/hammingV1_fixedPointMultiplier_0_1/sim/hammingV1_fixedPointMultiplier_0_1.v" \
"../../../bd/hammingV1/ip/hammingV1_splitter_0_0/sim/hammingV1_splitter_0_0.v" \
"../../../bd/hammingV1/sim/hammingV1.v" \

vlog -work xil_defaultlib \
"glbl.v"

