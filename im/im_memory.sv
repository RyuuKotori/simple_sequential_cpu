`timescale 1ns / 1ps

module im_memory (
        input [15:0] pc,
        output logic [15:0] instruction
    );
    // Override memory in testbench
    logic [15:0] mem [65535:0];
    
    assign instruction = mem[pc];
endmodule
