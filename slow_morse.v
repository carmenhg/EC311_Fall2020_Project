`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 04:41:11 PM
// Design Name: 
// Module Name: slow_morse
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



module slow_morse(  
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
