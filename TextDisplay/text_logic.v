`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2020 05:40:43 PM
// Design Name: 
// Module Name: text_logic
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

module text_logic(
    input divided_clk,
    input switch1,
    input switch2,
    input switch3,
    output reg [17:0] reg_d0, // count for right-most digit
    output reg [17:0] reg_d1, 
    output reg [17:0] reg_d2, 
    output reg [17:0] reg_d3,
    output reg [17:0] reg_d4, 
    output reg [17:0] reg_d5,
    output reg [17:0] reg_d6, 
    output reg [17:0] reg_d7  // count for left-most digit
    );
    
    always @(*)
      begin
        case ({switch1, switch2, switch3})
          3'b100  : begin
                       reg_d0 <= 18'b11;
                       reg_d1 <= 18'b11;
                       reg_d2 <= 18'b11;
                       reg_d3 <= 18'b11;            // FPGA
                       reg_d4 <= 18'b100000000000000000;
                       reg_d5 <= 18'b000000100000000000;
                       reg_d6 <= 18'b000000000000100000;
                       reg_d7 <= 18'b000001000000000000;
                    end
          3'b010  : begin
                        reg_d0 <= 18'b11;
                        reg_d1 <= 18'b11;
                        reg_d2 <= 18'b000000000000010000;
                        reg_d3 <= 18'b000010000000000000;          // bUrGEr
                        reg_d4 <= 18'b000000100000000000;
                        reg_d5 <= 18'b000000000000010000;
                        reg_d6 <= 18'b000000000000000100;
                        reg_d7 <= 18'b010000000000000000;
                    end
          3'b001  : begin
                        reg_d0 <= 18'b11;
                        reg_d1 <= 18'b000000100000000000;
                        reg_d2 <= 18'b000000000001000000;
                        reg_d3 <= 18'b000000000100000000;       // VErILOG
                        reg_d4 <= 18'b000000001000000000;
                        reg_d5 <= 18'b000000000000010000;
                        reg_d6 <= 18'b000010000000000000;
                        reg_d7 <= 18'b000000000000000100;
                    end
                    
                    default: begin
                        reg_d0 <= 18'b11;
                        reg_d1 <= 18'b11;
                        reg_d2 <= 18'b11;
                        reg_d3 <= 18'b000000001000000000;        // EC311
                        reg_d4 <= 18'b000000001000000000;
                        reg_d5 <= 18'b111;
                        reg_d6 <= 18'b001000000000000000;
                        reg_d7 <= 18'b000010000000000000;
                    end
        endcase   
    end
     
endmodule
