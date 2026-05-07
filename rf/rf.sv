`timescale 1ns / 1ps

module rf(input clk,
          input reset,
          input [2:0] cu_reg1,
          input [7:0] cu_const8,
          input cu_const8_en,
          input cu_const8_h_sel,
          input cu_rf_regw_en,
          input cu_rf_regr_en,
          output logic [15:0] idb,
          output logic [15:0] acc,
          output logic [15:0] mar,
          output logic [15:0] mdr,
          output logic [15:0] r1,
          output logic [15:0] r2,
          output logic [15:0] r3,
          output logic [15:0] r4,
          output logic [15:0] r5);
          
    logic [15:0] rf_idb;
    
    re_ff rf_acc (.clk(clk),
                  .reset(reset),
                  .en(),
                  .d(rf_idb),
                  .q(acc));
                  
    re_ff rf_mar (.clk(clk),
                  .reset(reset),
                  .en(),
                  .d(rf_idb),
                  .q(mar));
                  
    re_ff rf_mdr (.clk(clk),
                  .reset(reset),
                  .en(),
                  .d(rf_idb),
                  .q(mdr));
                  
    re_ff rf_r1  (.clk(clk),
                  .reset(reset),
                  .en(),
                  .d(rf_idb),
                  .q(r1));
                  
    re_ff rf_r2  (.clk(clk),
                  .reset(reset),
                  .en(),
                  .d(rf_idb),
                  .q(r2));
                  
    re_ff rf_r3  (.clk(clk),
                  .reset(reset),
                  .en(),
                  .d(rf_idb),
                  .q(r3));
                  
    re_ff rf_r4  (.clk(clk),
                  .reset(reset),
                  .en(),
                  .d(rf_idb),
                  .q(r4));
                  
    re_ff rf_r5  (.clk(clk),
                  .reset(reset),
                  .en(),
                  .d(rf_idb),
                  .q(r5));
    
    assign idb = rf_idb;
endmodule
