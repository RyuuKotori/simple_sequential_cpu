`timescale 1ns / 1ps

module im_mplx (
        input [15:0] next_counter, 
        input tri [15:0] idb, 
        input cu_idb_to_pc,
        output logic [15:0] counter_state
    );
    
    always_comb begin
        if (cu_idb_to_pc == 0) 
            counter_state <= next_counter;
        else
            counter_state <= idb;
    end
    
endmodule
