`timescale 1ns / 1ps

module cu_instruction(input clk,
                      input reset,
                      input enableInstructionFetch,
                      input [15:0] instruction_word,
                      output logic [7:0] u_adress,
                      output logic [7:0] cmd_const8,
                      output logic [2:0] cu_reg1);
    logic [15:0] current_instruction;
    
    re_ff instruction_word_ff (.clk(clk),
                               .reset(reset),
                               .enable(enableInstructionFetch),
                               .d(instruction_word),
                               .q(current_instruction));
                               
    cu_instruction_decoder instruction_decoder (.instruction_word(current_instruction),
                                                .u_adress(u_adress),
                                                .cmd_const8(cmd_const8),
                                                .cu_reg1(cu_reg1));
endmodule
