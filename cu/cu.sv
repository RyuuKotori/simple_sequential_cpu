`timescale 1ns / 1ps

module cu(input clk,
          input reset,
          input [15:0] instruction_word,
          output logic [7:0] cmd_const8,
          output logic [2:0] cu_reg1,
          output logic cu_pc_wr_en,
          output logic cu_const8_en,
          output logic cu_const8_h_sel,
          output logic cu_rf_regw_en,
          output logic cu_rf_regr_en,
          output logic [2:0] cu_alu_cmd,
          output logic cu_alu_result_en,
          output logic cu_idb_to_pc,
          output logic [14:0] cu_remain);
          
    logic [1:0] uState;
    logic [7:0] uAddress;
    logic [31:0] uData;
    
    cu_u_cycle_fsm u_cycle (.clk(clk),
                            .reset(reset),
                            .uState(uState));
                            
    cu_instruction instruction (.clk(clk),
                                .reset(reset),
                                .enableInstructionFetch(uState == 0'b00),
                                .instruction_word(instruction_word),
                                .u_adress(uAddress),
                                .cmd_const8(cmd_const8),
                                .cu_reg1(cu_reg1));
                                
     cu_u_rom u_rom (.u_address({6'b00_0000, uAddress, uState}),
                     .u_data(uData));
                   
     cu_distributor distributer (.uCode(uData[31:6]),
                                 .cu_pc_wr_en(cu_pc_wr_en),
                                 .cu_const8_en(cu_const8_en),
                                 .cu_const8_h_sel(cu_const8_h_sel),
                                 .cu_rf_regw_en(cu_rf_regw_en),
                                 .cu_rf_regr_en(cu_rf_regr_en),
                                 .cu_alu_cmd(cu_alu_cmd),
                                 .cu_alu_result_en(cu_alu_result_en),
                                 .cu_idb_to_pc(cu_idb_to_pc),
                                 .cu_remain(cu_remain));
     
endmodule
