`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 11:01:15 AM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    reg [31:0] A;
    reg [31:0] B; 
    reg [3:0] ALUctrl;  //inputs of uut
    wire N_tb, C, Z, V; 
    wire [31:0] ALUout;    //outputs of uut
    
    //instantiate uut
    ALU uut(.A(A), .B(B), .ALUctrl(ALUctrl), .N(N), .C(C), .V(V), .Z(Z), .ALUout(ALUout));
    
    initial begin
        //test case 1
       A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUctrl = 4'b0000;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 2
       A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUctrl = 4'b0001;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 3
       A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUctrl = 4'b0011;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 4
       A = 32'h0000_0001; B = 32'hffff_ffff; ALUctrl = 4'b0010;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 5
       A = 32'h6389_754f; B = 32'had56_24e6; ALUctrl = 4'b0010;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 6
       A = 32'h0000_0001; B = 32'hffff_ffff; ALUctrl = 4'b0010;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 7
       A = 32'h6389_754f; B = 32'had56_24e6; ALUctrl = 4'b0010;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 8
       A = 32'hffff_ffff; B = 32'hffff_ffff; ALUctrl = 4'b0010;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 9
       A = 32'h0000_0000; B = 32'h0000_0001; ALUctrl = 4'b0110;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 10
       A = 32'hf968_4783; B = 32'hf998_d562; ALUctrl = 4'b0110;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 11
       A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUctrl = 4'b1100;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 12
       A = 32'h89bc_de34; B = 32'hc53b_d687; ALUctrl = 4'b0111;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 13
       A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUctrl = 4'b1101;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 14
       A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUctrl = 4'b1111;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 15
       A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUctrl = 4'b1010;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       //test case 16
       A = 32'hf0f0_3c3c; B = 32'hbf0f_f5f5; ALUctrl = 4'b1110;
       #5 $display("A=%8h B=%8h ALUctrl=%4b || ALUout=%8h N=%0b C=%0b Z=%0b V=%0b", A, B, ALUctrl, ALUout, N, C, Z, V);
       $finish;
    end
endmodule

