`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 03:40:04 PM
// Design Name: 
// Module Name: PCADD
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


module PCADD(
    input [31:0] Din,
    output [31:0] PCADD_out
    );
    
    assign PCADD_out = Din + 3'b100;
endmodule