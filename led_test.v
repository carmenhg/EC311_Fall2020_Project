`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 05:39:34 PM
// Design Name: 
// Module Name: led_test
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


module led_test(  
    input CLOCK, SW,reset,  
    output reg LED  
    );  
    reg [24:0] COUNT;  
    always @(posedge CLOCK) begin  
      if ( reset ==1'b1)
        begin  
            LED <= 1'b0;
            COUNT <= 0;
        end
      else  
        begin  
            COUNT <= COUNT + 1;  
            LED <= SW & ((COUNT == 25'b0)?~LED:LED);  
        end  
      end  
endmodule  
