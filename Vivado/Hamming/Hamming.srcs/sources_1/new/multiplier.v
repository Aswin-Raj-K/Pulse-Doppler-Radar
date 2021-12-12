`timescale 1ns / 1ps
module multiplier(
input clk,
input [15:0]dataIn1,
input [31:0]dataIn2,
output reg [31:0]dataOut
    );
    
   always@(posedge clk)
   begin
   
   dataOut[15:0]<=dataIn2[15:0]*dataIn2;
   dataOut[31:16]<=dataIn2[31:16]*dataIn2;
   
   end
endmodule
