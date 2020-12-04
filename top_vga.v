`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:24:49 PM
// Design Name: 
// Module Name: top_vga
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


module top_vga(
    input clk, 
    output [3:0]red, 
    output [3:0]green, 
    output [3:0]blue, 
    output vsync,
    output hsync);

wire clk_25Hz;
wire enable_v_counter;
wire [15:0]h_count;
wire [15:0]v_count;

//divide the clk
clock_divider vga_clock(.clk(clk), .clk_25Hz(clk_25Hz));

//Horizontal and Vertical counters
hsync_counter vga_h_counter(.clk_25Hz(clk_25Hz), .enable_v_counter(enable_v_counter), .h_count(h_count));
vsync_counter vga_v_counter(.clk_25Hz(clk_25Hz), .enable_v_counter(enable_v_counter), .v_count(v_count));

//Outputs and colors 
assign hsync = (h_count < 96) ? 1'b1 : 1'b0;
assign vsync = (v_count < 2) ? 1'b1 : 1'b0;

assign red = (h_count < 784 && h_count > 143 && v_count < 515 && v_count > 34) ? 4'hF:4'h0;
assign green = (h_count < 784 && h_count > 143 && v_count < 515 && v_count > 34) ? 4'hF:4'h0;
assign blue = (h_count < 784 && h_count > 143 && v_count < 515 && v_count > 34) ? 4'hF:4'h0;
 
endmodule