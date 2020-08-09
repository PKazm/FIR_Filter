# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ACCUM_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_A_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_D_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "AXI_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FILTER_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SAMPLE_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TAP_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.ACCUM_WIDTH { PARAM_VALUE.ACCUM_WIDTH } {
	# Procedure called to update ACCUM_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ACCUM_WIDTH { PARAM_VALUE.ACCUM_WIDTH } {
	# Procedure called to validate ACCUM_WIDTH
	return true
}

proc update_PARAM_VALUE.AXI_A_WIDTH { PARAM_VALUE.AXI_A_WIDTH } {
	# Procedure called to update AXI_A_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_A_WIDTH { PARAM_VALUE.AXI_A_WIDTH } {
	# Procedure called to validate AXI_A_WIDTH
	return true
}

proc update_PARAM_VALUE.AXI_D_WIDTH { PARAM_VALUE.AXI_D_WIDTH } {
	# Procedure called to update AXI_D_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_D_WIDTH { PARAM_VALUE.AXI_D_WIDTH } {
	# Procedure called to validate AXI_D_WIDTH
	return true
}

proc update_PARAM_VALUE.AXI_ID_WIDTH { PARAM_VALUE.AXI_ID_WIDTH } {
	# Procedure called to update AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_WIDTH { PARAM_VALUE.AXI_ID_WIDTH } {
	# Procedure called to validate AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.FILTER_LENGTH { PARAM_VALUE.FILTER_LENGTH } {
	# Procedure called to update FILTER_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_LENGTH { PARAM_VALUE.FILTER_LENGTH } {
	# Procedure called to validate FILTER_LENGTH
	return true
}

proc update_PARAM_VALUE.SAMPLE_WIDTH { PARAM_VALUE.SAMPLE_WIDTH } {
	# Procedure called to update SAMPLE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAMPLE_WIDTH { PARAM_VALUE.SAMPLE_WIDTH } {
	# Procedure called to validate SAMPLE_WIDTH
	return true
}

proc update_PARAM_VALUE.TAP_WIDTH { PARAM_VALUE.TAP_WIDTH } {
	# Procedure called to update TAP_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TAP_WIDTH { PARAM_VALUE.TAP_WIDTH } {
	# Procedure called to validate TAP_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.AXI_D_WIDTH { MODELPARAM_VALUE.AXI_D_WIDTH PARAM_VALUE.AXI_D_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_D_WIDTH}] ${MODELPARAM_VALUE.AXI_D_WIDTH}
}

proc update_MODELPARAM_VALUE.AXI_A_WIDTH { MODELPARAM_VALUE.AXI_A_WIDTH PARAM_VALUE.AXI_A_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_A_WIDTH}] ${MODELPARAM_VALUE.AXI_A_WIDTH}
}

proc update_MODELPARAM_VALUE.AXI_ID_WIDTH { MODELPARAM_VALUE.AXI_ID_WIDTH PARAM_VALUE.AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_WIDTH}] ${MODELPARAM_VALUE.AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.SAMPLE_WIDTH { MODELPARAM_VALUE.SAMPLE_WIDTH PARAM_VALUE.SAMPLE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SAMPLE_WIDTH}] ${MODELPARAM_VALUE.SAMPLE_WIDTH}
}

proc update_MODELPARAM_VALUE.TAP_WIDTH { MODELPARAM_VALUE.TAP_WIDTH PARAM_VALUE.TAP_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TAP_WIDTH}] ${MODELPARAM_VALUE.TAP_WIDTH}
}

proc update_MODELPARAM_VALUE.FILTER_LENGTH { MODELPARAM_VALUE.FILTER_LENGTH PARAM_VALUE.FILTER_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_LENGTH}] ${MODELPARAM_VALUE.FILTER_LENGTH}
}

proc update_MODELPARAM_VALUE.ACCUM_WIDTH { MODELPARAM_VALUE.ACCUM_WIDTH PARAM_VALUE.ACCUM_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ACCUM_WIDTH}] ${MODELPARAM_VALUE.ACCUM_WIDTH}
}

