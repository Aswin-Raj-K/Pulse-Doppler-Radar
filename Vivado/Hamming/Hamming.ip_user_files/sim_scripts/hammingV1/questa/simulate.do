onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib hammingV1_opt

do {wave.do}

view wave
view structure
view signals

do {hammingV1.udo}

run -all

quit -force
