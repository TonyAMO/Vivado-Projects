`timescale 1ns / 1ps

module Circuit2_tb();
    //inputs of uut
    reg A_tb;
    reg B_tb;
    
    //outputs of uut
    wire F2_tb;
    
    //Testbench specific
    integer i;
    
    //Instantiate uut
    circuit2 uut(.A(A_tb), .B(B_tb), .F2(F2_tb));
    initial begin
        $timeformat(-9, 1, " ns", 9);
        $display(" ");
        $display(" ");
        $display(" ");
        
        //Define tast cases
        for(i = 0; i < 4; i = i + 1) begin
            {A_tb, B_tb} = i;
            #5 $display("time=%t A=%0b B=%0b || F2=%0b", $time, A_tb, B_tb, F2_tb);
        end
        $finish;
    end
endmodule