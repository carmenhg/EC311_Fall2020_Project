`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 04:41:26 PM
// Design Name: 
// Module Name: fast_morse
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



module fast_morse (clk, LED);

input clk;
output LED;

reg [31:0] counter;
reg LED_status;

initial begin
counter <= 32'b0;
LED_status <= 1'b0;
end

always @ (posedge clk) 
begin
counter <= counter + 1'b1;
if (counter > 50000000)
begin
LED_status <= !LED_status;
counter <= 32'b0;
end

    
end

assign LED = LED_status;

endmodule 
