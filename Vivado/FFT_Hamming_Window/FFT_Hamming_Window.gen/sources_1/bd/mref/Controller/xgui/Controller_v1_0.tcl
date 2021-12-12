# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "data_address_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_length" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_matrix_fast_time_samples" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_matrix_slow_time_samples" -parent ${Page_0}
  ipgui::add_param $IPINST -name "data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "window_address_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "window_data_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "window_length" -parent ${Page_0}


}

proc update_PARAM_VALUE.data_address_width { PARAM_VALUE.data_address_width } {
	# Procedure called to update data_address_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_address_width { PARAM_VALUE.data_address_width } {
	# Procedure called to validate data_address_width
	return true
}

proc update_PARAM_VALUE.data_length { PARAM_VALUE.data_length } {
	# Procedure called to update data_length when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_length { PARAM_VALUE.data_length } {
	# Procedure called to validate data_length
	return true
}

proc update_PARAM_VALUE.data_matrix_fast_time_samples { PARAM_VALUE.data_matrix_fast_time_samples } {
	# Procedure called to update data_matrix_fast_time_samples when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_matrix_fast_time_samples { PARAM_VALUE.data_matrix_fast_time_samples } {
	# Procedure called to validate data_matrix_fast_time_samples
	return true
}

proc update_PARAM_VALUE.data_matrix_slow_time_samples { PARAM_VALUE.data_matrix_slow_time_samples } {
	# Procedure called to update data_matrix_slow_time_samples when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_matrix_slow_time_samples { PARAM_VALUE.data_matrix_slow_time_samples } {
	# Procedure called to validate data_matrix_slow_time_samples
	return true
}

proc update_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to update data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.data_width { PARAM_VALUE.data_width } {
	# Procedure called to validate data_width
	return true
}

proc update_PARAM_VALUE.window_address_width { PARAM_VALUE.window_address_width } {
	# Procedure called to update window_address_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.window_address_width { PARAM_VALUE.window_address_width } {
	# Procedure called to validate window_address_width
	return true
}

proc update_PARAM_VALUE.window_data_width { PARAM_VALUE.window_data_width } {
	# Procedure called to update window_data_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.window_data_width { PARAM_VALUE.window_data_width } {
	# Procedure called to validate window_data_width
	return true
}

proc update_PARAM_VALUE.window_length { PARAM_VALUE.window_length } {
	# Procedure called to update window_length when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.window_length { PARAM_VALUE.window_length } {
	# Procedure called to validate window_length
	return true
}


proc update_MODELPARAM_VALUE.window_length { MODELPARAM_VALUE.window_length PARAM_VALUE.window_length } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.window_length}] ${MODELPARAM_VALUE.window_length}
}

proc update_MODELPARAM_VALUE.window_data_width { MODELPARAM_VALUE.window_data_width PARAM_VALUE.window_data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.window_data_width}] ${MODELPARAM_VALUE.window_data_width}
}

proc update_MODELPARAM_VALUE.window_address_width { MODELPARAM_VALUE.window_address_width PARAM_VALUE.window_address_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.window_address_width}] ${MODELPARAM_VALUE.window_address_width}
}

proc update_MODELPARAM_VALUE.data_length { MODELPARAM_VALUE.data_length PARAM_VALUE.data_length } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_length}] ${MODELPARAM_VALUE.data_length}
}

proc update_MODELPARAM_VALUE.data_address_width { MODELPARAM_VALUE.data_address_width PARAM_VALUE.data_address_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_address_width}] ${MODELPARAM_VALUE.data_address_width}
}

proc update_MODELPARAM_VALUE.data_width { MODELPARAM_VALUE.data_width PARAM_VALUE.data_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_width}] ${MODELPARAM_VALUE.data_width}
}

proc update_MODELPARAM_VALUE.data_matrix_fast_time_samples { MODELPARAM_VALUE.data_matrix_fast_time_samples PARAM_VALUE.data_matrix_fast_time_samples } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_matrix_fast_time_samples}] ${MODELPARAM_VALUE.data_matrix_fast_time_samples}
}

proc update_MODELPARAM_VALUE.data_matrix_slow_time_samples { MODELPARAM_VALUE.data_matrix_slow_time_samples PARAM_VALUE.data_matrix_slow_time_samples } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.data_matrix_slow_time_samples}] ${MODELPARAM_VALUE.data_matrix_slow_time_samples}
}

