`timescale 1ns / 1ps

module rf(input clk,
          input reset,
          input [2:0] cu_reg1,
          input [7:0] cu_const8,
          input cu_const8_en,
          input cu_const8_h_sel,
          input cu_rf_regw_en,
          input cu_rf_regr_en,
          inout logic [15:0] idb,
          output logic [15:0] acc,
          output logic [15:0] mar,
          output logic [15:0] mdr,
          output logic [15:0] r1,
          output logic [15:0] r2,
          output logic [15:0] r3,
          output logic [15:0] r4,
          output logic [15:0] r5);
          
    logic [15:0] rf_idb_last;
    
    re_ff rf_last (.clk(clk),
                   .reset(reset),
                   .d(idb),
                   .q(rf_idb_last));
                      
    rf_const_wr const_wr (.const8(cu_const8),
                          .last_idb(rf_idb_last),
                          .cu_const8_en(cu_const8_en),
                          .cu_const8_h_sel(cu_const8_h_sel),
                          .idb(idb));
                          
    rf_memory mem (.clk(clk),
                  .reset(reset),
                  .cu_reg1(cu_reg1),
                  .cu_rf_regw_en(cu_rf_regr_en),
                  .cu_rf_regr_en(cu_rf_regr_en),
                  .idb_in(idb),
                  .idb_out(idb),
                  .acc(acc),
                  .mar(mar),
                  .mdr(mdr),
                  .r1(r1),
                  .r2(r2),
                  .r3(r3),
                  .r4(r4),
                  .r5(r5));
endmodule
