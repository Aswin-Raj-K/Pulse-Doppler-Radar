onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+hammingV1 -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L xlconstant_v1_1_7 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.hammingV1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {hammingV1.udo}

run -all

endsim

quit -force
