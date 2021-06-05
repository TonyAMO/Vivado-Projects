`timescale 1ns / 1ps

module Datapath_tb();
    reg clk;
    reg reset;
    wire [31:0] Dout;
    
    integer i;
    Datapath uut(.clk(clk), .reset(reset), .Dout(Dout));
    
    always
        #10 clk = ~clk;//makes clk change from rising to falling or vice versa
        task Dump_Dmem; begin
            $timeformat( -9, 1, " ns", 9);
            for ( i = 20; i < 35; i =i+4) begin
                @(posedge clk)
                $display("t=%t dm[%0d]: %h",
                $time, i, {uut.dm.dmem[i], uut.dm.dmem[i+1], uut.dm.dmem[i+2], uut.dm.dmem[i+3]});
                end
            end
         endtask
       
        initial begin
            clk = 0;
            $readmemh("imem2r.dat", uut.im.imem);
            $readmemh("DataMem2.dat",uut.dm.dmem);
            //Create testbench here based on lab guide specs
            reset = 1; #20;
            
            reset = 0; #900;
            Dump_Dmem;
            $finish;
     end
endmodule