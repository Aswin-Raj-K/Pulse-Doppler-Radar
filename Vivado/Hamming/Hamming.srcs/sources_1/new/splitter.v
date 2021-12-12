`timescale 1ns / 1ps
module splitter(
input clk,
input [31:0]dataIn,
output [15:0]realData,
output [15:0]imgData);

   assign realData =  dataIn[15:0];
   assign imgData = dataIn[31:16];
endmodule
