`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2020 01:56:28 PM
// Design Name: 
// Module Name: A_enable_digit
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

module A_enable_digit(
input         refreshcounter, 
output        enable_D1, //right-most digit
output        enable_D2, 
output        enable_D3, 
output        enable_D4,  
output        enable_D5, 
output        enable_D6, 
output        enable_D7, 
output        enable_D8 //left-most digit
);

//assign the pattern to 0111 so that only right most digit is ON
reg [7:0] pattern = 8'b01111111; 

assign enable_D1 = pattern[7]; // turn on the right-most display
assign enable_D2 = pattern[6]; // off
assign enable_D3 = pattern[5]; // off
assign enable_D4 = pattern[4]; // off
assign enable_D5 = pattern[3]; // off
assign enable_D6 = pattern[2]; // off
assign enable_D7 = pattern[1]; // off
assign enable_D8 = pattern[0]; // off

always @(posedge refreshcounter) begin
  pattern <= {pattern[0],pattern[7:1]}; //shift the vector to enable each digit
end

endmodule
