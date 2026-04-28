`timescale 1ns / 1ps

module tb_core();
    logic clk;
    
    core core(.clk(clk));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
    end;
endmodule
