# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: E:\Academics\BTP\VitisSDK\DMA_Demo\DMATest_system\_ide\scripts\debugger_dmatest-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source E:\Academics\BTP\VitisSDK\DMA_Demo\DMATest_system\_ide\scripts\debugger_dmatest-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw E:/Academics/BTP/VitisSDK/DMA_Demo/design_1_wrapper/export/design_1_wrapper/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
stop
source E:/Academics/BTP/VitisSDK/DMA_Demo/DMATest/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
rst -processor
targets -set -nocase -filter {name =~ "*A9*#0"}
dow E:/Academics/BTP/VitisSDK/DMA_Demo/DMATest/Debug/DMATest.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
