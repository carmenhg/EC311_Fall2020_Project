`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 05:40:21 PM
// Design Name: 
// Module Name: text_test
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

module text_test(
    input clk,
    input switch1,
    input switch2,
    input switch3,
    output [6:0] segment, 
    output enable_D1,//right-most digit
    output enable_D2,
    output enable_D3,
    output enable_D4,
    output enable_D5,
    output enable_D6,
    output enable_D7,
    output enable_D8, //left-most digit
    output dp //decimal point
    );
    
    wire clk_point1hz; //counter clock 
    wire clock_25Hz; //refresh the display
    wire refreshclock; //refresh the display
    reg [17:0] hex; //hexadecimal number
    wire [17:0] reg_d0; //count for right-most digit
    wire [17:0] reg_d1; 
    wire [17:0] reg_d2; 
    wire [17:0] reg_d3; 
    wire [17:0] reg_d4; 
    wire [17:0] reg_d5;
    wire [17:0] reg_d6; 
    wire [17:0] reg_d7; //count for left-most digit
    
    clock_divider A(.clk(clk), .clk_25Hz(clock_25Hz));
    
    refresh_clock B(.clk(clk), .refreshClk(refreshclock), .clk_point1hz(clk_point1hz));

    //instantiate enable_digit
    A_enable_digit Uenable(
    .refreshcounter(refreshclock),
    .enable_D1(enable_D1),
    .enable_D2(enable_D2),
    .enable_D3(enable_D3),
    .enable_D4(enable_D4),
    .enable_D5(enable_D5),
    .enable_D6(enable_D6),
    .enable_D7(enable_D7),
    .enable_D8(enable_D8)
    );
    
    //instantiate the counter
    text_logic Ucounter(
    .divided_clk(clock_25Hz),
    .switch1(switch1),
    .switch2(switch2),
    .switch3(switch3),
    .reg_d0(reg_d0),
    .reg_d1(reg_d1),
    .reg_d2(reg_d2),
    .reg_d3(reg_d3),
    .reg_d4(reg_d4),
    .reg_d5(reg_d5),
    .reg_d6(reg_d6),
    .reg_d7(reg_d7)
    );
    
    //instantiate ssd 
    A_seven_seg Ussd(
    .hex(hex),
    .segment(segment),
    .dp(dp)
    );
    
    // assign hexadecimal to each digit
    //condition is which digit is ON
    always @ (*)
    case ({enable_D1,enable_D2,enable_D3,enable_D4,enable_D5,enable_D6,enable_D7,enable_D8})
        8'b01111111: hex = reg_d0;
        8'b10111111: hex = reg_d1;
        8'b11011111: hex = reg_d2;
        8'b11101111: hex = reg_d3;
        8'b11110111: hex = reg_d4;
        8'b11111011: hex = reg_d5;
        8'b11111101: hex = reg_d6;
        8'b11111110: hex = reg_d7;
        default: hex = 0; 
    endcase 
    
endmodule
