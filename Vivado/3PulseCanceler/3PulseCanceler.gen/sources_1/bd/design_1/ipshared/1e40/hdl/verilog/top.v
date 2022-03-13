// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="top_top,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=7.098500,HLS_SYN_LAT=513025,HLS_SYN_TPT=none,HLS_SYN_MEM=66,HLS_SYN_DSP=0,HLS_SYN_FF=760,HLS_SYN_LUT=1155,HLS_VERSION=2020_2}" *)

module top (
        ap_clk,
        ap_rst_n,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        data_IN_TDATA,
        data_IN_TVALID,
        data_IN_TREADY,
        data_OUT_TDATA,
        data_OUT_TVALID,
        data_OUT_TREADY
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_pp0_stage0 = 6'd2;
parameter    ap_ST_fsm_state4 = 6'd4;
parameter    ap_ST_fsm_state5 = 6'd8;
parameter    ap_ST_fsm_pp1_stage0 = 6'd16;
parameter    ap_ST_fsm_state12 = 6'd32;

input   ap_clk;
input   ap_rst_n;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] data_IN_TDATA;
input   data_IN_TVALID;
output   data_IN_TREADY;
output  [31:0] data_OUT_TDATA;
output   data_OUT_TVALID;
input   data_OUT_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;

 reg    ap_rst_n_inv;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    data_IN_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
wire   [0:0] icmp_ln4_fu_253_p2;
reg    data_OUT_TDATA_blk_n;
reg    ap_enable_reg_pp1_iter4;
wire    ap_block_pp1_stage0;
reg   [0:0] icmp_ln13_reg_463;
reg   [0:0] icmp_ln13_reg_463_pp1_iter3_reg;
reg    ap_enable_reg_pp1_iter5;
reg   [0:0] icmp_ln13_reg_463_pp1_iter4_reg;
reg   [13:0] indvar_flatten_reg_171;
reg   [8:0] i_reg_182;
reg   [5:0] j_reg_193;
reg   [13:0] indvar_flatten7_reg_204;
reg   [8:0] i_1_reg_215;
reg   [5:0] j_1_reg_226;
wire   [13:0] add_ln4_1_fu_247_p2;
reg    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln4_reg_427;
wire   [5:0] select_ln4_fu_271_p3;
reg   [5:0] select_ln4_reg_431;
wire   [8:0] select_ln4_1_fu_279_p3;
reg   [8:0] select_ln4_1_reg_436;
wire   [15:0] trunc_ln7_fu_287_p1;
reg   [15:0] trunc_ln7_reg_443;
reg   [15:0] trunc_ln7_1_reg_448;
wire   [5:0] add_ln5_fu_301_p2;
wire   [13:0] add_ln13_1_fu_346_p2;
wire    ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter0;
wire    ap_block_state6_pp1_stage0_iter0;
wire    ap_block_state7_pp1_stage0_iter1;
wire    ap_block_state8_pp1_stage0_iter2;
wire    ap_block_state9_pp1_stage0_iter3;
reg    ap_block_state10_pp1_stage0_iter4;
reg    ap_block_state10_io;
reg    ap_block_state11_pp1_stage0_iter5;
reg    ap_block_state11_io;
reg    ap_block_pp1_stage0_11001;
wire   [0:0] icmp_ln13_fu_352_p2;
reg   [0:0] icmp_ln13_reg_463_pp1_iter1_reg;
reg   [0:0] icmp_ln13_reg_463_pp1_iter2_reg;
wire   [5:0] select_ln13_fu_370_p3;
reg   [5:0] select_ln13_reg_467;
reg   [5:0] select_ln13_reg_467_pp1_iter1_reg;
wire   [8:0] select_ln13_1_fu_378_p3;
reg   [8:0] select_ln13_1_reg_472;
wire   [5:0] add_ln14_fu_390_p2;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire    ap_CS_fsm_state5;
wire    grp_matmul_fu_237_ap_ready;
wire    grp_matmul_fu_237_ap_done;
reg    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state6;
reg    ap_enable_reg_pp1_iter1;
reg    ap_enable_reg_pp1_iter2;
reg    ap_enable_reg_pp1_iter3;
reg   [13:0] mat_A_M_real_V_address0;
reg    mat_A_M_real_V_ce0;
reg    mat_A_M_real_V_we0;
wire   [15:0] mat_A_M_real_V_q0;
reg   [13:0] mat_A_M_imag_V_address0;
reg    mat_A_M_imag_V_ce0;
reg    mat_A_M_imag_V_we0;
wire   [15:0] mat_A_M_imag_V_q0;
reg   [13:0] mat_C_0_address0;
reg    mat_C_0_ce0;
reg    mat_C_0_we0;
wire   [15:0] mat_C_0_q0;
reg   [13:0] mat_C_1_address0;
reg    mat_C_1_ce0;
reg    mat_C_1_we0;
wire   [15:0] mat_C_1_q0;
wire    grp_matmul_fu_237_ap_start;
wire    grp_matmul_fu_237_ap_idle;
wire   [13:0] grp_matmul_fu_237_a_M_real_address0;
wire    grp_matmul_fu_237_a_M_real_ce0;
wire   [13:0] grp_matmul_fu_237_a_M_imag_address0;
wire    grp_matmul_fu_237_a_M_imag_ce0;
wire   [13:0] grp_matmul_fu_237_out_M_real_address0;
wire    grp_matmul_fu_237_out_M_real_ce0;
wire    grp_matmul_fu_237_out_M_real_we0;
wire   [15:0] grp_matmul_fu_237_out_M_real_d0;
wire   [13:0] grp_matmul_fu_237_out_M_imag_address0;
wire    grp_matmul_fu_237_out_M_imag_ce0;
wire    grp_matmul_fu_237_out_M_imag_we0;
wire   [15:0] grp_matmul_fu_237_out_M_imag_d0;
reg   [8:0] ap_phi_mux_i_phi_fu_186_p4;
reg   [8:0] ap_phi_mux_i_1_phi_fu_219_p4;
reg    grp_matmul_fu_237_ap_start_reg;
wire    ap_CS_fsm_state4;
wire   [63:0] zext_ln7_2_fu_340_p1;
wire   [63:0] zext_ln16_1_fu_399_p1;
reg    ap_block_pp1_stage0_01001;
wire   [0:0] icmp_ln5_fu_265_p2;
wire   [8:0] add_ln4_fu_259_p2;
wire   [11:0] tmp_2_fu_314_p3;
wire   [13:0] tmp_1_fu_307_p3;
wire   [13:0] zext_ln7_fu_321_p1;
wire   [13:0] add_ln7_fu_325_p2;
wire   [13:0] zext_ln7_1_fu_331_p1;
wire   [13:0] add_ln7_1_fu_334_p2;
wire   [0:0] icmp_ln14_fu_364_p2;
wire   [8:0] add_ln13_fu_358_p2;
wire   [13:0] grp_fu_413_p3;
wire   [8:0] grp_fu_413_p0;
wire   [6:0] grp_fu_413_p1;
wire   [5:0] grp_fu_413_p2;
reg    grp_fu_413_ce;
wire    ap_CS_fsm_state12;
wire    regslice_both_data_OUT_U_apdone_blk;
reg   [5:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
wire    regslice_both_data_IN_U_apdone_blk;
wire   [31:0] data_IN_TDATA_int_regslice;
wire    data_IN_TVALID_int_regslice;
reg    data_IN_TREADY_int_regslice;
wire    regslice_both_data_IN_U_ack_in;
wire   [31:0] data_OUT_TDATA_int_regslice;
reg    data_OUT_TVALID_int_regslice;
wire    data_OUT_TREADY_int_regslice;
wire    regslice_both_data_OUT_U_vld_out;
wire   [13:0] grp_fu_413_p00;
wire   [13:0] grp_fu_413_p20;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter4 = 1'b0;
#0 ap_enable_reg_pp1_iter5 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
#0 ap_enable_reg_pp1_iter2 = 1'b0;
#0 ap_enable_reg_pp1_iter3 = 1'b0;
#0 grp_matmul_fu_237_ap_start_reg = 1'b0;
end

top_mat_A_M_real_V #(
    .DataWidth( 16 ),
    .AddressRange( 12520 ),
    .AddressWidth( 14 ))
mat_A_M_real_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(mat_A_M_real_V_address0),
    .ce0(mat_A_M_real_V_ce0),
    .we0(mat_A_M_real_V_we0),
    .d0(trunc_ln7_reg_443),
    .q0(mat_A_M_real_V_q0)
);

top_mat_A_M_real_V #(
    .DataWidth( 16 ),
    .AddressRange( 12520 ),
    .AddressWidth( 14 ))
mat_A_M_imag_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(mat_A_M_imag_V_address0),
    .ce0(mat_A_M_imag_V_ce0),
    .we0(mat_A_M_imag_V_we0),
    .d0(trunc_ln7_1_reg_448),
    .q0(mat_A_M_imag_V_q0)
);

top_mat_C_0 #(
    .DataWidth( 16 ),
    .AddressRange( 12207 ),
    .AddressWidth( 14 ))
mat_C_0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(mat_C_0_address0),
    .ce0(mat_C_0_ce0),
    .we0(mat_C_0_we0),
    .d0(grp_matmul_fu_237_out_M_real_d0),
    .q0(mat_C_0_q0)
);

top_mat_C_0 #(
    .DataWidth( 16 ),
    .AddressRange( 12207 ),
    .AddressWidth( 14 ))
mat_C_1_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .address0(mat_C_1_address0),
    .ce0(mat_C_1_ce0),
    .we0(mat_C_1_we0),
    .d0(grp_matmul_fu_237_out_M_imag_d0),
    .q0(mat_C_1_q0)
);

top_matmul grp_matmul_fu_237(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_matmul_fu_237_ap_start),
    .ap_done(grp_matmul_fu_237_ap_done),
    .ap_idle(grp_matmul_fu_237_ap_idle),
    .ap_ready(grp_matmul_fu_237_ap_ready),
    .a_M_real_address0(grp_matmul_fu_237_a_M_real_address0),
    .a_M_real_ce0(grp_matmul_fu_237_a_M_real_ce0),
    .a_M_real_q0(mat_A_M_real_V_q0),
    .a_M_imag_address0(grp_matmul_fu_237_a_M_imag_address0),
    .a_M_imag_ce0(grp_matmul_fu_237_a_M_imag_ce0),
    .a_M_imag_q0(mat_A_M_imag_V_q0),
    .out_M_real_address0(grp_matmul_fu_237_out_M_real_address0),
    .out_M_real_ce0(grp_matmul_fu_237_out_M_real_ce0),
    .out_M_real_we0(grp_matmul_fu_237_out_M_real_we0),
    .out_M_real_d0(grp_matmul_fu_237_out_M_real_d0),
    .out_M_imag_address0(grp_matmul_fu_237_out_M_imag_address0),
    .out_M_imag_ce0(grp_matmul_fu_237_out_M_imag_ce0),
    .out_M_imag_we0(grp_matmul_fu_237_out_M_imag_we0),
    .out_M_imag_d0(grp_matmul_fu_237_out_M_imag_d0)
);

top_mac_muladd_9ns_7ns_6ns_14_4_1 #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 9 ),
    .din1_WIDTH( 7 ),
    .din2_WIDTH( 6 ),
    .dout_WIDTH( 14 ))
mac_muladd_9ns_7ns_6ns_14_4_1_U13(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .din0(grp_fu_413_p0),
    .din1(grp_fu_413_p1),
    .din2(grp_fu_413_p2),
    .ce(grp_fu_413_ce),
    .dout(grp_fu_413_p3)
);

top_regslice_both #(
    .DataWidth( 32 ))
regslice_both_data_IN_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(data_IN_TDATA),
    .vld_in(data_IN_TVALID),
    .ack_in(regslice_both_data_IN_U_ack_in),
    .data_out(data_IN_TDATA_int_regslice),
    .vld_out(data_IN_TVALID_int_regslice),
    .ack_out(data_IN_TREADY_int_regslice),
    .apdone_blk(regslice_both_data_IN_U_apdone_blk)
);

top_regslice_both #(
    .DataWidth( 32 ))
regslice_both_data_OUT_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(data_OUT_TDATA_int_regslice),
    .vld_in(data_OUT_TVALID_int_regslice),
    .ack_in(data_OUT_TREADY_int_regslice),
    .data_out(data_OUT_TDATA),
    .vld_out(regslice_both_data_OUT_U_vld_out),
    .ack_out(data_OUT_TREADY),
    .apdone_blk(regslice_both_data_OUT_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_condition_pp1_exit_iter0_state6) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state5) & (grp_matmul_fu_237_ap_done == 1'b1))) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp1_exit_iter0_state6)) begin
                ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state6);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter2 <= ap_enable_reg_pp1_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter3 <= ap_enable_reg_pp1_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter4 <= ap_enable_reg_pp1_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_enable_reg_pp1_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter5 <= ap_enable_reg_pp1_iter4;
        end else if (((1'b1 == ap_CS_fsm_state5) & (grp_matmul_fu_237_ap_done == 1'b1))) begin
            ap_enable_reg_pp1_iter5 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_matmul_fu_237_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_matmul_fu_237_ap_start_reg <= 1'b1;
        end else if ((grp_matmul_fu_237_ap_ready == 1'b1)) begin
            grp_matmul_fu_237_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln13_reg_463 == 1'd0) & (1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        i_1_reg_215 <= select_ln13_1_reg_472;
    end else if (((1'b1 == ap_CS_fsm_state5) & (grp_matmul_fu_237_ap_done == 1'b1))) begin
        i_1_reg_215 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4_reg_427 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        i_reg_182 <= select_ln4_1_reg_436;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        i_reg_182 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (icmp_ln13_fu_352_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        indvar_flatten7_reg_204 <= add_ln13_1_fu_346_p2;
    end else if (((1'b1 == ap_CS_fsm_state5) & (grp_matmul_fu_237_ap_done == 1'b1))) begin
        indvar_flatten7_reg_204 <= 14'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4_fu_253_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_171 <= add_ln4_1_fu_247_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        indvar_flatten_reg_171 <= 14'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (icmp_ln13_fu_352_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        j_1_reg_226 <= add_ln14_fu_390_p2;
    end else if (((1'b1 == ap_CS_fsm_state5) & (grp_matmul_fu_237_ap_done == 1'b1))) begin
        j_1_reg_226 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4_fu_253_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        j_reg_193 <= add_ln5_fu_301_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        j_reg_193 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        icmp_ln13_reg_463 <= icmp_ln13_fu_352_p2;
        icmp_ln13_reg_463_pp1_iter1_reg <= icmp_ln13_reg_463;
        select_ln13_reg_467_pp1_iter1_reg <= select_ln13_reg_467;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp1_stage0_11001)) begin
        icmp_ln13_reg_463_pp1_iter2_reg <= icmp_ln13_reg_463_pp1_iter1_reg;
        icmp_ln13_reg_463_pp1_iter3_reg <= icmp_ln13_reg_463_pp1_iter2_reg;
        icmp_ln13_reg_463_pp1_iter4_reg <= icmp_ln13_reg_463_pp1_iter3_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln4_reg_427 <= icmp_ln4_fu_253_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (icmp_ln13_fu_352_p2 == 1'd0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        select_ln13_1_reg_472 <= select_ln13_1_fu_378_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (icmp_ln13_fu_352_p2 == 1'd0))) begin
        select_ln13_reg_467 <= select_ln13_fu_370_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4_fu_253_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln4_1_reg_436 <= select_ln4_1_fu_279_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln4_fu_253_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        select_ln4_reg_431 <= select_ln4_fu_271_p3;
        trunc_ln7_1_reg_448 <= {{data_IN_TDATA_int_regslice[31:16]}};
        trunc_ln7_reg_443 <= trunc_ln7_fu_287_p1;
    end
end

always @ (*) begin
    if ((icmp_ln4_fu_253_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln13_fu_352_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state6 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state6 = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_data_OUT_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state12))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter5 == 1'b0) & (ap_enable_reg_pp1_iter4 == 1'b0) & (ap_enable_reg_pp1_iter3 == 1'b0) & (ap_enable_reg_pp1_iter2 == 1'b0) & (ap_enable_reg_pp1_iter1 == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln13_reg_463 == 1'd0) & (1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        ap_phi_mux_i_1_phi_fu_219_p4 = select_ln13_1_reg_472;
    end else begin
        ap_phi_mux_i_1_phi_fu_219_p4 = i_1_reg_215;
    end
end

always @ (*) begin
    if (((icmp_ln4_reg_427 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        ap_phi_mux_i_phi_fu_186_p4 = select_ln4_1_reg_436;
    end else begin
        ap_phi_mux_i_phi_fu_186_p4 = i_reg_182;
    end
end

always @ (*) begin
    if (((regslice_both_data_OUT_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state12))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln4_fu_253_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_IN_TDATA_blk_n = data_IN_TVALID_int_regslice;
    end else begin
        data_IN_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln4_fu_253_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        data_IN_TREADY_int_regslice = 1'b1;
    end else begin
        data_IN_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln13_reg_463_pp1_iter4_reg == 1'd0) & (ap_enable_reg_pp1_iter5 == 1'b1) & (1'b0 == ap_block_pp1_stage0)) | ((icmp_ln13_reg_463_pp1_iter3_reg == 1'd0) & (ap_enable_reg_pp1_iter4 == 1'b1) & (1'b0 == ap_block_pp1_stage0)))) begin
        data_OUT_TDATA_blk_n = data_OUT_TREADY_int_regslice;
    end else begin
        data_OUT_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln13_reg_463_pp1_iter3_reg == 1'd0) & (ap_enable_reg_pp1_iter4 == 1'b1) & (1'b0 == ap_block_pp1_stage0_11001))) begin
        data_OUT_TVALID_int_regslice = 1'b1;
    end else begin
        data_OUT_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        grp_fu_413_ce = 1'b1;
    end else begin
        grp_fu_413_ce = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        mat_A_M_imag_V_address0 = zext_ln7_2_fu_340_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_A_M_imag_V_address0 = grp_matmul_fu_237_a_M_imag_address0;
    end else begin
        mat_A_M_imag_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        mat_A_M_imag_V_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_A_M_imag_V_ce0 = grp_matmul_fu_237_a_M_imag_ce0;
    end else begin
        mat_A_M_imag_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln4_reg_427 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        mat_A_M_imag_V_we0 = 1'b1;
    end else begin
        mat_A_M_imag_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        mat_A_M_real_V_address0 = zext_ln7_2_fu_340_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_A_M_real_V_address0 = grp_matmul_fu_237_a_M_real_address0;
    end else begin
        mat_A_M_real_V_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        mat_A_M_real_V_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_A_M_real_V_ce0 = grp_matmul_fu_237_a_M_real_ce0;
    end else begin
        mat_A_M_real_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln4_reg_427 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        mat_A_M_real_V_we0 = 1'b1;
    end else begin
        mat_A_M_real_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter3 == 1'b1))) begin
        mat_C_0_address0 = zext_ln16_1_fu_399_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_C_0_address0 = grp_matmul_fu_237_out_M_real_address0;
    end else begin
        mat_C_0_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter3 == 1'b1))) begin
        mat_C_0_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_C_0_ce0 = grp_matmul_fu_237_out_M_real_ce0;
    end else begin
        mat_C_0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_C_0_we0 = grp_matmul_fu_237_out_M_real_we0;
    end else begin
        mat_C_0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter3 == 1'b1))) begin
        mat_C_1_address0 = zext_ln16_1_fu_399_p1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_C_1_address0 = grp_matmul_fu_237_out_M_imag_address0;
    end else begin
        mat_C_1_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter3 == 1'b1))) begin
        mat_C_1_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_C_1_ce0 = grp_matmul_fu_237_out_M_imag_ce0;
    end else begin
        mat_C_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        mat_C_1_we0 = grp_matmul_fu_237_out_M_imag_we0;
    end else begin
        mat_C_1_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((icmp_ln4_fu_253_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((icmp_ln4_fu_253_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (grp_matmul_fu_237_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_pp1_stage0 : begin
            if ((~((1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter1 == 1'b0) & (icmp_ln13_fu_352_p2 == 1'd1) & (ap_enable_reg_pp1_iter0 == 1'b1)) & ~((ap_enable_reg_pp1_iter5 == 1'b1) & (ap_enable_reg_pp1_iter4 == 1'b0) & (1'b0 == ap_block_pp1_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if ((((ap_enable_reg_pp1_iter5 == 1'b1) & (ap_enable_reg_pp1_iter4 == 1'b0) & (1'b0 == ap_block_pp1_stage0_subdone)) | ((1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter1 == 1'b0) & (icmp_ln13_fu_352_p2 == 1'd1) & (ap_enable_reg_pp1_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state12 : begin
            if (((regslice_both_data_OUT_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state12))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln13_1_fu_346_p2 = (indvar_flatten7_reg_204 + 14'd1);

assign add_ln13_fu_358_p2 = (ap_phi_mux_i_1_phi_fu_219_p4 + 9'd1);

assign add_ln14_fu_390_p2 = (select_ln13_fu_370_p3 + 6'd1);

assign add_ln4_1_fu_247_p2 = (indvar_flatten_reg_171 + 14'd1);

assign add_ln4_fu_259_p2 = (ap_phi_mux_i_phi_fu_186_p4 + 9'd1);

assign add_ln5_fu_301_p2 = (select_ln4_fu_271_p3 + 6'd1);

assign add_ln7_1_fu_334_p2 = (add_ln7_fu_325_p2 + zext_ln7_1_fu_331_p1);

assign add_ln7_fu_325_p2 = (tmp_1_fu_307_p3 + zext_ln7_fu_321_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((data_IN_TVALID_int_regslice == 1'b0) & (icmp_ln4_fu_253_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((data_IN_TVALID_int_regslice == 1'b0) & (icmp_ln4_fu_253_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp1_stage0_01001 = (((icmp_ln13_reg_463_pp1_iter4_reg == 1'd0) & (ap_enable_reg_pp1_iter5 == 1'b1) & (data_OUT_TREADY_int_regslice == 1'b0)) | ((icmp_ln13_reg_463_pp1_iter3_reg == 1'd0) & (ap_enable_reg_pp1_iter4 == 1'b1) & (data_OUT_TREADY_int_regslice == 1'b0)));
end

always @ (*) begin
    ap_block_pp1_stage0_11001 = (((ap_enable_reg_pp1_iter5 == 1'b1) & ((1'b1 == ap_block_state11_io) | ((icmp_ln13_reg_463_pp1_iter4_reg == 1'd0) & (data_OUT_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp1_iter4 == 1'b1) & ((1'b1 == ap_block_state10_io) | ((icmp_ln13_reg_463_pp1_iter3_reg == 1'd0) & (data_OUT_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_pp1_stage0_subdone = (((ap_enable_reg_pp1_iter5 == 1'b1) & ((1'b1 == ap_block_state11_io) | ((icmp_ln13_reg_463_pp1_iter4_reg == 1'd0) & (data_OUT_TREADY_int_regslice == 1'b0)))) | ((ap_enable_reg_pp1_iter4 == 1'b1) & ((1'b1 == ap_block_state10_io) | ((icmp_ln13_reg_463_pp1_iter3_reg == 1'd0) & (data_OUT_TREADY_int_regslice == 1'b0)))));
end

always @ (*) begin
    ap_block_state10_io = ((icmp_ln13_reg_463_pp1_iter3_reg == 1'd0) & (data_OUT_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state10_pp1_stage0_iter4 = ((icmp_ln13_reg_463_pp1_iter3_reg == 1'd0) & (data_OUT_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state11_io = ((icmp_ln13_reg_463_pp1_iter4_reg == 1'd0) & (data_OUT_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state11_pp1_stage0_iter5 = ((icmp_ln13_reg_463_pp1_iter4_reg == 1'd0) & (data_OUT_TREADY_int_regslice == 1'b0));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter0 = ((data_IN_TVALID_int_regslice == 1'b0) & (icmp_ln4_fu_253_p2 == 1'd0));
end

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp1_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp1_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp1_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign data_IN_TREADY = regslice_both_data_IN_U_ack_in;

assign data_OUT_TDATA_int_regslice = {{mat_C_1_q0}, {mat_C_0_q0}};

assign data_OUT_TVALID = regslice_both_data_OUT_U_vld_out;

assign grp_fu_413_p0 = grp_fu_413_p00;

assign grp_fu_413_p00 = select_ln13_1_fu_378_p3;

assign grp_fu_413_p1 = 14'd39;

assign grp_fu_413_p2 = grp_fu_413_p20;

assign grp_fu_413_p20 = select_ln13_reg_467_pp1_iter1_reg;

assign grp_matmul_fu_237_ap_start = grp_matmul_fu_237_ap_start_reg;

assign icmp_ln13_fu_352_p2 = ((indvar_flatten7_reg_204 == 14'd12207) ? 1'b1 : 1'b0);

assign icmp_ln14_fu_364_p2 = ((j_1_reg_226 == 6'd39) ? 1'b1 : 1'b0);

assign icmp_ln4_fu_253_p2 = ((indvar_flatten_reg_171 == 14'd12520) ? 1'b1 : 1'b0);

assign icmp_ln5_fu_265_p2 = ((j_reg_193 == 6'd40) ? 1'b1 : 1'b0);

assign select_ln13_1_fu_378_p3 = ((icmp_ln14_fu_364_p2[0:0] == 1'b1) ? add_ln13_fu_358_p2 : ap_phi_mux_i_1_phi_fu_219_p4);

assign select_ln13_fu_370_p3 = ((icmp_ln14_fu_364_p2[0:0] == 1'b1) ? 6'd0 : j_1_reg_226);

assign select_ln4_1_fu_279_p3 = ((icmp_ln5_fu_265_p2[0:0] == 1'b1) ? add_ln4_fu_259_p2 : ap_phi_mux_i_phi_fu_186_p4);

assign select_ln4_fu_271_p3 = ((icmp_ln5_fu_265_p2[0:0] == 1'b1) ? 6'd0 : j_reg_193);

assign tmp_1_fu_307_p3 = {{select_ln4_1_reg_436}, {5'd0}};

assign tmp_2_fu_314_p3 = {{select_ln4_1_reg_436}, {3'd0}};

assign trunc_ln7_fu_287_p1 = data_IN_TDATA_int_regslice[15:0];

assign zext_ln16_1_fu_399_p1 = grp_fu_413_p3;

assign zext_ln7_1_fu_331_p1 = select_ln4_reg_431;

assign zext_ln7_2_fu_340_p1 = add_ln7_1_fu_334_p2;

assign zext_ln7_fu_321_p1 = tmp_2_fu_314_p3;

endmodule //top
