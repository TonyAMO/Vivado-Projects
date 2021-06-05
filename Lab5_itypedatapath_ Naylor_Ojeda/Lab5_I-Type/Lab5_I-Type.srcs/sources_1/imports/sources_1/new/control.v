`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 03:01:41 PM
// Design Name: 
// Module Name: control
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


module control(
    input [5:0] Op,
    input [5:0] Func,
    output reg RegWrite,
    output reg [3:0] ALUCtrl,
    output reg RegDst,
    output reg [1:0] Branch,
    output reg MemRead,
    output reg MemWrite,
    output reg MemtoReg,
    output reg ALUsrc
    );
    
    always@(*) begin
       if (Op == 6'b0) begin    //Detects R-Type Instruction
            RegWrite = 1'b1;    //Wrutes back to register file
            RegDst = 1'b1;      //Inst[15:11] as write back address
            Branch = 2'b00;
            MemRead = 1'b0;
            MemWrite = 1'b0;
            MemtoReg = 1'b0;
            ALUsrc = 1'b0;
            case(Func)
                6'h20: ALUCtrl = 4'b1010; //Add signed
                6'h21: ALUCtrl = 4'b0010; //Add unsigned
                6'h22: ALUCtrl = 4'b1110; //Subtract signed
                6'h23: ALUCtrl = 4'b0110; //Subtract unsigned
                6'h24: ALUCtrl = 4'b0000; //AND
                6'h25: ALUCtrl = 4'b0001; //OR
                6'h26: ALUCtrl = 4'b0011; //XOR
                6'h27: ALUCtrl = 4'b1100; //NOR
                6'h2a: ALUCtrl = 4'b1111; //Set less than signed
                6'h2b: ALUCtrl = 4'b0100; //Set less than unsigned
            default: ALUCtrl = 4'bxxxx; //default to AND
            endcase
       end
       else begin
            case(Op)
                6'h08: begin    //addi
                        ALUCtrl = 4'b1010;   //Add ALU content
                        RegWrite = 1'b1;     //Write back to register file
                        RegDst = 1'b0;      //Inst[20:16] write back address
                        Branch = 2'b00;      //No branch performed
                        MemRead = 1'b0;    //No read from data memory
                        MemWrite = 1'b0;    //No write to data memory
                        MemtoReg = 1'b0;    //Write back data comes from ALU
                        ALUsrc = 1'b1;      //Source B comes from SE immediate
                       end
                6'h09: begin    //addiu
                        ALUCtrl = 4'b0010;   
                        RegWrite = 1'b1;     
                        RegDst = 1'b0;      
                        Branch = 2'b00;      
                        MemRead = 1'b0;    
                        MemWrite = 1'b0;    
                        MemtoReg = 1'b0;    
                        ALUsrc = 1'b1;      
                       end
                6'h0c: begin    //andi
                        ALUCtrl = 4'b0000;   
                        RegWrite = 1'b1;     
                        RegDst = 1'b0;      
                        Branch = 2'b00;      
                        MemRead = 1'b0;    
                        MemWrite = 1'b0;    
                        MemtoReg = 1'b0;    
                        ALUsrc = 1'b1;      
                       end
                6'h0d: begin    //or1
                        ALUCtrl = 4'b0001;   
                        RegWrite = 1'b1;     
                        RegDst = 1'b0;      
                        Branch = 2'b00;      
                        MemRead = 1'b0;    
                        MemWrite = 1'b0;    
                        MemtoReg = 1'b0;    
                        ALUsrc = 1'b1;      
                       end
                6'h23: begin    //lw
                        ALUCtrl = 4'b0010;   
                        RegWrite = 1'b1;     
                        RegDst = 1'b0;      
                        Branch = 2'b00;      
                        MemRead = 1'b1;    
                        MemWrite = 1'b0;    
                        MemtoReg = 1'b1;    
                        ALUsrc = 1'b1;      
                       end
                6'h2b: begin    //sw
                        ALUCtrl = 4'b0010;   
                        RegWrite = 1'b0;     
                        RegDst = 1'b0;      
                        Branch = 2'b00;      
                        MemRead = 1'b0;    
                        MemWrite = 1'b1;    
                        MemtoReg = 1'b0;    
                        ALUsrc = 1'b1;      
                       end
                6'h04: begin    //beq
                        ALUCtrl = 4'b0110;   
                        RegWrite = 1'b0;     
                        RegDst = 1'b0;      
                        Branch = 2'b01;      
                        MemRead = 1'b0;    
                        MemWrite = 1'b0;    
                        MemtoReg = 1'b0;    
                        ALUsrc = 1'b0;      
                       end
                6'h05: begin    //bnq
                        ALUCtrl = 4'b0110;   
                        RegWrite = 1'b0;     
                        RegDst = 1'b0;      
                        Branch = 2'b10;      
                        MemRead = 1'b0;    
                        MemWrite = 1'b0;    
                        MemtoReg = 1'b0;    
                        ALUsrc = 1'b0;      
                       end
                6'h0a: begin    //slti
                        ALUCtrl = 4'b1111;   
                        RegWrite = 1'b1;     
                        RegDst = 1'b0;      
                        Branch = 2'b00;      
                        MemRead = 1'b0;    
                        MemWrite = 1'b0;    
                        MemtoReg = 1'b0;    
                        ALUsrc = 1'b1;      
                       end  
                6'h0b: begin    //sltiu
                        ALUCtrl = 4'b0100;   
                        RegWrite = 1'b1;     
                        RegDst = 1'b0;      
                        Branch = 2'b00;      
                        MemRead = 1'b0;    
                        MemWrite = 1'b0;    
                        MemtoReg = 1'b0;    
                        ALUsrc = 1'b1;      
                       end
                default: begin      //andi default
                            ALUCtrl = 4'b0000;
                            RegWrite = 1'b1;     
                            RegDst = 1'b0;
                            Branch = 2'b00;
                            MemRead = 1'b0;
                            MemWrite = 1'b0;
                            MemtoReg = 1'b0;
                            ALUsrc = 1'b1; 
                         end
                endcase
       end
    end
endmodule
