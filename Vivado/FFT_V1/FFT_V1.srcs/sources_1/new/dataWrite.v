`timescale 1ns / 1ps

module dataWrite(
input clk,
input tvalid,
input tlast,
input [31:0]data);
parameter infile = "processed_hex.mem";
reg [31:0] mem[0:31];
reg flag=0;
reg [4:0]counter=0;

always@(posedge tvalid)
begin
    if(!flag & counter==0)
        flag = 1;       
end

integer i;
always@(negedge tlast)
begin
    if(flag)
    begin
        flag = 0;
        for (i=0; i < 32; i=i+1) begin 
            $display("%h",mem[i]); 
        end     
    end
end

always@(negedge clk)
begin
if(flag)
    begin
    mem[counter] = data;
    counter=counter+1;
    end
end



endmodule
