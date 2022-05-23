// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      top
`define AUTOTB_DUT_INST AESL_inst_top
`define AUTOTB_TOP      apatb_top_top
`define AUTOTB_LAT_RESULT_FILE "top.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "top.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_top_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 5.00
`define AUTOTB_II 4709449
`define AUTOTB_LATENCY 4709448

`define AESL_DEPTH_data_IN 1
`define AESL_DEPTH_data_OUT 1
`define AUTOTB_TVIN_data_IN  "../tv/cdatafile/c.top.autotvin_data_IN.dat"
`define AUTOTB_TVIN_data_OUT  "../tv/cdatafile/c.top.autotvin_data_OUT.dat"
`define AUTOTB_TVIN_data_IN_out_wrapc  "../tv/rtldatafile/rtl.top.autotvin_data_IN.dat"
`define AUTOTB_TVIN_data_OUT_out_wrapc  "../tv/rtldatafile/rtl.top.autotvin_data_OUT.dat"
`define AUTOTB_TVOUT_data_OUT  "../tv/cdatafile/c.top.autotvout_data_OUT.dat"
`define AUTOTB_TVOUT_data_OUT_out_wrapc  "../tv/rtldatafile/rtl.top.autotvout_data_OUT.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = 4709448;
parameter LENGTH_data_IN = 25040;
parameter LENGTH_data_OUT = 20032;

task read_token;
    input integer fp;
    output reg [143 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

reg AESL_clock;
reg rst;
reg dut_rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
reg AESL_done = 0;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire [31 : 0] data_IN_TDATA;
wire  data_IN_TVALID;
wire  data_IN_TREADY;
wire [31 : 0] data_OUT_TDATA;
wire  data_OUT_TVALID;
wire  data_OUT_TREADY;
reg [31:0] ap_c_n_tvin_trans_num_data_IN;
reg [31:0] ap_c_n_tvin_trans_num_data_OUT;
reg [31:0] ap_c_n_tvout_trans_num_data_OUT;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;

wire ap_clk;
wire ap_rst_n;
wire ap_rst_n_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .data_IN_TDATA(data_IN_TDATA),
    .data_IN_TVALID(data_IN_TVALID),
    .data_IN_TREADY(data_IN_TREADY),
    .data_OUT_TDATA(data_OUT_TDATA),
    .data_OUT_TVALID(data_OUT_TVALID),
    .data_OUT_TREADY(data_OUT_TREADY));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst_n = dut_rst;
assign ap_rst_n_n = ~dut_rst;
assign AESL_reset = rst;
assign AESL_start = start;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
assign AESL_ready = ready;


wire data_IN_ready;
wire data_IN_done;
wire [31:0] data_IN_transaction;
wire axi_s_data_IN_TVALID;
wire axi_s_data_IN_TREADY;

AESL_axi_s_data_IN AESL_AXI_S_data_IN(
    .clk(AESL_clock),
    .reset(AESL_reset),
    .TRAN_data_IN_TDATA(data_IN_TDATA),
    .TRAN_data_IN_TVALID(data_IN_TVALID),
    .TRAN_data_IN_TREADY(data_IN_TREADY),
    .ready(data_IN_ready),
    .done(data_IN_done),
    .transaction(data_IN_transaction));

assign data_IN_ready = ready;
assign data_IN_done = 0;
wire data_OUT_ready;
wire data_OUT_done;
wire [31:0] data_OUT_transaction;
wire axi_s_data_OUT_TVALID;
wire axi_s_data_OUT_TREADY;

AESL_axi_s_data_OUT AESL_AXI_S_data_OUT(
    .clk(AESL_clock),
    .reset(AESL_reset),
    .TRAN_data_OUT_TDATA(data_OUT_TDATA),
    .TRAN_data_OUT_TVALID(data_OUT_TVALID),
    .TRAN_data_OUT_TREADY(data_OUT_TREADY),
    .ready(data_OUT_ready),
    .done(data_OUT_done),
    .transaction(data_OUT_transaction));

assign data_OUT_ready = 0;
assign data_OUT_done = AESL_done;

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 1);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (~AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_data_IN;
reg [31:0] size_data_IN;
reg [31:0] size_data_IN_backup;
reg end_data_OUT;
reg [31:0] size_data_OUT;
reg [31:0] size_data_OUT_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 0;
    # 100;
    repeat(0+3) @ (posedge AESL_clock);
    rst = 1;
end
initial begin : initial_process_for_dut_rst
    integer proc_rand;
    dut_rst = 0;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    dut_rst = 1;
end
    // data_IN : axi_s
    reg ready_data_IN;
    
    always @ (*) begin
        if (end_data_IN) begin
            ready_data_IN <= 1;
        end else if (ap_c_n_tvin_trans_num_data_IN > ready_cnt) begin
            ready_data_IN <= 1;
        end else begin
            ready_data_IN <= 0;
        end
    end
    
    // data_OUT : axi_s
    reg ready_data_OUT;
    
    always @ (*) begin
        if (end_data_OUT) begin
            ready_data_OUT <= 1;
        end else if (ap_c_n_tvin_trans_num_data_OUT > ready_cnt) begin
            ready_data_OUT <= 1;
        end else begin
            ready_data_OUT <= 0;
        end
    end
    
    // start
    always @ (*) begin
        if (~AESL_reset) begin
            start <= 0;
        end else begin
            start <= ready_data_IN && ready_data_OUT;
        end
    end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait(AESL_reset === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

assign ready = AESL_start;
assign ready_wire = ready;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
    // data_OUT : axi_s
    reg done_data_OUT;
    
    always @ (*) begin
        if (end_data_OUT) begin
            done_data_OUT <= 1;
        end else if (ap_c_n_tvout_trans_num_data_OUT > done_cnt + 1) begin
            done_data_OUT <= 1;
        end else if (size_data_OUT > 1) begin
            done_data_OUT <= 0;
        end else if (data_OUT_TVALID == 1) begin
            done_data_OUT <= 1;
        end else begin
            done_data_OUT <= 0;
        end
    end
    
    // AESL_done
    always @ (*) begin
        if (~AESL_reset) begin
            AESL_done <= 0;
        end else begin
            AESL_done <= done_data_OUT;
        end
    end
    
    `define STREAM_SIZE_IN_data_IN "../tv/stream_size/stream_size_in_data_IN.dat"
    
    initial begin : gen_ap_c_n_tvin_trans_num_data_IN
        integer fp_data_IN;
        reg [127:0] token_data_IN;
        integer ret;
        
        ap_c_n_tvin_trans_num_data_IN = 0;
        end_data_IN = 0;
        wait (AESL_reset === 1);
        
        fp_data_IN = $fopen(`AUTOTB_TVIN_data_IN, "r");
        if(fp_data_IN == 0) begin
            $display("Failed to open file \"%s\"!", `AUTOTB_TVIN_data_IN);
            $finish;
        end
        read_token(fp_data_IN, token_data_IN); // should be [[[runtime]]]
        if (token_data_IN != "[[[runtime]]]") begin
            $display("ERROR: token_data_IN != \"[[[runtime]]]\"");
            $finish;
        end
        ap_c_n_tvin_trans_num_data_IN = ap_c_n_tvin_trans_num_data_IN + 1;
        read_token(fp_data_IN, token_data_IN); // should be [[transaction]] or [[[/runtime]]]
        if (token_data_IN == "[[[/runtime]]]") begin
            $fclose(fp_data_IN);
            end_data_IN = 1;
        end else begin
            end_data_IN = 0;
            read_token(fp_data_IN, token_data_IN); // should be transaction number
            read_token(fp_data_IN, token_data_IN);
        end
        while (token_data_IN == "[[/transaction]]" && end_data_IN == 0) begin
            ap_c_n_tvin_trans_num_data_IN = ap_c_n_tvin_trans_num_data_IN + 1;
            read_token(fp_data_IN, token_data_IN); // should be [[transaction]] or [[[/runtime]]]
            if (token_data_IN == "[[[/runtime]]]") begin
                $fclose(fp_data_IN);
                end_data_IN = 1;
            end else begin
                end_data_IN = 0;
                read_token(fp_data_IN, token_data_IN); // should be transaction number
                read_token(fp_data_IN, token_data_IN);
            end
        end
        forever begin
            @ (posedge AESL_clock);
            if (end_data_IN == 0) begin
                if ((data_IN_TREADY & data_IN_TVALID) == 1) begin
                    read_token(fp_data_IN, token_data_IN);
                    while (token_data_IN == "[[/transaction]]" && end_data_IN == 0) begin
                        ap_c_n_tvin_trans_num_data_IN = ap_c_n_tvin_trans_num_data_IN + 1;
                        read_token(fp_data_IN, token_data_IN); // should be [[transaction]] or [[[/runtime]]]
                        if (token_data_IN == "[[[/runtime]]]") begin
                            $fclose(fp_data_IN);
                            end_data_IN = 1;
                        end else begin
                            end_data_IN = 0;
                            read_token(fp_data_IN, token_data_IN); // should be transaction number
                            read_token(fp_data_IN, token_data_IN);
                        end
                    end
                end
            end else begin
                ap_c_n_tvin_trans_num_data_IN = ap_c_n_tvin_trans_num_data_IN + 1;
            end
        end
    end
    
    
    initial begin : proc_ap_c_n_tvin_trans_num_data_OUT
        ap_c_n_tvin_trans_num_data_OUT = AUTOTB_TRANSACTION_NUM + 1;
    end
    `define STREAM_SIZE_OUT_data_OUT "../tv/stream_size/stream_size_out_data_OUT.dat"
    
    initial begin : proc_ap_c_n_tvout_trans_num_data_OUT
        integer fp_data_OUT;
        reg [127:0] token_data_OUT;
        integer ret;
        
        ap_c_n_tvout_trans_num_data_OUT = 0;
        end_data_OUT = 0;
        wait (AESL_reset === 1);
        
        while(done_cnt < AUTOTB_TRANSACTION_NUM) begin
            ap_c_n_tvout_trans_num_data_OUT = ap_c_n_tvout_trans_num_data_OUT + 1;
            size_data_OUT = LENGTH_data_OUT;
            while (size_data_OUT > 0) begin
                @ (posedge AESL_clock);
                if (data_OUT_TVALID == 1) begin
                    size_data_OUT = size_data_OUT - 1;
                end
            end
        end
        end_data_OUT = 1;
    end

reg dump_tvout_finish_data_OUT;

initial begin : dump_tvout_runtime_sign_data_OUT
    integer fp;
    dump_tvout_finish_data_OUT = 0;
    fp = $fopen(`AUTOTB_TVOUT_data_OUT_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_data_OUT_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_data_OUT_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_data_OUT_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_data_OUT = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    if (AESL_reset == 0) begin
        clk_cnt <= 32'h0;
        AESL_ready_p1 <= 1'b0;
        AESL_start_p1 <= 1'b0;
    end
    else begin
        clk_cnt <= clk_cnt + 1;
        AESL_ready_p1 <= AESL_ready;
        AESL_start_p1 <= AESL_start;
    end
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
reg [31:0] lat_total;
event report_progress;

always @(posedge AESL_clock)
begin
    if (finish_cnt == AUTOTB_TRANSACTION_NUM - 1 && AESL_done == 1'b1)
        lat_total = clk_cnt - start_timestamp[0];
end

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 1);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 1);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    reg [31:0] total_execute_time;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        total_execute_time = lat_total;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);
        $fdisplay(fp, "$TOTAL_EXECUTE_TIME = \"%0d\"", total_execute_time);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif
///////////////////////////////////////////////////////
// dataflow status monitor
///////////////////////////////////////////////////////
dataflow_monitor U_dataflow_monitor(
    .clock(AESL_clock),
    .reset(~rst),
    .finish(all_finish));

`include "fifo_para.vh"

endmodule
