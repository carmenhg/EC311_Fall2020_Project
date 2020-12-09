module A_seven_seg(
input [17:0] hex, 
output reg [6:0] segment, // 7-segment output
output dp //decimal point
    );

always @ (*)
   case (hex) 
		18'b100000000000000000: segment = 7'b0001000; //A
		18'b010000000000000000: segment = 7'b1100000; //b
		18'b001000000000000000: segment = 7'b0110001;//C
		18'b000100000000000000: segment = 7'b1000010;//d
		18'b000010000000000000: segment = 7'b0110000;//E
		18'b000001000000000000: segment = 7'b0111000;//F
		18'b000000100000000000: segment = 7'b0100000;//G
		18'b000000010000000000: segment = 7'b1001000;//H
		18'b000000001000000000: segment = 7'b1001111;//I or 1
		18'b000000000100000000: segment = 7'b1110001;//L
		18'b000000000010000000: segment = 7'b1101010;//n
		18'b000000000001000000: segment = 7'b0000001;//O
		18'b000000000000100000: segment = 7'b0011000;//P
		18'b000000000000010000: segment = 7'b1111010;//r
		18'b000000000000001000: segment = 7'b0100100;//S
		18'b000000000000000100: segment = 7'b1000001;//U or V
		18'b000000000000000010: segment = 7'b1001100;//Y
		18'b000000000000000001: segment = 7'b0010010;//Z
		18'b111 : segment = 7'b0000110; // 3
		18'b11 : segment = 7'b1111111;// blank letter
      default: segment = 7'b0000001; // default is 0 display
   endcase	
assign dp = 4'b1111; 
    
endmodule

