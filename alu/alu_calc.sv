`timescale 1ns / 1ps

module alu_calc
               #(parameter WIDTH=16)
               (input [2:0] opcode,
                input [WIDTH-1:0] acc,
                input [WIDTH-1:0] isb,
                output logic overflow,
                output logic [WIDTH-1:0] calc_result);
                
    always_comb begin
        case(opcode)
            3'b000: { overflow, calc_result} = (acc + isb);
            default: calc_result = 'b0;
        endcase
    end
endmodule
