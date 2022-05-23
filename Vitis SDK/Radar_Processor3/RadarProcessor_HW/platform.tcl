# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct E:\Academics\BTP\VitisSDK\Radar_Processor3\RadarProcessor_HW\platform.tcl
# 
# OR launch xsct and run below command.
# source E:\Academics\BTP\VitisSDK\Radar_Processor3\RadarProcessor_HW\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {RadarProcessor_HW}\
-hw {E:\Academics\BTP\Vivado\RadarProcessor3\RadarProcessor_HW.xsa}\
-fsbl-target {psu_cortexa53_0} -out {E:/Academics/BTP/VitisSDK/Radar_Processor3}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {RadarProcessor_HW}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
bsp reload
bsp setlib -name xilffs -ver 4.4
bsp write
bsp reload
catch {bsp regenerate}
platform generate
bsp reload
