# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: E:\Academics\BTP\VitisSDK\GPIO_Controller\GPIOController_system\_ide\scripts\debugger_gpiocontroller-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source E:\Academics\BTP\VitisSDK\GPIO_Controller\GPIOController_system\_ide\scripts\debugger_gpiocontroller-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent JTAG-SMT1 210203AB90FBA" && level==0 && jtag_device_ctx=="jsn-JTAG-SMT1-210203AB90FBA-23727093-0"}
fpga -file E:/Academics/BTP/VitisSDK/GPIO_Controller/GPIOController/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw E:/Academics/BTP/VitisSDK/GPIO_Controller/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source E:/Academics/BTP/VitisSDK/GPIO_Controller/GPIOController/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow E:/Academics/BTP/VitisSDK/GPIO_Controller/GPIOController/Debug/GPIOController.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
