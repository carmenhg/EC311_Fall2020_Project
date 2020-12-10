# EC311_Fall2020_Project

Project Name: "Morse Code Interfacing"

Team Members: MICHELLE IMOGU [U05573884] | CARMEN HURTADO [U73061355] |  AYMANE EL JERARI [U28480792]


Link to Demo: https://drive.google.com/drive/folders/12sPZTiMh9XQjJyl5y35VtS1Z_eHFDF6O (Class drive, look for Team 18's video)


PROJECT OVERVIEW:- This project constitutes a morse code interfacing functionality for the Nexys-A7 FPGA Board. It encompasses the use of a VGA, an external Keyboard, and the board's Seven Segment Display. With the help of the VGA, shapes corresponding to the "dot" and "dash" of Morse Code are visible to the user. The Keyboard is used for user input as a "Guess" for the corresponding morse code on the screen. Finally a Seven Segment Display is used as a visual aid for the user to see the word shown in morse in the screen. 


How to Run the Project: 


Overview of the Code Structure:-

Carmen Hurtado:  VGA Controlletr top module runs the VGA signals to diplay shapes using the pixels in the screen. It call a clock divider module to create the needed 25 Mhz clock frequncy for this VGA Controller. Includes a case statement to drive the output colors of the VGA depending on values of input switches on the FPGA board. Lastly it calls the Keyboard/Morse Decoder module to compare and translate the shown morse code on the screen.

Michelle Imogu: The FPGA's 7-segment display Verilog code was made up of a one-hot encoding, which conatained an 18-bit combination of 0's and 1's. These combinations were used to create the letters from A to Z, and were also used to coin the preset words. These words are displayed with the push of a switch, with different switches displaying different words.

Aymane El Jerari: Keyboard input keys are encoded with their corresponding morse code in a case statement. And vice versa, we have each morse sequence for each letters in a case stetement that outputs the corresponding key that was pressed. This module also compares the input morse passed from the top module with the user keyboard keys inputs and return a 0 for incorrect guess or a 1 for correct guess. 



Relevant Information:

- VGA failed to display text and to automatically display morse code. 

- We were able to have the FPGA display letters on the 7-segment to form (short) words successfully, but we were unable to have the text display alongside the VGA dynamically.

- Couldn't implement multiplayer mode. Couldn't implement sensitivity for upper case and lower case letters inside the keyboard decoder module.


Names and Date of Signature: Carmen Hurtado; Michelle Imogu; Aymane El Jerari; 12/09/2020
