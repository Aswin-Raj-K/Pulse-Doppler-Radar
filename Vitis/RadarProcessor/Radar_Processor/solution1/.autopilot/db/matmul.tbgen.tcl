set moduleName matmul
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {matmul}
set C_modelType { void 0 }
set C_modelArgList {
	{ a_M_real int 32 regular {array 12520 { 1 3 } 1 1 }  }
	{ a_M_imag int 32 regular {array 12520 { 1 3 } 1 1 }  }
	{ out_M_real int 32 regular {array 12520 { 0 3 } 0 1 }  }
	{ out_M_imag int 32 regular {array 12520 { 0 3 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "a_M_real", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "a_M_imag", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "out_M_real", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_M_imag", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ a_M_real_address0 sc_out sc_lv 14 signal 0 } 
	{ a_M_real_ce0 sc_out sc_logic 1 signal 0 } 
	{ a_M_real_q0 sc_in sc_lv 32 signal 0 } 
	{ a_M_imag_address0 sc_out sc_lv 14 signal 1 } 
	{ a_M_imag_ce0 sc_out sc_logic 1 signal 1 } 
	{ a_M_imag_q0 sc_in sc_lv 32 signal 1 } 
	{ out_M_real_address0 sc_out sc_lv 14 signal 2 } 
	{ out_M_real_ce0 sc_out sc_logic 1 signal 2 } 
	{ out_M_real_we0 sc_out sc_logic 1 signal 2 } 
	{ out_M_real_d0 sc_out sc_lv 32 signal 2 } 
	{ out_M_imag_address0 sc_out sc_lv 14 signal 3 } 
	{ out_M_imag_ce0 sc_out sc_logic 1 signal 3 } 
	{ out_M_imag_we0 sc_out sc_logic 1 signal 3 } 
	{ out_M_imag_d0 sc_out sc_lv 32 signal 3 } 
	{ grp_fu_1130_p_din0 sc_out sc_lv 10 signal -1 } 
	{ grp_fu_1130_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1130_p_dout0 sc_in sc_lv 40 signal -1 } 
	{ grp_fu_1130_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_1134_p_din0 sc_out sc_lv 10 signal -1 } 
	{ grp_fu_1134_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_1134_p_dout0 sc_in sc_lv 40 signal -1 } 
	{ grp_fu_1134_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "a_M_real_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "a_M_real", "role": "address0" }} , 
 	{ "name": "a_M_real_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_M_real", "role": "ce0" }} , 
 	{ "name": "a_M_real_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_M_real", "role": "q0" }} , 
 	{ "name": "a_M_imag_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "a_M_imag", "role": "address0" }} , 
 	{ "name": "a_M_imag_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "a_M_imag", "role": "ce0" }} , 
 	{ "name": "a_M_imag_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_M_imag", "role": "q0" }} , 
 	{ "name": "out_M_real_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "out_M_real", "role": "address0" }} , 
 	{ "name": "out_M_real_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_M_real", "role": "ce0" }} , 
 	{ "name": "out_M_real_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_M_real", "role": "we0" }} , 
 	{ "name": "out_M_real_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_M_real", "role": "d0" }} , 
 	{ "name": "out_M_imag_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "out_M_imag", "role": "address0" }} , 
 	{ "name": "out_M_imag_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_M_imag", "role": "ce0" }} , 
 	{ "name": "out_M_imag_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "out_M_imag", "role": "we0" }} , 
 	{ "name": "out_M_imag_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_M_imag", "role": "d0" }} , 
 	{ "name": "grp_fu_1130_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "grp_fu_1130_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1130_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1130_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1130_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "grp_fu_1130_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1130_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1130_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_1134_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":10, "type": "signal", "bundle":{"name": "grp_fu_1134_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_1134_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_1134_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_1134_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":40, "type": "signal", "bundle":{"name": "grp_fu_1134_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_1134_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_1134_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pulseCanceler_coeff_M_real_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_6ns_7ns_6ns_11_4_1_U3", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	matmul {
		a_M_real {Type I LastRead 4 FirstWrite -1}
		a_M_imag {Type I LastRead 4 FirstWrite -1}
		out_M_real {Type O LastRead -1 FirstWrite 8}
		out_M_imag {Type O LastRead -1 FirstWrite 8}
		pulseCanceler_coeff_M_real_V {Type I LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "488288", "Max" : "488288"}
	, {"Name" : "Interval", "Min" : "488288", "Max" : "488288"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	a_M_real { ap_memory {  { a_M_real_address0 mem_address 1 14 }  { a_M_real_ce0 mem_ce 1 1 }  { a_M_real_q0 mem_dout 0 32 } } }
	a_M_imag { ap_memory {  { a_M_imag_address0 mem_address 1 14 }  { a_M_imag_ce0 mem_ce 1 1 }  { a_M_imag_q0 mem_dout 0 32 } } }
	out_M_real { ap_memory {  { out_M_real_address0 mem_address 1 14 }  { out_M_real_ce0 mem_ce 1 1 }  { out_M_real_we0 mem_we 1 1 }  { out_M_real_d0 mem_din 1 32 } } }
	out_M_imag { ap_memory {  { out_M_imag_address0 mem_address 1 14 }  { out_M_imag_ce0 mem_ce 1 1 }  { out_M_imag_we0 mem_we 1 1 }  { out_M_imag_d0 mem_din 1 32 } } }
}
