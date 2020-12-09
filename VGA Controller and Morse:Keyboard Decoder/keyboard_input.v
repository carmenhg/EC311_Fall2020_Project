`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 01:41:43 PM
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


module keyboard_input(clk, input_morse,mode, in, correct);
// hex codes for each key
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
    input input_morse;
   
    reg state;
    reg temp;
    output reg correct;
    
always @ (posedge clk)
    if (mode == 1) state = `soloplayer;
    else state =`multiplayer;
    
//concatenate letters to form a word
reg complete_word;
reg done_typing;

// concatenate the letter from the keyboard input
    
always @ (*) 
    case(in)
    
        8'h15: begin 
                    temp <= {dash,dash,dot,dash,sp};
                    complete_word = {complete_word, temp};
                end
                
        8'h1D: begin 
                    temp <= {dot,dash,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h24: begin 
                    temp <= {dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h2D: begin 
                    temp <= {dot,dash,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h2C: begin 
                    temp <= {dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h35: begin 
                    temp <= {dash,dot,dash,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h3C: begin 
                    temp <= {dot,dot,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h43: begin 
                    temp <= {dot,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h44: begin 
                    temp <= {dash,dash,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h4D: begin 
                    temp <= {dot,dash,dash,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h1C: begin 
                    temp <= {dot,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h1B: begin 
                    temp <= {dot,dot,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h23: begin 
                    temp <= {dash,dot,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h2b: begin 
                    temp <= {dot,dot,dash,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h34: begin 
                    temp <= {dash,dash,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h33: begin 
                    temp <= {dot,dot,dot,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h3B: begin 
                    temp <= {dot,dash,dash,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h42: begin 
                    temp <= {dash,dot,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h4B: begin 
                    temp <= {dot,dash,dot,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h1A: begin 
                    temp <= {dash,dash,dot,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h22: begin 
                    temp <= {dash,dot,dot,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h21: begin 
                    temp <= {dash,dot,dash,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h2A: begin 
                    temp <= {dot,dot,dot,dash,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h32: begin 
                    temp <= {dash,dot,dot,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h31: begin 
                    temp <= {dash,dot,sp};
                    complete_word = {complete_word, temp};
                end
        
        8'h3A: begin 
                    temp <= {dash,dash,sp};
                    complete_word = {complete_word, temp};
                end
                
        8'h5A: begin 
                    temp <= {done};
                    complete_word = {complete_word, temp};
                    done_typing <= 1;
                end
        
        
    endcase

    
    //compare user input and input morse 
    
    always@(input_morse)
    begin
        if ((input_morse == complete_word) && done_typing == 1'b1)
            correct <= 1;
        else
            correct <= 0;
    end
        
    
    
endmodule
