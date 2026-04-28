`timescale 1ns / 1ps

module tb_alu_calc();
    // External
    logic [15:0] expectedResult;
    logic expectedOverflow;

    // Internal
    logic [2:0] opcode;
    logic [15:0] acc;
    logic [15:0] isb;
    logic overflow;
    logic [15:0] result;

    alu_calc #(16) calc (.opcode(opcode),
                         .acc(acc),
                         .isb(isb),
                         .overflow(overflow),
                         .calc_result(result));
                   
    initial begin
        opcode = 3'b000;
        acc = 4'h0000;
        isb = 4'h0000; #5;
        $display(" === Test started === ");
        
        // Add 5+3+8
        opcode = 3'b000;
        acc = 16'b1111_1111_0000_1001;
        isb = 16'b0000_0000_0110_1101;
        overflow = 0;
        expectedResult = 16'b1111_1111_0111_0110; #5;
        display_task();
        check_task();
        
        // Add 5+3+8 with overflow
        opcode = 3'b000;
        acc = 16'b0101_0101_0101_0101;
        isb = 16'b1010_1010_1010_1011;
        overflow = 1;
        expectedResult = 16'b0000_0000_0000_0000; #5;
        display_task();
        check_task();
        
        $display(" === Test ended === ");
        $finish;
    end
    
    task check_task;
        if(result != expectedResult)
            $error("Result (%b) is different from expected (%b)", result, expectedResult); 
        else if(expectedOverflow != overflow)
            $error("Overflow (%b) is different from expected (%b)", overflow, expectedOverflow);
        else
            $display("\t Test case successfull");
    endtask;
    
    task display_task;
        $display("opcode: %b | acc: %b | isb: %b | result: %b | overflow: %b", 
                  opcode, acc, isb, result, overflow);
    endtask;
endmodule
