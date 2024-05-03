`timescale 1ns / 1ps


module clck_psc(input logic CLK100MHZ,
                output logic clk_out );
    
    
    logic [31:0]myreg;
    
    always @(posedge CLK100MHZ)
        myreg +=1;
       
    assign clk_out = myreg[26];
    
endmodule

