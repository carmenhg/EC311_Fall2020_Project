`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:24:10 PM
// Design Name: 
// Module Name: hsync
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


module hsync_counter(
input clk_25Hz,
output reg enable_v_counter = 0,
output reg [15:0]h_count = 0);

always@(posedge clk_25Hz)
    begin
        if(h_count < 799)
            begin
                h_count <= h_count + 1;
                enable_v_counter <= 0;
            end
        else
            begin
                h_count <= 0;
                enable_v_counter <= 1;
            end
    end





endmodule
