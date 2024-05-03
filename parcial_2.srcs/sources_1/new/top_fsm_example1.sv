`timescale 1ns / 1ps

module top_fsm_example1(
    input logic CLK100MHZ,
    input logic [3:0] sw,                    
    output logic [5:0]LED            
  
);

    logic clk_out;
    
    clck_psc my_clck (CLK100MHZ,clk_out);
    fsm_example1 example (
        .clk(clk_out),
        .TA(sw[0]),
        .TB(sw[1]),
        .E(sw[2]),
        .T(sw[3]),
        .ledVA1(LED[0]),
        .ledAA1(LED[1]),
        .ledRA1(LED[2]),
        .ledVB2(LED[3]),
        .ledAB2(LED[4]),
        .ledRB2(LED[5])
    );
    
   // assign LED[6] = internal_psc_clock;
    
endmodule
