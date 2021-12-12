`timescale 1ns / 1ps

module addressGenerator(
    input clk,
    output [13:0] addData,
    output [5:0] addHamming
    );
    
    parameter ROWS_ADD_LEN = 6;
    parameter COLUMNS_ADD_LEN = 9;
    parameter DATA_ADD_LEN = 14;
    parameter ROWS = 40;
    parameter COLUMNS = 313;
    
    reg [ROWS_ADD_LEN-1:0]row = 63;
    reg [COLUMNS_ADD_LEN-1:0]column = 0;
     
    always@(posedge clk)
    begin
        if(row == (ROWS-1))
        begin
            column <= column + 1;
            row <= 0;
        end
        else
            row <= row + 1;
         
    end
    
    assign addHamming = row;
    assign addData = column + row*COLUMNS ; 
    
endmodule
