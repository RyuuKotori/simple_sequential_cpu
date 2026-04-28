`timescale 1ns / 1ps

module tb_cu();
    logic clk;
    
    cu cu (.clk(clk));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        $display(" === Test started === ");
        
        $display(" === Test finished === ");
        $finish;
    end
endmodule
