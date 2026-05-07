`timescale 1ns / 1ps

module counter
    #(parameter WIDTH=16) (
        input [WIDTH-1: 0] d,
        output logic [WIDTH-1: 0] q
    );
    
    always_comb begin
      q = d + 1;  
    end
endmodule
