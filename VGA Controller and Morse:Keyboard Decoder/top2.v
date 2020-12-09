`timescale 1ns / 1ps

module top2(
    input clk,              //input clock
    input PS2_CLK,          //input PS2 Clock
    input sw_rectangle,     //switch for Morse dash
    input sw_square,        //switch for Morse dot
    input sw_space,         //switch for marking the space between letters
    input sw_done,          //switch for marking the end of the word
    input in,               //keyboard key pressed
    output reg [3:0]red,    //VGA red signal
    output reg [3:0]green,  //VGA green signal
    output reg [3:0]blue,   //VGA blue signal
    output  vsync,          //VGA vertical signal
    output  hsync          //VGA horizontal signal
    );
    
 
    //create 25 Mhz clock for VGA signals
    wire clk_25Hz;
    clock_divider_vga vga_clock(.clk(clk), .clk_25Hz(clk_25Hz));
    
    //create the signals for the VGA controller
    wire [15:0] h_count_value;
    wire [15:0] v_count_value;
    wire enable_v_count;
    
    h_counter h(clk_25Hz,enable_v_count, h_count_value );
    v_counter v(clk_25Hz,enable_v_count, v_count_value );
    
    assign hsync = (h_count_value < 96) ? 1'b1:1'b0;
    assign vsync = (v_count_value < 2) ? 1'b1:1'b0;
    
    //Using switches and value registers to drive the display of the VGA 
    reg sw_green = 1'b0;                    //True if guess is right - screen goes to green
    reg sw_red = 1'b0;                      //True if guess is wrong - screen goes to red
    reg sw_yellow = 1'b0;                   //True if keyboard input is ongoing - screen stays in yellow
    reg input_morse;                        //For storing input morse for use in morse decoder module
      
    always @(*)
      begin
        case ({sw_rectangle, sw_square, sw_green, sw_red, sw_yellow, sw_space,sw_done})
          7'b1000000  : begin
                        red <= 4'h0;
                        green <= ((h_count_value >350) & (h_count_value < 450) & (v_count_value > 200) & (v_count_value < 250)?4'hF:4'h0); //rectangle
                        blue <= 4'h0;
                        input_morse <= {input_morse, 2'b01};
                    end
          7'b0100000  : begin
                        red <= 4'h0;
                        green <= 4'h0; 
                        blue <= ((h_count_value > 380) & (h_count_value < 430) & (v_count_value > 200) & (v_count_value < 250)?4'hF:4'h0); //square 
                        input_morse <= {input_morse, 2'b00};
                    end
          7'b0010000  : begin
                        red <= 4'h0;
                        green <= ((h_count_value > 0) && (h_count_value < 740) && (v_count_value > 0) && (v_count_value < 580)?4'hF:4'h0); //green screen
                        blue <= 4'h0; 
                    end
           7'b0001000  : begin
                        red <= ((h_count_value > 0) && (h_count_value < 740) && (v_count_value > 0) && (v_count_value < 580)?4'hF:4'h0); //red screen
                        green <= 4'h0;
                        blue <= 4'h0; 
                    end
          7'b0000100  : begin
                        red <= ((h_count_value > 0) && (h_count_value < 740) && (v_count_value > 0) && (v_count_value < 580)?4'hF:4'h0); //yellow screen
                        green <= ((h_count_value > 0) && (h_count_value < 740) && (v_count_value > 0) && (v_count_value < 580)?4'hF:4'h0); //yellow screen
                        blue <= 4'h0; 
                    end
          7'b0000010  : begin
                        red <= 4'h0; 
                        green <= 4'h0; 
                        blue <= 4'h0; 
                        input_morse <= {input_morse, 2'b10};
                    end
          7'b0000001  : begin
                        red <= 4'h0; 
                        green <= 4'h0; 
                        blue <= 4'h0; 
                        input_morse <= {input_morse, 2'b11};
                        end
          default : begin 
                        red <= 4'h0;
                        green <= 4'h0;
                        blue <= 4'h0; 
                    end
        endcase
     end 
      
     //call keyboard module to verify user's guess
     reg mode = 1;              //single or multiplayer (functionality not tested)
     wire correct;              //output from keyboard module with decision for user's guess
      
     keyboard_input K(.clk(PS2_CLK), .input_morse(input_morse), .mode(mode), .in(in), .correct(correct));     
      
      //set sw_green or sw_red to true depending on decision for user's guess
      always @(*)
         begin
            case (correct)
              1'b1  : begin
                            sw_green <= 1'b1;
                        end
              1'b0  : begin
                            sw_red <= 1'b1;
                        end
              default : begin 
                            sw_yellow <= 1'b1;
                        end 
            endcase
         end           
 
endmodule
