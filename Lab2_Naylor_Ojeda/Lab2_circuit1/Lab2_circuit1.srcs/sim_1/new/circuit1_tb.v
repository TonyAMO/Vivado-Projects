`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2021 11:27:22 AM
// Design Name: 
// Module Name: circuit1_tb
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


module circuit1_tb();
    reg A_tb, B_tb, C_tb;
    wire F1_tb;
    integer i;
    circuit1 uut(.A(A_tb), .B(B_tb), .C(C_tb), .F1(F1_tb));
    initial begin
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display(" ");
        $display(" ");
        
        //Define tast cases
        for(i = 0; i < 8; i = i + 1) begin
            {A_tb, B_tb, C_tb} = i;
            #5 $display("time=%t A=%0b B=%0b || F1=%0b", $time, A_tb, B_tb, C_tb, F1_tb);
        end
        $finish;
    end
endmodule
