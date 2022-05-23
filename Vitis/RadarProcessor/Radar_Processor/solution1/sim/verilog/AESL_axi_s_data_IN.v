// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps

`define TV_IN_data_IN_TDATA "../tv/cdatafile/c.top.autotvin_data_IN.dat"

`define AUTOTB_TRANSACTION_NUM 1

module AESL_axi_s_data_IN (
    input clk,
    input reset,
    output [32 - 1:0] TRAN_data_IN_TDATA,
    output TRAN_data_IN_TVALID,
    input TRAN_data_IN_TREADY,
    input ready,
    input done,
    output [31:0] transaction);

    wire TRAN_data_IN_TVALID_temp;
    wire data_IN_TDATA_full;
    wire data_IN_TDATA_empty;
    reg data_IN_TDATA_write_en;
    reg [32 - 1:0] data_IN_TDATA_write_data;
    reg data_IN_TDATA_read_en;
    wire [32 - 1:0] data_IN_TDATA_read_data;
    
    fifo #(25040, 32) fifo_data_IN_TDATA (
        .reset(1'b0),
        .write_clock(clk),
        .write_en(data_IN_TDATA_write_en),
        .write_data(data_IN_TDATA_write_data),
        .read_clock(clk),
        .read_en(data_IN_TDATA_read_en),
        .read_data(data_IN_TDATA_read_data),
        .full(data_IN_TDATA_full),
        .empty(data_IN_TDATA_empty));
    
    always @ (*) begin
        data_IN_TDATA_write_en <= 0;
        data_IN_TDATA_read_en <= TRAN_data_IN_TREADY & TRAN_data_IN_TVALID;
    end
    
    assign TRAN_data_IN_TDATA = data_IN_TDATA_read_data;
    assign TRAN_data_IN_TVALID = TRAN_data_IN_TVALID_temp;

    
    assign TRAN_data_IN_TVALID_temp = ~(data_IN_TDATA_empty);
    
    function is_blank_char(input [7:0] in_char);
        if (in_char == " " || in_char == "\011" || in_char == "\012" || in_char == "\015") begin
            is_blank_char = 1;
        end else begin
            is_blank_char = 0;
        end
    endfunction
    
    function [143:0] read_token(input integer fp);
        integer ret;
        begin
            read_token = "";
                    ret = 0;
                    ret = $fscanf(fp,"%s",read_token);
        end
    endfunction
    
    function [143:0] rm_0x(input [143:0] token);
        reg [143:0] token_tmp;
        integer i;
        begin
            token_tmp = "";
            for (i = 0; token[15:0] != "0x"; token = token >> 8) begin
                token_tmp = (token[7:0] << (8 * i)) | token_tmp;
                i = i + 1;
            end
            rm_0x = token_tmp;
        end
    endfunction
    
    reg [31:0] transaction_load_data_IN_TDATA;
    
    assign transaction = transaction_load_data_IN_TDATA;
    
    initial begin : AXI_stream_driver_data_IN_TDATA
        integer fp;
        reg [143:0] token;
        reg [32 - 1:0] data;
        reg [143:0] data_integer;
        reg [8 * 5:1] str;
        integer ret;
        
        transaction_load_data_IN_TDATA = 0;
        fifo_data_IN_TDATA.clear();
        wait (reset === 1);
        fp = $fopen(`TV_IN_data_IN_TDATA, "r");
        if (fp == 0) begin
            $display("ERROR: Failed to open file \"%s\"!", `TV_IN_data_IN_TDATA);
            $finish;
        end
        token = read_token(fp);
        if (token != "[[[runtime]]]") begin
            $display("ERROR: token %s != [[[runtime]]]", token);
            $finish;
        end
        token = read_token(fp); // read 1st "[[transaction]]"
        forever begin
            @ (negedge clk);
            if (ready == 1) begin
                if (token != "[[[/runtime]]]") begin
                    if (token != "[[transaction]]") begin
                        $display("ERROR: token %s != [[[transaction]]]", token);
                        $finish;
                    end
                    token = read_token(fp); // skip transaction number
                    fifo_data_IN_TDATA.clear();
                    token = read_token(fp);
                    while (token != "[[/transaction]]") begin
                        if (fifo_data_IN_TDATA.full) begin
                            $display("ERROR: FIFO is full");
                            $finish;
                        end
                        ret = $sscanf(rm_0x(token), "%x", data_integer);
                        data = data_integer;
                        fifo_data_IN_TDATA.push(data);
                        token = read_token(fp);
                    end
                    token = read_token(fp);
                    fifo_data_IN_TDATA.snapshot();
                end else begin
                    fifo_data_IN_TDATA.restore();
                    if (fp != 0) begin
                        $fclose(fp);
                        fp = 0;
                    end
                end
                transaction_load_data_IN_TDATA = transaction_load_data_IN_TDATA + 1;
            end
        end
    end

endmodule
