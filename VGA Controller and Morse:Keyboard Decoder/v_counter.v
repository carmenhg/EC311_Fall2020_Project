`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 10:50:54 AM
// Design Name: 
// Module Name: v_counter
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


module v_counter(
    input clk_25,
    input enable_v_counter,
    output reg [15:0] v_count_value = 0
    );
    
    always @ (posedge clk_25)
    begin
        if(enable_v_counter == 1'b1)
            begin
                if (v_count_value < 524 ) 
                begin
                    v_count_value <= v_count_value + 1;
                end
                else 
                begin
                    v_count_value <= 0;
                end
            end
    end
endmodule
