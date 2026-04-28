`timescale 1ns / 1ps

// Asyncronous Reset Enableable D Flip Flop
module re_ff
            #(parameter WIDTH=16)
            (input clk,
             input reset,
             input enable,
             input [WIDTH-1:0] d,
             output logic [WIDTH-1:0] q);
             
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            q <= 0;
        else begin
            if(enable)
                q <= d;
        end;
    end;
endmodule
