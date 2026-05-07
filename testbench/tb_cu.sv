`timescale 1ns / 1ps

module tb_cu();
    logic clk;
    logic reset;
    logic [15:0] instruction_word;
    logic [7:0] cmd_const8;
    logic [2:0] cu_reg1;
    logic cu_pc_wr_en;
    logic cu_const8_en;
    logic cu_const8_h_sel;
    logic cu_rf_regw_en;
    logic cu_rf_regr_en;
    logic [2:0] cu_alu_cmd;
    logic cu_alu_result_en;
    logic [15:0] cu_remain;
    
    cu cu (.clk(clk),
           .reset(reset),
           .instruction_word(instruction_word),
           .cmd_const8(cmd_const8),
           .cu_reg1(cu_reg1),
           .cu_pc_wr_en(cu_pc_wr_en),
           .cu_const8_en(cu_const8_en),
           .cu_const8_h_sel(cu_const8_h_sel),
           .cu_rf_regw_en(cu_rf_regw_en),
           .cu_rf_regr_en(cu_rf_regr_en),
           .cu_alu_cmd(cu_alu_cmd),
           .cu_alu_result_en(cu_alu_result_en),
           .cu_remain(cu_remain));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        $display(" === Test started === ");
        
        // Test Noop
        instruction_word = 0'h0000;
        display_task();
        #10; // middle decode cycle
        display_task();
        #10; // middle execute cycle
        display_task();
        #10; // middle write_back cycle
        display_task();
        
        // Test MOV0L
        instruction_word = 0'he021;
        #10; // middle fetch cycle
        display_task();
        #10; // middle decode cycle
        display_task();
        #10; // middle execute cycle
        display_task();
        #10; // middle write_back cycle
        display_task();
        
        // Test MOVH
        instruction_word = 0'he884;
        #10; // middle fetch cycle
        display_task();
        #10; // middle decode cycle
        display_task();
        #10; // middle execute cycle
        display_task();
        #10; // middle write_back cycle
        display_task();
        
        // Test Add
        instruction_word = 0'hc0df;
        #10; // middle fetch cycle
        display_task();
        #10; // middle decode cycle
        display_task();
        #10; // middle execute cycle
        display_task();
        #10; // middle write_back cycle
        display_task();
        
        $display(" === Test finished === ");
        $finish;
    end
    
    task display_task;
        $display("Cycle: %b | Instruction: %b | Cmd_Const8: %b | Reg1: %b | uAdress: %b |  PC_wr_en: %b | Const8_en: %b | Const8_h_sel: %b | Rf_regw_en: %b | Reg_regr_en: %b | ALU_cmd: %b | ALU_result_en: %b",
                tb_cu.cu.u_cycle.currentState, instruction_word, cmd_const8, cu_reg1, tb_cu.cu.u_rom.u_address , cu_pc_wr_en, cu_const8_en, cu_const8_h_sel, cu_rf_regw_en, cu_rf_regr_en, cu_alu_cmd, cu_alu_result_en);
    endtask;
endmodule
