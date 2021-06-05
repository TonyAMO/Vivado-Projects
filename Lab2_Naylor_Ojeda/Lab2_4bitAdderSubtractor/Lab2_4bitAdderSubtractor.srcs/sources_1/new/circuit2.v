`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2021 10:33:58 AM
// Design Name: 
// Module Name: circuit2
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


module circuit2(
    input A,
    input B,
    output reg F2
    );
    
    
    //f2 = (~a+b)*(a+~b)
    //logic gates: assign F2 = (~A | B) & (A | ~B);
    //always@: (A && B), (A, B), (*)
    always@(A, B) begin
    case({A, B})
        2'b00: F2 = 1'b1;
        2'b01: F2 = 1'b0;
        2'b10: F2 = 1'b0;
        2'b11: F2 = 1'b1;
    endcase
    end
endmodule
