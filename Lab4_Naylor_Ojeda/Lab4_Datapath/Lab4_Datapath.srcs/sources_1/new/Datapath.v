`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 09:35:51 AM
// Design Name: 
// Module Name: Datapath
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


module Datapath(
    input clk,
    input reset,
    output [31:0] Dout
    );
    
    wire [31:0] pcaOutputWire;
    wire [31:0] pcrOutputWire;
    wire [31:0] rfRSOutputWire;
    wire [31:0] rtRTOutputWire;
    wire [31:0] instructionMemOutputWire;
    wire controlRegRWriteOutputWire;
    wire [3:0] controlALUCntlOutputWire;
    wire [31:0] ALUOutputWire;
    wire N;
    wire Z;
    wire C;
    wire V;
    control ctrl(.Op(instructionMemOutputWire[31:26]), .Func(instructionMemOutputWire[5:0]), .RegWrite(controlRegRWriteOutputWire), .ALUCtrl(controlALUCntlOutputWire));
    Instruction_Memory im(.Addr(pcrOutputWire), .Inst_out(instructionMemOutputWire));
    regfile32 rf(.clk(clk), .reset(reset), .D_En(controlRegRWriteOutputWire), .D_Addr(instructionMemOutputWire[15:11]), .S_Addr(instructionMemOutputWire[25:21]), .T_Addr(instructionMemOutputWire[20:16]), 
        .D(ALUOutputWire), .S(rfRSOutputWire), .T(rtRTOutputWire));
    PCADD pca(.Din(pcrOutputWire), .PCADD_out(pcaOutputWire));
    PC pcr(.clock(clk), .Reset(reset), .Din(pcaOutputWire), .PC_out(pcrOutputWire));
    ALU alu(.A(rfRSOutputWire), .B(rtRTOutputWire), .ALUctrl(controlALUCntlOutputWire), .ALUout(ALUOutputWire), .N(N), .C(C), .Z(Z), .V(V));
    assign Dout = ALUOutputWire;
endmodule
