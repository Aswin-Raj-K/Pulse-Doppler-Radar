   
`timescale 1ns / 1ps
module combiner(
input clk,
output reg [31:0]dataOut,
input [15:0]realData,
input [15:0]imgData);
    
   always@(posedge clk)
   begin
    dataOut[15:0]<=imgData;
    dataOut[31:16]<=realData;
   end
endmodule
