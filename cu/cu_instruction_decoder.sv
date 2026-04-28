`timescale 1ns / 1ps

module cu_instruction_decoder(input [15:0] instruction_word,
                              output logic [7:0] u_adress,
                              output logic [7:0] cmd_const8,
                              output logic [2:0] cu_reg1);
    always_comb begin
        cmd_const8 = instruction_word[7:0];
        if (instruction_word[15] == 1) begin
            if(instruction_word[14] == 1) begin
                u_adress = {instruction_word[15:11] , 3'b000};
                cu_reg1 = instruction_word[10:8];
            end;
        end
        else begin
            u_adress = instruction_word[15:8];
        end
    end
endmodule
