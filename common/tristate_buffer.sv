`timescale 1ns / 1ps

module tristate_buffer
                    #(parameter WIDTH=16)
	                (input [WIDTH-1:0] d,
		             input enable,
		             output tri [WIDTH-1:0] q );
		             
    assign q = enable ? d : 'bZ;
endmodule
