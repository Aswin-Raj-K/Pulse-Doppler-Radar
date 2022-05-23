set moduleName top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {top}
set C_modelType { void 0 }
set C_modelArgList {
	{ data_IN int 32 regular {axi_s 0 volatile  { data_IN Data } }  }
	{ data_OUT int 32 regular {axi_s 1 volatile  { data_OUT Data } }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "data_IN", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "data_IN","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "data_OUT", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "data_OUT","cData": "int","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 8
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ data_IN_TDATA sc_in sc_lv 32 signal 0 } 
	{ data_IN_TVALID sc_in sc_logic 1 invld 0 } 
	{ data_IN_TREADY sc_out sc_logic 1 inacc 0 } 
	{ data_OUT_TDATA sc_out sc_lv 32 signal 1 } 
	{ data_OUT_TVALID sc_out sc_logic 1 outvld 1 } 
	{ data_OUT_TREADY sc_in sc_logic 1 outacc 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "data_IN_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_IN", "role": "TDATA" }} , 
 	{ "name": "data_IN_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "data_IN", "role": "TVALID" }} , 
 	{ "name": "data_IN_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "data_IN", "role": "TREADY" }} , 
 	{ "name": "data_OUT_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "data_OUT", "role": "TDATA" }} , 
 	{ "name": "data_OUT_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "data_OUT", "role": "TVALID" }} , 
 	{ "name": "data_OUT_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "data_OUT", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "11", "15", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"],
		"CDFG" : "top",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4709448", "EstimateLatencyMax" : "4709448",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "data_IN", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "data_IN_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "data_OUT", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "data_OUT_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "pulseCanceler_coeff_M_real_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "15", "SubInstance" : "grp_matmul_fu_491", "Port" : "pulseCanceler_coeff_M_real_V"}]},
			{"Name" : "matchedFilter_coeff_M_real_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_matchedFilter_fu_467", "Port" : "matchedFilter_coeff_M_real_V"}]},
			{"Name" : "matchedFilter_coeff_M_imag_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "8", "SubInstance" : "grp_matchedFilter_fu_467", "Port" : "matchedFilter_coeff_M_imag_V"}]},
			{"Name" : "hamming_coeff_M_real_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fft_coeff_M_real_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_fft_fu_479", "Port" : "fft_coeff_M_real_V"}]},
			{"Name" : "fft_coeff_M_imag_V", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "11", "SubInstance" : "grp_fft_fu_479", "Port" : "fft_coeff_M_imag_V"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hamming_coeff_M_real_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.real_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.imag_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mat_A_M_real_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mat_A_M_imag_V_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mat_B_M_real_V_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mat_B_M_imag_V_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matchedFilter_fu_467", "Parent" : "0", "Child" : ["9", "10"],
		"CDFG" : "matchedFilter",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "3820798", "EstimateLatencyMax" : "3820798",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a_M_real", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "a_M_imag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "out_M_real", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "out_M_imag", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "matchedFilter_coeff_M_real_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "matchedFilter_coeff_M_imag_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matchedFilter_fu_467.matchedFilter_coeff_M_real_V_U", "Parent" : "8"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matchedFilter_fu_467.matchedFilter_coeff_M_imag_V_U", "Parent" : "8"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_479", "Parent" : "0", "Child" : ["12", "13", "14"],
		"CDFG" : "fft",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "320521", "EstimateLatencyMax" : "320521",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a_M_real", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "a_M_imag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "out_M_real", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "out_M_imag", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "fft_coeff_M_real_V", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "fft_coeff_M_imag_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_479.fft_coeff_M_real_V_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_479.fft_coeff_M_imag_V_U", "Parent" : "11"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fft_fu_479.mac_muladd_6ns_7ns_6ns_11_4_1_U26", "Parent" : "11"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matmul_fu_491", "Parent" : "0", "Child" : ["16", "17"],
		"CDFG" : "matmul",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "488288", "EstimateLatencyMax" : "488288",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "a_M_real", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "a_M_imag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "out_M_real", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "out_M_imag", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "pulseCanceler_coeff_M_real_V", "Type" : "Memory", "Direction" : "I"}]},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_fu_491.pulseCanceler_coeff_M_real_V_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matmul_fu_491.mac_muladd_6ns_7ns_6ns_11_4_1_U3", "Parent" : "15"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_32s_40_2_1_U33", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_32s_40_2_1_U34", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_32s_40_2_1_U35", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_32s_40_2_1_U36", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_9s_32s_40_2_1_U37", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_9s_32s_40_2_1_U38", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_32s_40_2_1_U39", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_10s_32s_40_2_1_U40", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_data_IN_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_data_OUT_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	top {
		data_IN {Type I LastRead 3 FirstWrite -1}
		data_OUT {Type O LastRead -1 FirstWrite 16}
		pulseCanceler_coeff_M_real_V {Type I LastRead -1 FirstWrite -1}
		matchedFilter_coeff_M_real_V {Type I LastRead -1 FirstWrite -1}
		matchedFilter_coeff_M_imag_V {Type I LastRead -1 FirstWrite -1}
		hamming_coeff_M_real_V {Type I LastRead -1 FirstWrite -1}
		fft_coeff_M_real_V {Type I LastRead -1 FirstWrite -1}
		fft_coeff_M_imag_V {Type I LastRead -1 FirstWrite -1}}
	matchedFilter {
		a_M_real {Type I LastRead 2 FirstWrite -1}
		a_M_imag {Type I LastRead 2 FirstWrite -1}
		out_M_real {Type O LastRead -1 FirstWrite 7}
		out_M_imag {Type O LastRead -1 FirstWrite 7}
		matchedFilter_coeff_M_real_V {Type I LastRead -1 FirstWrite -1}
		matchedFilter_coeff_M_imag_V {Type I LastRead -1 FirstWrite -1}}
	fft {
		a_M_real {Type I LastRead 4 FirstWrite -1}
		a_M_imag {Type I LastRead 4 FirstWrite -1}
		out_M_real {Type O LastRead -1 FirstWrite 9}
		out_M_imag {Type O LastRead -1 FirstWrite 9}
		fft_coeff_M_real_V {Type I LastRead -1 FirstWrite -1}
		fft_coeff_M_imag_V {Type I LastRead -1 FirstWrite -1}}
	matmul {
		a_M_real {Type I LastRead 4 FirstWrite -1}
		a_M_imag {Type I LastRead 4 FirstWrite -1}
		out_M_real {Type O LastRead -1 FirstWrite 8}
		out_M_imag {Type O LastRead -1 FirstWrite 8}
		pulseCanceler_coeff_M_real_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4709448", "Max" : "4709448"}
	, {"Name" : "Interval", "Min" : "4709449", "Max" : "4709449"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "2", "EnableSignal" : "ap_enable_pp2"}
	{"Pipeline" : "3", "EnableSignal" : "ap_enable_pp3"}
	{"Pipeline" : "4", "EnableSignal" : "ap_enable_pp4"}
	{"Pipeline" : "5", "EnableSignal" : "ap_enable_pp5"}
	{"Pipeline" : "6", "EnableSignal" : "ap_enable_pp6"}
]}

set Spec2ImplPortList { 
	data_IN { axis {  { data_IN_TDATA in_data 0 32 }  { data_IN_TVALID in_vld 0 1 }  { data_IN_TREADY in_acc 1 1 } } }
	data_OUT { axis {  { data_OUT_TDATA out_data 1 32 }  { data_OUT_TVALID out_vld 1 1 }  { data_OUT_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
