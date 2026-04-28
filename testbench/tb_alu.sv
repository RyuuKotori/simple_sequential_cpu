`timescale 1ns / 1ps

module tb_alu();
    // External
    logic [15:0] expectedAluResult;
    
    // Internal
    logic clk;
    logic reset;
    logic aluResultEnable;
    logic [2:0] opcode;
    logic [15:0] acc;
    logic [15:0] isb;
    tri [15:0] alu_result;
    
    alu  #(16) alu (.clk(clk),
                    .reset(reset),
                    .alu_result_enable(aluResultEnable),
                    .opcode(opcode),
                    .acc(acc),
                    .isb(isb),
                    .alu_result(alu_result));
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1; #1; reset = 0;
        aluResultEnable = 0;
        opcode = 0;
        acc = 0;
        isb = 0;  #10;
        
        $display(" === Test started === ");
        
        // Task Add 5+3+8
        aluResultEnable = 1;
        opcode = 0;
        acc = 16'b1111_1111_0000_0000;
        isb = 16'b0000_0000_1111_1111; 
        expectedAluResult = 16'b1111_1111_1111_1111; #10;
        display_task();
        check_task();
        
        // Task Add 5+3+8 with overflow
        aluResultEnable = 1;
        opcode = 0;
        acc = 16'b1111_1111_0000_0001;
        isb = 16'b0000_0000_1111_1111; 
        expectedAluResult = 16'b0000_0000_0000_0000; #10;
        display_task();
        check_task();
        
        
        // Disable output
        aluResultEnable = 0;
        opcode = 0;
        acc = 16'b1111_1111_0000_0000;
        isb = 16'b0000_0000_1111_1111;
        expectedAluResult = 16'b0000_0000_0000_0000; #10;
        display_task();
        check_task();
        
        $display(" === Test finished === ");
        $finish;
    end;
    
    task check_task;
        if(alu_result != expectedAluResult)
            $error("ALU_Result (%b) is different from expected (%b)", alu_result, expectedAluResult); 
        else
            $display("\t Test case successfull");
    endtask;
    
    
    task display_task;
        $display("opcode: %b | acc: %b | isb: %b | enable: %b, result: %b", 
                  opcode, acc, isb, aluResultEnable, alu_result);
    endtask;
endmodule
