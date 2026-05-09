`timescale 1ns / 1ps

module core(input clk, input reset);
    logic [15:0] instruction;
    
    logic [7:0] cmd_const8;
    logic [2:0] cu_reg1;
    logic cu_PC_wr_en;
    logic cu_const8_en;
    logic cu_const8_h_sel;
    logic cu_rf_regw_en;
    logic cu_rf_regr_en;
    logic [2:0] cu_alu_cmd;
    logic cu_alu_result_en;
    logic cu_idb_to_pc;
    
    logic [15:0] idb;
    logic [15:0] acc;

    im instruction_memory(.clk(clk),
                          .reset(reset),
                          .cu_idb_to_pc(cu_idb_to_pc),
                          .cu_PC_wr_en(cu_PC_wr_en),
                          .idb(idb),
                          .instruction(instruction));
                          
    cu controll_unit (.clk(clk),
                      .reset(reset),
                      .instruction_word(instruction),
                      .cmd_const8(cmd_const8),
                      .cu_reg1(cu_reg1),
                      .cu_pc_wr_en(cu_PC_wr_en),
                      .cu_const8_en(cu_const8_en),
                      .cu_const8_h_sel(cu_const8_h_sel),
                      .cu_rf_regw_en(cu_rf_regw_en),
                      .cu_rf_regr_en(cu_rf_regr_en),
                      .cu_alu_cmd(cu_alu_cmd),
                      .cu_alu_result_en(cu_alu_result_en),
                      .cu_idb_to_pc(cu_idb_to_pc));
                      
    rf register_file (.clk(clk),
                      .reset(reset),
                      .cu_reg1(cu_reg1),
                      .cu_const8(cmd_const8),
                      .cu_const8_en(cu_const8_en),
                      .cu_const8_h_sel(cu_const8_h_sel),
                      .cu_rf_regw_en(cu_rf_regw_en),
                      .cu_rf_regr_en(cu_rf_regr_en),
                      .idb(idb),
                      .acc(acc));
                      
    alu arithmic_logic_unit(.clk(clk),
                            .reset(reset),
                            .alu_result_enable(cu_alu_result_en),
                            .opcode(cu_alu_cmd),
                            .acc(acc),
                            .isb(idb),
                            .alu_result(idb));
endmodule
