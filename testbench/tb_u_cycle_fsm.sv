`timescale 1ns / 1ps

// Test completed
module tb_u_cycle_fsm();
    // Internal
    logic [1:0] expectedState;
    
    // External
    logic clk;
    logic [1:0] state;
    
    cu_u_cycle_fsm fsm (.clk(clk),
                     .uState(state));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        expectedState = 0;
        $display(" === Test started === ");
        
        for(int i = 0, max = 4 * 4; i < max; i++) begin
            display_task();
            check_task();
            
            expectedState++;
            if(expectedState >= 4) begin
                expectedState = 0;
            end
            #10;
        end
        
        $display(" === Test finished === ");
        $finish;
    end
    
    task check_task;
        if(state != expectedState)
            $error("State (%b) is different from expected (%b)", state, expectedState); 
        else
            $display("\t Test case successfull");
    endtask;
    
    task display_task;
        $display("Current State: %b", state);
    endtask;
endmodule
