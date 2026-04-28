`timescale 1ns / 1ps

// Test completed
module tb_tristate_buffer();
    // Internal
    logic [3:0] expectedQ;
    
    // External
    logic [3:0] d;
    tri [3:0] q;
    logic enable;
    
    tristate_buffer #(4) t_buffer (.d(d),
                                   .enable(enable),
                                   .q(q));
                              
    initial begin
        d = 4'b0000;
        enable = 0; #5;
        $display(" === Test started === ");
        
        expectedQ = 4'b1010;
        d = 4'b1010;
        enable = 1; #5;
        display_task();
        check_task();
        
        expectedQ = 4'bzzzz;
        d = 4'b1010;
        enable = 0; #5;
        display_task();
        check_task();
        
        expectedQ = 4'b0000;
        d = 4'b0000;
        enable = 1; #5;
        display_task();
        check_task();
        
        expectedQ = 4'bzzzz;
        d = 4'b0000;
        enable = 0; #5;
        display_task();
        check_task();
        
        $display(" === Test finished === ");
        $finish;
    end;
    
    task check_task;
        if(q != expectedQ)
            $error("Q (%b) is different from expected (%b)", q, expectedQ);
        else
            $display("\t Test case successfull");
    endtask;
    
    task display_task;
        $display("d: %b | enable: %b | q: %b", 
                  d, enable, q);
    endtask;
endmodule
