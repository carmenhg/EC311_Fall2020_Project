`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aymane
// 
// Create Date: 12/04/2020 02:05:15 PM
// Design Name: 
// Module Name: keyboard_input
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

`define soloplayer 1'b0
`define multiplayer 1'b1


module keyboard_input(clk, mode, in, out, temp);

    wire [7:0] q = 8'h15;
    wire [7:0] w = 8'h1D;
    wire [7:0] e = 8'h24;
    wire [7:0] r = 8'h2D;
    wire [7:0] t = 8'h2C;
    wire [7:0] y = 8'h35;
    wire [7:0] u = 8'h3C;
    wire [7:0] i = 8'h43;
    wire [7:0] o = 8'h44;
    wire [7:0] p = 8'h4D;
    wire [7:0] a = 8'h1C;
    wire [7:0] s = 8'h1B;
    wire [7:0] d = 8'h23;
    wire [7:0] f = 8'h2b;
    wire [7:0] g = 8'h34;
    wire [7:0] h = 8'h33;
    wire [7:0] j = 8'h3B;
    wire [7:0] k = 8'h42;
    wire [7:0] l = 8'h4B;
    wire [7:0] z = 8'h1A;
    wire [7:0] x = 8'h22;
    wire [7:0] c = 8'h21;
    wire [7:0] v = 8'h2A;
    wire [7:0] b = 8'h32;
    wire [7:0] n = 8'h31;
    wire [7:0] m = 8'h3A;
    wire [7:0] enter = 8'h5A;
    
    
    parameter dot = 2'b00;
    parameter dash = 2'b01;
    parameter sp = 2'b10;
    parameter done = 2'b11;
    
    
    input clk, mode, in;
    output reg out;
    reg state;
    output reg temp;
    
always @ (posedge clk)
    if (mode == 1) state = `soloplayer;
    else state =`multiplayer;
    
always @ (*) 
    case(in)
    
        8'h15: temp <= {dash,sp,dash,sp,dot,sp,dash};
        8'h1D: temp <= {dot,sp,dash,sp,dash};
        8'h24: temp <= {dot};
        8'h2D: temp <= {dot,sp,dash,sp,dot};
        8'h2C: temp <= {dash};
        8'h35: temp <= {dash,sp,dot,sp,dash,sp,dash};
        8'h3C: temp <= {dot,sp,dot,sp,dash};
        8'h43: temp <= {dot,sp,dot};
        8'h44: temp <= {dash,sp,dash,sp,dash};
        8'h4D: temp <= {dot,sp,dash,sp,dash,sp,dot};
        8'h1C: temp <= {dot,sp,dash};
        8'h1B: temp <= {dot,sp,dot,sp,dot};
        8'h23: temp <= {dash,sp,dot,sp,dot};
        8'h2b: temp <= {dot,sp,dot,sp,dash,sp,dot};
        8'h34: temp <= {dash,sp,dash,sp,dot};
        8'h33: temp <= {dot,sp,dot,sp,dot,sp,dot};
        8'h3B: temp <= {dot,sp,dash,sp,dash,sp,dash};
        8'h42: temp <= {dash,sp,dot,sp,dash};
        8'h4B: temp <= {dot,sp,dash,sp,dot,sp,dot};
        8'h1A: temp <= {dash,sp,dash,sp,dot,sp,dot};
        8'h22: temp <= {dash,sp,dot,sp,dot,sp,dash};
        8'h21: temp <= {dash,sp,dot,sp,dash,sp,dot};
        8'h2A: temp <= {dot,sp,dot,sp,dot,sp,dash};
        8'h32: temp <= {dash,sp,dot,sp,dot,sp,dot};
        8'h31: temp <= {dash,sp,dot};
        8'h3A: temp <= {dash,sp,dash};
        
    endcase
    
    
endmodule
