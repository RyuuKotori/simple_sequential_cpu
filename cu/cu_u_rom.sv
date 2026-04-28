`timescale 1ns / 1ps

module cu_u_rom(input [15:0] u_address,
                output [31:0] u_data);
    
    reg [31:0] memory [15:0];
    
    assign u_data = memory[u_address];
    
    initial begin
        memory[0] = 32'h0000_0000;
        memory[1] = 32'h0000_0000;
        memory[2] = 32'h0000_0000;
        memory[3] = 32'h0000_0040;
    end
endmodule
