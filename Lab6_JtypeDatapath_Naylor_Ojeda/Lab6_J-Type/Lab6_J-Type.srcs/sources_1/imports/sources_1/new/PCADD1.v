`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 03:55:22 PM
// Design Name: 
// Module Name: PCADD1
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


module PCADD1(
    input [31:0] PCADDIn,
    input [31:0] SignEx,
    output [31:0] NextPC
    );
    wire [31:0] SignSL;
    assign SignSL = SignEx << 2;
    assign NextPC = SignSL + PCADDIn;
endmodule
