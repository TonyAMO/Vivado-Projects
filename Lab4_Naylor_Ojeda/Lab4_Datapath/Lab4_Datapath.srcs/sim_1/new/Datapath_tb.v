`timescale 1ns / 1ps

module Datapath_tb();
    reg clk;
    reg reset;
    wire [31:0] Dout;
    
    integer i;
    Datapath uut(.clk(clk), .reset(reset), .Dout(Dout));
    
    always
        #10 clk = ~clk;//makes clk change from rising to falling or vice versa
        task Dump_RegFile; begin
            $timeformat( -9, 1, " ns", 9);
            for ( i = 0; i < 32; i =i+1) begin
                @(posedge clk)
                $display("t=%t rf[%0d]: %h",
                $time, i, uut.rf.regArray[i]);
                end
            end
         endtask
       
        initial begin
            clk = 0;
            $readmemh("imem.dat", uut.im.imem);
            $readmemh("regfile.dat",uut.rf.regArray);
            //Create testbench here based on lab guide specs
            reset = 1; #20;
            
            reset = 0; #200;
            Dump_RegFile;
            $finish;
     end
endmodule