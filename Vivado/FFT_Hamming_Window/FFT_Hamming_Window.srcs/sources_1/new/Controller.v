`timescale 1ns / 1ps
module Controller#(
  parameter window_length = 32,
  parameter window_data_width = 16,
  parameter window_address_width = 6,
  parameter data_length = 32,
  parameter data_address_width = 14,
  parameter data_width = 32,
  parameter data_matrix_fast_time_samples = 40,
  parameter data_matrix_slow_time_samples = 313
  )(
  //Basic
  input nreset,
  input aclk,
  
  //BRAM interface
  input signed [window_data_width - 1 : 0]hamming_data,
  output [window_address_width - 1 : 0]hamming_addr,
  input [data_width-1:0]data,
  output [data_address_width-1:0]data_addr,
  
  //FFT slave interface
  input s_axis_tready,
  output reg s_axis_tvalid, s_axis_tlast,
  output [data_width-1:0]s_axis_tdata
  );
    
  reg [window_address_width-1:0]hamming_addr_counter = 0;
  reg [data_address_width-1:0]data_addr_counter = 0;
  reg [8:0]row = 0;
  
  //For introducing delay
  reg tlast = 0;
  reg tvalid = 0;
  
 //Sequential Logic: Address generation  
 always@(posedge aclk)
    if(~nreset || ~s_axis_tready)
    begin
        data_addr_counter <= 0;
        hamming_addr_counter <= 0;
        s_axis_tvalid <= 0;
        s_axis_tlast <=0;
        tlast = 0;
        row <= 0;
        tvalid <= 0;
    end
   else if(s_axis_tready)
   begin
        tvalid <= 1;
        s_axis_tvalid <= tvalid;
        if(data_addr_counter == row*40 + data_length - 1)
        begin
            data_addr_counter <= (row+1)*40;
            row <= row+1;
            hamming_addr_counter <= 0;
            s_axis_tlast <= tlast;
            tlast <= 1;
        end
        else
        begin
            s_axis_tlast <= tlast;
            tlast <= 0;
            data_addr_counter <= data_addr_counter+1;
            hamming_addr_counter <= hamming_addr_counter+1;
        end
   end
   
   //Combinational Logic : Multiply and Round
   assign hamming_addr = hamming_addr_counter;
   assign data_addr = data_addr_counter;
   
   wire signed [31:0]AxB_real;
   wire signed [31:0]AxB_img;
   //splitting to real and imag
   wire signed [15:0]data_real = data[15:0];
   wire signed [15:0]data_img = data[31:16];
   
   assign AxB_real = data_real * hamming_data; //multiplication
   assign AxB_img = data_img * hamming_data; //multiplication
   
   //rounding and joining
   assign s_axis_tdata[15:0] = (AxB_real >> 8) + ((AxB_real >> 7) & 1);
   assign s_axis_tdata[31:16] = (AxB_img >> 8) + ((AxB_img >> 7) & 1);
   
  endmodule
  
