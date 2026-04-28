`timescale 1ns / 1ps

module alu 
           #(parameter WIDTH=16)
           (input clk,
            input reset,
            input alu_result_enable,
            input [2:0] opcode,
            input [WIDTH-1:0] acc,
            input [WIDTH-1:0] isb,
            output tri [WIDTH-1:0] alu_result);
            
    logic [WIDTH-1:0] calc_result;
    logic [WIDTH-1:0] alu_ff_result;
    
    alu_calc #(WIDTH) calculation (.opcode(opcode),
                                   .acc(acc),
                                   .isb(isb),
                                   .calc_result(calc_result));
    
    re_ff #(WIDTH) alu_result_ff (.clk(clk),
                                  .reset(reset),
                                  .enable(alu_result_enable),
                                  .d(calc_result),
                                  .q(alu_ff_result));
                         
    tristate_buffer #(WIDTH) alu_result_tri_buffer(.d(alu_ff_result),
                                                   .enable(alu_result_enable),
                                                   .q(alu_result));
endmodule
