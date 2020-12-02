`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 04:41:51 PM
// Design Name: 
// Module Name: input_morse
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


module input_morse(
    input clk,
    input slow_button,
    input fast_button,
    output reg LED
    );
    
    wire slow_LED;
    wire fast_LED;
    
    slow_morse (clk, slow_LED);
    fast_morse (clk, fast_LED);
    
    
    
    reg slow_button_ff; //button to save alarm values
    reg slow_button_signal; 
    
    always @ (posedge clk) 
        begin
            slow_button_ff <= slow_button; 
            if (slow_button_ff && !slow_button) 
                slow_button_signal <=1; 
            else
                slow_button_signal <=0; 
        end
    
    
    reg fast_button_ff; //button to save alarm values
    reg fast_button_signal; 
    
    always @ (posedge clk) 
        begin
            fast_button_ff <= fast_button; 
            if (fast_button_ff && !fast_button) 
                fast_button_signal <=1; 
            else
                fast_button_signal <=0; 
        end
        
    
    
    always@(posedge clk)
        begin
           if (slow_button_signal ==1) //if both start/stop & reset pressed 
            begin 
                LED = slow_LED;
            end
            
            if (fast_button_signal ==1) //if both start/stop & reset pressed 
            begin 
                LED = fast_LED;
            end
        end
    
    
endmodule
