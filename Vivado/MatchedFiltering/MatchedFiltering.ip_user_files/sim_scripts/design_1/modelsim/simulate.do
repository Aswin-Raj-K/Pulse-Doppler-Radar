onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xbip_utils_v3_0_10 -L axi_utils_v2_0_6 -L fir_compiler_v7_2_15 -L xil_defaultlib -L xlconstant_v1_1_7 -L c_reg_fd_v12_0_6 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_6 -L xbip_dsp48_addsub_v3_0_6 -L xbip_addsub_v3_0_6 -L c_addsub_v12_0_14 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.design_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {design_1.udo}

run -all

quit -force
