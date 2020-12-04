`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 01:44:04 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
input  wire clk,  
output reg clk_25Hz 
);

localparam div_value = 1;

integer counter_value = 0; 

always@(posedge clk)
    begin
        if(counter_value == div_value)
            counter_value <= 0;
        else
            counter_value <= counter_value + 1;
    end
    
    
 always@(posedge clk)
    begin
        if(counter_value == div_value)
            clk_25Hz <= ~clk_25Hz;
        else
            clk_25Hz <= clk_25Hz;
    end

endmodule
