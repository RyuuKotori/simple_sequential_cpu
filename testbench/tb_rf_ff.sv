`timescale 1ns / 1ps

// Test completed
module tb_re_ff();
    // Internal
    logic [3:0] expectedQ;

    // External
    logic clk;
    logic reset;
    logic enable;
    logic [3:0] q;
    logic [3:0] d;
    re_ff #(4) reff (.clk(clk),
                     .enable(enable),
                     .reset(reset),
                     .d(d),
                     .q(q));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        d = 0;
        reset = 1; #1; reset = 0; #9;
        $display(" === Test started === ");
        
        // Test enable
        enable = 0;
        d = 0'b1111;
        expectedQ = 0'b0000; #10;
        display_task();
        check_task();
        
        // Test no change when no rising edge
        enable = 1;
        d = 0'b1111; 
        expectedQ = 0'b0000; #3;
        display_task();
        check_task(); 
        d = 0'b0000; #7;
        
        // Test reset
        enable = 1;
        d = 0'b1111; #10;
        d = 0'b0000;
        reset = 1; #1; reset = 0;
        expectedQ = 0'b0000;
        display_task();
        check_task(); #9;
        
        // Test normal
        enable = 1;
        d = 0'b1010;
        expectedQ = 0'b1010; #10;
        display_task();
        check_task();
        
        // Test store
        enable = 0;
        expectedQ = 0'b1010; #10;
        display_task();
        check_task();
        
        $display(" === Test finished === ");
        $finish;
    end
    
    task check_task;
        if(q != expectedQ)
            $error("Q (%b) is different from expected (%b)", q, expectedQ); 
        else
            $display("\t Test case successfull");
    endtask;
    
    task display_task;
        $display("Current State: %b", q);
    endtask;
endmodule
