
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# Controller

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg484-1
   set_property BOARD_PART xilinx.com:zc702:part0:1.4 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set aclk [ create_bd_port -dir I -type clk aclk ]
  set m_axis_data_tdata [ create_bd_port -dir O -from 31 -to 0 m_axis_data_tdata ]
  set m_axis_data_tlast [ create_bd_port -dir O m_axis_data_tlast ]
  set m_axis_data_tvalid [ create_bd_port -dir O m_axis_data_tvalid ]
  set nreset [ create_bd_port -dir I nreset ]

  # Create instance: Controller, and set properties
  set block_name Controller
  set block_cell_name Controller
  if { [catch {set Controller [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Controller eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: DIGITAL_HIGH, and set properties
  set DIGITAL_HIGH [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 DIGITAL_HIGH ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {1} \
 ] $DIGITAL_HIGH

  # Create instance: DIGITAL_LOW, and set properties
  set DIGITAL_LOW [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 DIGITAL_LOW ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $DIGITAL_LOW

  # Create instance: Data, and set properties
  set Data [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 Data ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.Coe_File {../../../../../../ExternalFiles/data.coe} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {12520} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $Data

  # Create instance: FFT, and set properties
  set FFT [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 FFT ]
  set_property -dict [ list \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {0} \
   CONFIG.output_ordering {natural_order} \
   CONFIG.transform_length {32} \
 ] $FFT

  # Create instance: FFT_CONFIG, and set properties
  set FFT_CONFIG [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 FFT_CONFIG ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {b00000001} \
   CONFIG.CONST_WIDTH {8} \
 ] $FFT_CONFIG

  # Create instance: Hamming_Coefficients, and set properties
  set Hamming_Coefficients [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 Hamming_Coefficients ]
  set_property -dict [ list \
   CONFIG.Byte_Size {9} \
   CONFIG.Coe_File {../../../../../../ExternalFiles/hamming.coe} \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_32bit_Address {false} \
   CONFIG.Load_Init_File {true} \
   CONFIG.Operating_Mode_A {READ_FIRST} \
   CONFIG.Read_Width_A {16} \
   CONFIG.Read_Width_B {16} \
   CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
   CONFIG.Use_Byte_Write_Enable {false} \
   CONFIG.Use_RSTA_Pin {false} \
   CONFIG.Write_Depth_A {40} \
   CONFIG.Write_Width_A {16} \
   CONFIG.Write_Width_B {16} \
   CONFIG.use_bram_block {Stand_Alone} \
 ] $Hamming_Coefficients

  # Create port connections
  connect_bd_net -net Controller_data_addr [get_bd_pins Controller/data_addr] [get_bd_pins Data/addra]
  connect_bd_net -net Controller_hamming_addr [get_bd_pins Controller/hamming_addr] [get_bd_pins Hamming_Coefficients/addra]
  connect_bd_net -net Controller_s_axis_tdata [get_bd_pins Controller/s_axis_tdata] [get_bd_pins FFT/s_axis_data_tdata]
  connect_bd_net -net Controller_s_axis_tlast [get_bd_pins Controller/s_axis_tlast] [get_bd_pins FFT/s_axis_data_tlast]
  connect_bd_net -net Controller_s_axis_tvalid [get_bd_pins Controller/s_axis_tvalid] [get_bd_pins FFT/s_axis_data_tvalid]
  connect_bd_net -net DIGITAL_HIGH_dout [get_bd_pins DIGITAL_HIGH/dout] [get_bd_pins Data/ena] [get_bd_pins FFT/m_axis_data_tready] [get_bd_pins FFT/s_axis_config_tvalid] [get_bd_pins Hamming_Coefficients/ena]
  connect_bd_net -net Data_douta [get_bd_pins Controller/data] [get_bd_pins Data/douta]
  connect_bd_net -net FFT_CONFIG_dout [get_bd_pins FFT/s_axis_config_tdata] [get_bd_pins FFT_CONFIG/dout]
  connect_bd_net -net Hamming_Coefficients_douta [get_bd_pins Controller/hamming_data] [get_bd_pins Hamming_Coefficients/douta]
  connect_bd_net -net clka_0_1 [get_bd_ports aclk] [get_bd_pins Controller/aclk] [get_bd_pins Data/clka] [get_bd_pins FFT/aclk] [get_bd_pins Hamming_Coefficients/clka]
  connect_bd_net -net nreset_0_1 [get_bd_ports nreset] [get_bd_pins Controller/nreset]
  connect_bd_net -net xfft_0_m_axis_data_tdata [get_bd_ports m_axis_data_tdata] [get_bd_pins FFT/m_axis_data_tdata]
  connect_bd_net -net xfft_0_m_axis_data_tlast [get_bd_ports m_axis_data_tlast] [get_bd_pins FFT/m_axis_data_tlast]
  connect_bd_net -net xfft_0_m_axis_data_tvalid [get_bd_ports m_axis_data_tvalid] [get_bd_pins FFT/m_axis_data_tvalid]
  connect_bd_net -net xfft_0_s_axis_data_tready [get_bd_pins Controller/s_axis_tready] [get_bd_pins FFT/s_axis_data_tready]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins DIGITAL_LOW/dout] [get_bd_pins Data/wea] [get_bd_pins Hamming_Coefficients/wea]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


