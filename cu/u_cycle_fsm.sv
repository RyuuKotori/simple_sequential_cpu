`timescale 1ns / 1ps

module cu_u_cycle_fsm(input clk,
                      input reset,
                      output reg[1:0] uState);
    typedef enum logic[1:0] {FETCH = 2'b00, DECODE = 2'b01, EXECUTE = 2'b10, WRITE_BACK = 2'b11} t_uState;
    t_uState currentState = FETCH;
    t_uState nextState;
    
    always_ff @(posedge clk, posedge reset) begin
        if(reset)
            currentState <= FETCH;
        else
            currentState <= nextState;
    end;
    
    always_comb begin
        case(currentState)
            FETCH: nextState = DECODE;
            DECODE: nextState = EXECUTE;
            EXECUTE: nextState = WRITE_BACK;
            WRITE_BACK: nextState = FETCH;
        endcase;
    end;
    
    assign uState = currentState;
endmodule
