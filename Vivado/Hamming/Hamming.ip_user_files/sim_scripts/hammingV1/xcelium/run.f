-makelib xcelium_lib/xpm -sv \
  "D:/Vivado2020/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "D:/Vivado2020/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../Hamming.gen/sources_1/bd/hammingV1/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/hammingV1/ip/hammingV1_blk_mem_gen_0_0/sim/hammingV1_blk_mem_gen_0_0.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_7 \
  "../../../../Hamming.gen/sources_1/bd/hammingV1/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/hammingV1/ip/hammingV1_xlconstant_0_0/sim/hammingV1_xlconstant_0_0.v" \
  "../../../bd/hammingV1/ip/hammingV1_BlockMemoryGenerator_0/sim/hammingV1_BlockMemoryGenerator_0.v" \
  "../../../bd/hammingV1/ip/hammingV1_addressGenerator_0_0/sim/hammingV1_addressGenerator_0_0.v" \
  "../../../bd/hammingV1/ip/hammingV1_fixedPointMultiplier_0_0/sim/hammingV1_fixedPointMultiplier_0_0.v" \
  "../../../bd/hammingV1/ip/hammingV1_fixedPointMultiplier_0_1/sim/hammingV1_fixedPointMultiplier_0_1.v" \
  "../../../bd/hammingV1/ip/hammingV1_splitter_0_0/sim/hammingV1_splitter_0_0.v" \
  "../../../bd/hammingV1/sim/hammingV1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

