`timescale 1ns / 1ps

module rf_memory(input clk,
                 input reset,
                 input [2:0] cu_reg1,
                 input cu_rf_regw_en,
                 input cu_rf_regr_en,
                 input logic [15:0] idb_in,
                 output logic [15:0] idb_out,
                 output logic [15:0] acc,
                 output logic [15:0] mar,
                 output logic [15:0] mdr,
                 output logic [15:0] r1,
                 output logic [15:0] r2,
                 output logic [15:0] r3,
                 output logic [15:0] r4,
                 output logic [15:0] r5);
                 
    logic [2:0] mem [15:0];
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            for (int j=0; j < 8; j=j+1) begin
                mem[j] <= 16'b0; //reset array
            end
        else begin
            if(cu_rf_regw_en) begin
                mem[cu_reg1] <= idb_in;
            end;
        end;
    end;
    
    always_comb begin
        if(cu_rf_regr_en) begin
            idb_out <= mem[cu_reg1];
        end;
        if(~cu_rf_regr_en && ~cu_rf_regw_en) begin
            idb_out <= 16'bz;
        end;
    end;
    
    assign acc = mem[0];
    assign mar = mem[1];
    assign mdr = mem[2];
    assign r1 = mem[3];
    assign r2 = mem[4];
    assign r3 = mem[5];
    assign r4 = mem[6];
    assign r5 = mem[7];
endmodule
