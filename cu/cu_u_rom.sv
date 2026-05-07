`timescale 1ns / 1ps

module cu_u_rom(input [15:0] u_address,
                output logic [31:0] u_data);
    
    always_comb begin
        case(u_address)
            4'h0000: u_data = 8'h0000_0000;
            4'h0001: u_data = 8'h0000_0000;
            4'h0002: u_data = 8'h0000_0000;
            4'h0003: u_data = 8'h0000_0040;
            default: u_data = 8'h0000_0000;
        endcase;
    end
endmodule
