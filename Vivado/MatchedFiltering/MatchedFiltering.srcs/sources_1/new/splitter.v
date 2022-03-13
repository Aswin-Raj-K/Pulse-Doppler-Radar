`timescale 1ns / 1ps

module splitter(
   input [31:0] tdata,
   output [15:0] dataImag,
   output [15:0] dataReal);
    
   assign dataImag = tdata[15:0];
   assign dataReal = tdata[31:16];
endmodule
