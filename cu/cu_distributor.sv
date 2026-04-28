`timescale 1ns / 1ps

module cu_distributor(input [25:0] uCode,
                      output logic cu_inc_pc,
                      output logic cu_const8_en,
                      output logic cu_const8_h_sel,
                      output logic cu_rf_regw_en,
                      output logic cu_rf_regr_en,
                      output logic [2:0] cu_alu_cmd,
                      output logic cu_alu_result_en,
                      output logic [15:0] cu_remain);
    
    always_comb begin
        cu_inc_pc           <= uCode[0];
        cu_const8_en        <= uCode[1];
        cu_const8_h_sel     <= uCode[2];
        cu_rf_regw_en       <= uCode[3];
        cu_rf_regr_en       <= uCode[4];
        cu_alu_cmd          <= uCode[7:5];
        cu_alu_result_en    <= uCode[8];
        cu_remain           <= uCode[25:9];
    end;
endmodule
