`timescale 1ns / 1ps

module im
      (input clk,
       input reset,
       input cu_idb_to_pc,
       input cu_PC_wr_en,
       input tri [15:0] idb,
       output logic [15:0] instruction);
       
       logic [15:0] next_count;
       logic [15:0] next_programm_count;
       logic [15:0] programm_count;
       
       counter #(16) inc_pc (.d(programm_count), 
                             .q(next_count));
       
       im_mplx state_mplx (.next_counter(next_count),
                           .idb(idb),
                           .cu_idb_to_pc(cu_idb_to_pc),
                           .counter_state(next_programm_count));
       
       re_ff #(16) pc (.clk(clk),
                       .reset(reset),
                       .enable(cu_PC_wr_en),
                       .d(next_programm_count),
                       .q(programm_count));
                       
       im_memory imMem (.pc(programm_count),
                        .instruction(instruction));
endmodule
