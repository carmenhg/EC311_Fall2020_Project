`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2020 01:11:02 PM
// Design Name: 
// Module Name: refresh_clock
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

module refresh_clock(
input  clk,  
output refreshClk,  
output clk_point1hz 
);

reg [26:0] count = 0;  
reg [16:0] refresh = 0; 
reg tmp_clk = 0; 
reg rclk = 0; 

assign clk_point1hz = tmp_clk;// 0.5Hz clock
assign refreshClk = rclk; //refresh clock

BUFG clock_buf_0(  //buffered clock to reduce the clock skew
  .I(clk),
  .O(clk_100mhz)
);

// generate the clock. 
always @(posedge clk_100mhz) begin 
  if (count < 10000000) begin 
    count <= count + 1; 
  end
  else begin
    tmp_clk <= ~tmp_clk; 
    count <= 0; 
  end
end

always @(posedge clk_100mhz) begin 
	if (refresh < 100000) begin 
		refresh <= refresh + 1; 
	end else begin
		refresh <= 0; 
		rclk <= ~rclk; 
	end
end

endmodule
