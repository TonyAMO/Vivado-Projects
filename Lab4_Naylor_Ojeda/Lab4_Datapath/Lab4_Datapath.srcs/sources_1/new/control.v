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
    output reg [3:0] ALUCtrl
    );
    
    always@(*) begin
       if (Op == 6'b0) begin
            RegWrite = 1'b1;
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
            RegWrite = 1'b0;
            ALUCtrl = 4'bxxxx;
       end
    end
endmodule
