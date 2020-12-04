`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:24:31 PM
// Design Name: 
// Module Name: vsync
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


module vsync_counter(
input clk_25Hz,
input enable_v_counter ,
output reg [15:0]v_count = 0
);

always@(posedge clk_25Hz)
    begin
    if(enable_v_counter == 1'b1)
        begin
            if(v_count < 524  )
                begin
                    v_count <= v_count + 1;
                end
            else
                begin
                    v_count <= 0;
                end
        end
    end



endmodule
