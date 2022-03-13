`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.02.2022 20:02:13
// Design Name: 
// Module Name: and
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AND(
input tready1,
input tready2,
input tready3,
input tready4,
output tready
    );
    
    assign tready = tready1 | tready2 | tready3 | tready4;
     
endmodule
