`timescale 1ns / 1ps

module rf_const_wr(input [7:0] const8,
                   input [15:0] last_idb,
                   input cu_const8_en,
                   input cu_const8_h_sel,
                   output logic [15:0] idb);
    
    always_comb begin
        if(cu_const8_en == 0) begin
            idb <= 16'bz;
        end
        else
        begin
            case(cu_const8_h_sel)
                1'b0: idb <= { 8'b0, const8 };
                1'b1: idb <= { const8, last_idb [7:0] };
            endcase;
        end;
    end
endmodule
