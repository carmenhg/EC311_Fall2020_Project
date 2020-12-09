`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 10:50:38 AM
// Design Name: 
// Module Name: h_counter
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


module h_counter(
    input clk_25,
    output reg enable_v_counter = 0,
    output reg [15:0] h_count_value = 0
    );
    
    always @ (posedge clk_25)
    begin
        if (h_count_value < 799) 
        begin
            h_count_value <= h_count_value + 1;
            enable_v_counter <= 0;
        end
        else 
        begin
            h_count_value <= 0;
            enable_v_counter <= 1;
        end
    end
endmodule
