`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2021 11:16:52 AM
// Design Name: 
// Module Name: circuit1
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


module circuit1(
    input A,
    input B,
    input C,
    output reg F1
    );
    always@(A, B) begin
        case({A, B})
            3'b000: F1 = 1'b0;
            3'b001: F1 = 1'b1;
            3'b010: F1 = 1'b0;
            3'b011: F1 = 1'b1;
            3'b100: F1 = 1'b1;
            3'b101: F1 = 1'b0;
            3'b110: F1 = 1'b1;
            3'b111: F1 = 1'b1;
        endcase
        end
endmodule


