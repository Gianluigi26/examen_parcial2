`timescale 1ns / 1ps

module FSM_TB;
    //entradas
     logic clk;
     logic reset;
     logic TA;
     logic TB;
     logic E;
      logic T;
     logic ledVA1;            
     logic ledAA1;         
     logic ledRA1;            
     logic ledVB2;            
     logic ledAB2;         
     logic ledRB2;
    //se combina con Design Source flip_flop_D
    fsm_example1 dut (
        .clk(clk),
        .reset(reset),
        .TA(TA),
        .TB(TB),
        .E(E),
        .T(T),
        
        .ledVA1(ledVA1),
        .ledAA1(ledAA1),
        .ledRA1(ledRA1),
        .ledVB2(ledVB2),
        .ledAB2(ledAB2),
        .ledRB2(ledRB2)
    );
    initial
    begin
        //se indica el valor de la entradas
                reset <=1;   #40;
reset <= 0; TA <=1; TB <=0;  E<=0; T <=0;   #40;
reset <=0;  TA <=0; TB <=1;  E<=0; T <=0;   #40;
reset <=0;  TA <=0; TB <=1;  E<=0; T <=0;   #40;
reset <=0;  TA <=0; TB <=1;  E<=1; T <=0;   #40;
reset <=0;  TA <=1; TB <=1;  E<=0; T <=1;   #40;
reset <=0;  TA <=1; TB <=1;  E<=1; T <=0;   #40;
     // Termina la simulación
    end  
    always
    begin
        clk <=1; #5;
        clk <=0; #5;
    end
endmodule
