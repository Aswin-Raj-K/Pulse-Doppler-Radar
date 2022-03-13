
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
# AND, datasrc, splitter

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
  set OUT_IMAG [ create_bd_port -dir O -from 15 -to 0 -type data OUT_IMAG ]
  set OUT_REAL [ create_bd_port -dir O -from 15 -to 0 -type data OUT_REAL ]
  set clk [ create_bd_port -dir I -type clk clk ]
  set m_axis_data_tvalid_1 [ create_bd_port -dir O m_axis_data_tvalid_1 ]
  set m_axis_data_tvalid_2 [ create_bd_port -dir O m_axis_data_tvalid_2 ]
  set m_axis_data_tvalid_3 [ create_bd_port -dir O m_axis_data_tvalid_3 ]
  set m_axis_data_tvalid_4 [ create_bd_port -dir O m_axis_data_tvalid_4 ]
  set resetn [ create_bd_port -dir I -type rst resetn ]

  # Create instance: AND_GATE, and set properties
  set block_name AND
  set block_cell_name AND_GATE
  if { [catch {set AND_GATE [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AND_GATE eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Adder, and set properties
  set Adder [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 Adder ]
  set_property -dict [ list \
   CONFIG.A_Width {16} \
   CONFIG.B_Value {0000000000000000} \
   CONFIG.B_Width {16} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {16} \
 ] $Adder

  # Create instance: FIR_IMAG1, and set properties
  set FIR_IMAG1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 FIR_IMAG1 ]
  set_property -dict [ list \
   CONFIG.Clock_Frequency {300.0} \
   CONFIG.CoefficientSource {COE_File} \
   CONFIG.Coefficient_File {../../../../../../ExternalFiles/matchedFiltering_imag.coe} \
   CONFIG.Coefficient_Fractional_Bits {0} \
   CONFIG.Coefficient_Sets {1} \
   CONFIG.Coefficient_Sign {Signed} \
   CONFIG.Coefficient_Structure {Inferred} \
   CONFIG.Coefficient_Width {16} \
   CONFIG.Data_Fractional_Bits {8} \
   CONFIG.Data_Width {16} \
   CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
   CONFIG.Filter_Selection {1} \
   CONFIG.M_DATA_Has_TREADY {true} \
   CONFIG.Number_Paths {1} \
   CONFIG.Output_Rounding_Mode {Truncate_LSBs} \
   CONFIG.Output_Width {16} \
   CONFIG.Quantization {Integer_Coefficients} \
   CONFIG.Sample_Frequency {0.001} \
 ] $FIR_IMAG1

  # Create instance: FIR_IMAG2, and set properties
  set FIR_IMAG2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 FIR_IMAG2 ]
  set_property -dict [ list \
   CONFIG.Clock_Frequency {300.0} \
   CONFIG.CoefficientSource {COE_File} \
   CONFIG.Coefficient_File {../../../../../../ExternalFiles/matchedFiltering_imag.coe} \
   CONFIG.Coefficient_Fractional_Bits {0} \
   CONFIG.Coefficient_Sets {1} \
   CONFIG.Coefficient_Sign {Signed} \
   CONFIG.Coefficient_Structure {Inferred} \
   CONFIG.Coefficient_Width {16} \
   CONFIG.Data_Fractional_Bits {8} \
   CONFIG.Data_Width {16} \
   CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
   CONFIG.Filter_Selection {1} \
   CONFIG.M_DATA_Has_TREADY {true} \
   CONFIG.Number_Paths {1} \
   CONFIG.Output_Rounding_Mode {Truncate_LSBs} \
   CONFIG.Output_Width {16} \
   CONFIG.Quantization {Integer_Coefficients} \
   CONFIG.Sample_Frequency {0.001} \
 ] $FIR_IMAG2

  # Create instance: FIR_REAL1, and set properties
  set FIR_REAL1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 FIR_REAL1 ]
  set_property -dict [ list \
   CONFIG.Clock_Frequency {300.0} \
   CONFIG.CoefficientSource {COE_File} \
   CONFIG.Coefficient_File {../../../../../../ExternalFiles/matchedFiltering_real.coe} \
   CONFIG.Coefficient_Fractional_Bits {0} \
   CONFIG.Coefficient_Sets {1} \
   CONFIG.Coefficient_Sign {Signed} \
   CONFIG.Coefficient_Structure {Inferred} \
   CONFIG.Coefficient_Width {16} \
   CONFIG.Data_Fractional_Bits {8} \
   CONFIG.Data_Width {16} \
   CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
   CONFIG.Filter_Selection {1} \
   CONFIG.M_DATA_Has_TREADY {true} \
   CONFIG.Number_Paths {1} \
   CONFIG.Output_Rounding_Mode {Truncate_LSBs} \
   CONFIG.Output_Width {16} \
   CONFIG.Quantization {Integer_Coefficients} \
   CONFIG.Sample_Frequency {0.001} \
 ] $FIR_REAL1

  # Create instance: FIR_REAL2, and set properties
  set FIR_REAL2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fir_compiler:7.2 FIR_REAL2 ]
  set_property -dict [ list \
   CONFIG.Clock_Frequency {300.0} \
   CONFIG.CoefficientSource {COE_File} \
   CONFIG.Coefficient_File {../../../../../../ExternalFiles/matchedFiltering_real.coe} \
   CONFIG.Coefficient_Fractional_Bits {0} \
   CONFIG.Coefficient_Sets {1} \
   CONFIG.Coefficient_Sign {Signed} \
   CONFIG.Coefficient_Structure {Inferred} \
   CONFIG.Coefficient_Width {16} \
   CONFIG.Data_Fractional_Bits {8} \
   CONFIG.Data_Width {16} \
   CONFIG.Filter_Architecture {Systolic_Multiply_Accumulate} \
   CONFIG.Filter_Selection {1} \
   CONFIG.M_DATA_Has_TREADY {true} \
   CONFIG.Number_Paths {1} \
   CONFIG.Output_Rounding_Mode {Truncate_LSBs} \
   CONFIG.Output_Width {16} \
   CONFIG.Quantization {Integer_Coefficients} \
   CONFIG.Sample_Frequency {0.001} \
 ] $FIR_REAL2

  # Create instance: HIGH, and set properties
  set HIGH [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 HIGH ]

  # Create instance: Substractor, and set properties
  set Substractor [ create_bd_cell -type ip -vlnv xilinx.com:ip:c_addsub:12.0 Substractor ]
  set_property -dict [ list \
   CONFIG.A_Width {16} \
   CONFIG.Add_Mode {Subtract} \
   CONFIG.B_Value {0000000000000000} \
   CONFIG.B_Width {16} \
   CONFIG.CE {false} \
   CONFIG.Latency {0} \
   CONFIG.Out_Width {16} \
 ] $Substractor

  # Create instance: datasrc, and set properties
  set block_name datasrc
  set block_cell_name datasrc
  if { [catch {set datasrc [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $datasrc eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: splitter_0, and set properties
  set block_name splitter
  set block_cell_name splitter_0
  if { [catch {set splitter_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $splitter_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net AND_0_tready [get_bd_pins AND_GATE/tready] [get_bd_pins datasrc/tready]
  connect_bd_net -net FIR_IMAG1_m_axis_data_tdata [get_bd_pins FIR_IMAG1/m_axis_data_tdata] [get_bd_pins Substractor/A]
  connect_bd_net -net FIR_IMAG1_m_axis_data_tvalid [get_bd_ports m_axis_data_tvalid_1] [get_bd_pins FIR_IMAG1/m_axis_data_tvalid]
  connect_bd_net -net FIR_IMAG1_s_axis_data_tready [get_bd_pins AND_GATE/tready1] [get_bd_pins FIR_IMAG1/s_axis_data_tready]
  connect_bd_net -net FIR_IMAG2_m_axis_data_tdata [get_bd_pins Adder/A] [get_bd_pins FIR_IMAG2/m_axis_data_tdata]
  connect_bd_net -net FIR_IMAG2_m_axis_data_tvalid [get_bd_ports m_axis_data_tvalid_3] [get_bd_pins FIR_IMAG2/m_axis_data_tvalid]
  connect_bd_net -net FIR_IMAG2_s_axis_data_tready [get_bd_pins AND_GATE/tready2] [get_bd_pins FIR_IMAG2/s_axis_data_tready]
  connect_bd_net -net FIR_REAL1_m_axis_data_tdata [get_bd_pins Adder/B] [get_bd_pins FIR_REAL1/m_axis_data_tdata]
  connect_bd_net -net FIR_REAL1_m_axis_data_tvalid [get_bd_ports m_axis_data_tvalid_4] [get_bd_pins FIR_REAL1/m_axis_data_tvalid]
  connect_bd_net -net FIR_REAL1_s_axis_data_tready [get_bd_pins AND_GATE/tready4] [get_bd_pins FIR_REAL1/s_axis_data_tready]
  connect_bd_net -net FIR_REAL2_m_axis_data_tdata [get_bd_pins FIR_REAL2/m_axis_data_tdata] [get_bd_pins Substractor/B]
  connect_bd_net -net FIR_REAL2_m_axis_data_tvalid [get_bd_ports m_axis_data_tvalid_2] [get_bd_pins FIR_REAL2/m_axis_data_tvalid]
  connect_bd_net -net FIR_REAL2_s_axis_data_tready [get_bd_pins AND_GATE/tready3] [get_bd_pins FIR_REAL2/s_axis_data_tready]
  connect_bd_net -net c_addsub_0_S [get_bd_ports OUT_REAL] [get_bd_pins Substractor/S]
  connect_bd_net -net c_addsub_1_S [get_bd_ports OUT_IMAG] [get_bd_pins Adder/S]
  connect_bd_net -net clk_0_1 [get_bd_ports clk] [get_bd_pins FIR_IMAG1/aclk] [get_bd_pins FIR_IMAG2/aclk] [get_bd_pins FIR_REAL1/aclk] [get_bd_pins FIR_REAL2/aclk] [get_bd_pins datasrc/clk]
  connect_bd_net -net datasrc_tdata [get_bd_pins datasrc/tdata] [get_bd_pins splitter_0/tdata]
  connect_bd_net -net datasrc_tvalid [get_bd_pins FIR_IMAG1/s_axis_data_tvalid] [get_bd_pins FIR_IMAG2/s_axis_data_tvalid] [get_bd_pins FIR_REAL1/s_axis_data_tvalid] [get_bd_pins FIR_REAL2/s_axis_data_tvalid] [get_bd_pins datasrc/tvalid]
  connect_bd_net -net resetn_0_1 [get_bd_ports resetn] [get_bd_pins datasrc/resetn]
  connect_bd_net -net splitter_0_dataImag [get_bd_pins FIR_IMAG1/s_axis_data_tdata] [get_bd_pins FIR_REAL2/s_axis_data_tdata] [get_bd_pins splitter_0/dataImag]
  connect_bd_net -net splitter_0_dataReal [get_bd_pins FIR_IMAG2/s_axis_data_tdata] [get_bd_pins FIR_REAL1/s_axis_data_tdata] [get_bd_pins splitter_0/dataReal]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins FIR_IMAG1/m_axis_data_tready] [get_bd_pins FIR_IMAG2/m_axis_data_tready] [get_bd_pins FIR_REAL1/m_axis_data_tready] [get_bd_pins FIR_REAL2/m_axis_data_tready] [get_bd_pins HIGH/dout]

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


