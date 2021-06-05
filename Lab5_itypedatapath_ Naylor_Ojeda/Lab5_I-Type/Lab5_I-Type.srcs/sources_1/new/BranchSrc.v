`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 04:05:10 PM
// Design Name: 
// Module Name: BranchSrc
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


module BranchSrc(
    input [1:0] BranchIn,
    input Zero,
    output BranchOut
    );
    wire notz, and1, and2;
    not
        n1(notz, Zero);
    
    and
        a1(and1, BranchIn[0], Zero),
        a2(and2, BranchIn[1], notz);
    or
        o1(BranchOut, and1, and2);
endmodule
