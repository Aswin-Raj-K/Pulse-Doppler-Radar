`timescale 1ns / 1ps

module fixedPointMultiplier(
 input signed [15:0]data1,
 input signed [15:0]data2,
 output [15:0]dataOut,
 input clk
 );
 
 reg signed [31:0]AxB;

 always@(posedge clk)
 begin
    AxB <= data1*data2;
 end
 
 assign dataOut = (AxB >> 8) + ((AxB >> 7) & 1);
// assign dataOut <= AxB;
endmodule
