# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "COLUMNS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COLUMNS_ADD_LEN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_ADD_LEN" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ROWS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ROWS_ADD_LEN" -parent ${Page_0}


}

proc update_PARAM_VALUE.COLUMNS { PARAM_VALUE.COLUMNS } {
	# Procedure called to update COLUMNS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COLUMNS { PARAM_VALUE.COLUMNS } {
	# Procedure called to validate COLUMNS
	return true
}

proc update_PARAM_VALUE.COLUMNS_ADD_LEN { PARAM_VALUE.COLUMNS_ADD_LEN } {
	# Procedure called to update COLUMNS_ADD_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COLUMNS_ADD_LEN { PARAM_VALUE.COLUMNS_ADD_LEN } {
	# Procedure called to validate COLUMNS_ADD_LEN
	return true
}

proc update_PARAM_VALUE.DATA_ADD_LEN { PARAM_VALUE.DATA_ADD_LEN } {
	# Procedure called to update DATA_ADD_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_ADD_LEN { PARAM_VALUE.DATA_ADD_LEN } {
	# Procedure called to validate DATA_ADD_LEN
	return true
}

proc update_PARAM_VALUE.ROWS { PARAM_VALUE.ROWS } {
	# Procedure called to update ROWS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ROWS { PARAM_VALUE.ROWS } {
	# Procedure called to validate ROWS
	return true
}

proc update_PARAM_VALUE.ROWS_ADD_LEN { PARAM_VALUE.ROWS_ADD_LEN } {
	# Procedure called to update ROWS_ADD_LEN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ROWS_ADD_LEN { PARAM_VALUE.ROWS_ADD_LEN } {
	# Procedure called to validate ROWS_ADD_LEN
	return true
}


proc update_MODELPARAM_VALUE.ROWS_ADD_LEN { MODELPARAM_VALUE.ROWS_ADD_LEN PARAM_VALUE.ROWS_ADD_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ROWS_ADD_LEN}] ${MODELPARAM_VALUE.ROWS_ADD_LEN}
}

proc update_MODELPARAM_VALUE.COLUMNS_ADD_LEN { MODELPARAM_VALUE.COLUMNS_ADD_LEN PARAM_VALUE.COLUMNS_ADD_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COLUMNS_ADD_LEN}] ${MODELPARAM_VALUE.COLUMNS_ADD_LEN}
}

proc update_MODELPARAM_VALUE.DATA_ADD_LEN { MODELPARAM_VALUE.DATA_ADD_LEN PARAM_VALUE.DATA_ADD_LEN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_ADD_LEN}] ${MODELPARAM_VALUE.DATA_ADD_LEN}
}

proc update_MODELPARAM_VALUE.ROWS { MODELPARAM_VALUE.ROWS PARAM_VALUE.ROWS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ROWS}] ${MODELPARAM_VALUE.ROWS}
}

proc update_MODELPARAM_VALUE.COLUMNS { MODELPARAM_VALUE.COLUMNS PARAM_VALUE.COLUMNS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COLUMNS}] ${MODELPARAM_VALUE.COLUMNS}
}

