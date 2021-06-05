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
    wire [31:0] pcaOutputWire1;
    wire [31:0] pcrOutputWire;
    wire [31:0] rfRSOutputWire;
    wire [31:0] rtRTOutputWire;
    wire [31:0] instructionMemOutputWire;
    wire controlRegRWriteOutputWire;
    wire [3:0] controlALUCntlOutputWire;
    wire [31:0] ALUOutputWire;
    wire [31:0] DataMemOut;
    wire N;
    wire Z;
    wire C;
    wire V;
    wire RegDst;
    wire MemWrite;
    wire MemRead;
    wire [1:0] Branch;
    wire MemtoReg;
    wire ALUsrc;
    wire Branchsrc;
    wire jump;
    wire [31:0] SignExtend;
    
    //Output wires for mux
    wire [4:0] RegDstMux;
    wire [31:0] MemtoRegMux;
    wire [31:0] ALUsrcMux;
    wire [31:0] BranchSrcMux;
    wire [31:0] JumpMux;
    
    
    //Create logic for muxes
    assign RegDstMux = (RegDst == 1) ? instructionMemOutputWire[15:11] : instructionMemOutputWire[20:16];
    assign MemtoRegMux = (MemtoReg == 1) ? DataMemOut : ALUOutputWire;
    assign ALUsrcMux = (ALUsrc == 1) ? SignExtend : rtRTOutputWire;
    assign BranchSrcMux = (Branchsrc == 1) ? pcaOutputWire1 : pcaOutputWire;
    assign JumpMux = (jump == 1) ? {pcaOutputWire[31:28], instructionMemOutputWire[25:0], 2'b00} : BranchSrcMux;
    
    
    control ctrl(.Op(instructionMemOutputWire[31:26]), 
                 .Func(instructionMemOutputWire[5:0]), 
                 .RegWrite(controlRegRWriteOutputWire), 
                 .ALUCtrl(controlALUCntlOutputWire), 
                 .RegDst(RegDst),
                 .Branch(Branch), 
                 .MemRead(MemRead), 
                 .MemWrite(MemWrite),
                 .MemtoReg(MemtoReg),
                 .ALUsrc(ALUsrc),
                 .jump(jump));
    Instruction_Memory im(.Addr(pcrOutputWire), 
                          .Inst_out(instructionMemOutputWire));
    regfile32 rf(.clk(clk), 
                 .reset(reset), 
                 .D_En(controlRegRWriteOutputWire), 
                 .D_Addr(RegDstMux), 
                 .S_Addr(instructionMemOutputWire[25:21]), 
                 .T_Addr(instructionMemOutputWire[20:16]), 
                 .D(MemtoRegMux), 
                 .S(rfRSOutputWire), 
                 .T(rtRTOutputWire));
    PCADD pca(.Din(pcrOutputWire), 
              .PCADD_out(pcaOutputWire));
    PCADD1 pca1(.PCADDIn(pcaOutputWire),
                .SignEx(SignExtend),
                .NextPC(pcaOutputWire1));
    BranchSrc bsrc(.BranchIn(Branch),
                   .Zero(Z),
                   .BranchOut(Branchsrc));
    PC pcr(.clock(clk), 
           .Reset(reset), 
           .Din(JumpMux), 
           .PC_out(pcrOutputWire));
    ALU alu(.A(rfRSOutputWire), 
            .B(ALUsrcMux), 
            .ALUctrl(controlALUCntlOutputWire), 
            .ALUout(ALUOutputWire), 
            .N(N), .C(C), .Z(Z), .V(V));
    DataMem dm(.clk(clk), 
               .mem_wr(MemWrite), 
               .mem_rd(MemRead),
               .addr(ALUOutputWire),
               .wr_data(rtRTOutputWire),
               .rd_data(DataMemOut));
    SignExtension se(.SignExtIn(instructionMemOutputWire[15:0]),
                     .SignExtOut(SignExtend));
    assign Dout = MemtoRegMux;
endmodule
