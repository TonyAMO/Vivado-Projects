`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 10:09:45 AM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUctrl,
    output reg [31:0] ALUout,
    output reg N,
    output reg C,
    output Z,
    output reg V
    );
    
    assign Z = (ALUout == 0) ? 1'b1 : 1'b0;
    always@(*) begin
        case(ALUctrl)
            4'b0000: begin  //AND
                        ALUout = A & B;
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                    end
            4'b0001: begin  //OR
                         ALUout = A | B;
                         C = 1'bx;
                         V = 1'bx;
                         N = ALUout[31];
                    end
            4'b0011: begin  //XOR
                         ALUout = A ^ B;
                         C = 1'bx;
                         V = 1'bx;
                         N = ALUout[31];
                    end
            4'b0010: begin  //Add Unsigned
                         {C, ALUout} = A + B;
                         V = C;
                         N = 0;
                    end
            4'b0110: begin  //Subtract unsigned
                         {C, ALUout} = A - B;
                         V = C;
                         N = 0;
                   end
            4'b1100: begin  //NOR
                        ALUout = ~(A | B);
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                   end
            4'b0111: begin  //NOT
                        ALUout = ~A;
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                   end
            4'b1101: begin  //SLL
                        ALUout = A << 1;
                        C = 1'bx;
                        V = 1'bx;
                        N = ALUout[31];
                   end 
            4'b1010: begin  //add signed
                        {C, ALUout} = A + B;
                        if ((A[31] & B[31] & ~ALUout[31]) || (~A[31] & ~B[31] & ALUout[31]))
                            V = 1'b1;
                        else
                            V = 1'b0;
                        N = ALUout[31];
                   end
            4'b1110: begin  //subtract signed
                        {C, ALUout} = A - B;
                        if ((A[31] & ~B[31] & ~ALUout[31]) || (~A[31] & B[31] & ALUout[31]))
                            V = 1'b1;
                        else
                            V = 1'b0;
                        N = ALUout[31];
                   end
            default: begin
                        ALUout = 32'bx;
                        {C, V, N} = 3'bxxx;
                     end
        endcase
    end
endmodule
