onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L xlconstant_v1_1_7 -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L c_mux_bit_v12_0_6 -L c_shift_ram_v12_0_14 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_16 -L cmpy_v6_0_19 -L floating_point_v7_0_18 -L xfft_v9_1_5 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.design_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {design_1.udo}

run -all

quit -force
