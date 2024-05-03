`timescale 1ns / 1ps

module simulacion_TB(
    // Declaración de señales
    input logic clk,
    output logic reset,
    output logic TA,
    output logic TB,
    output logic E,
    output logic ledVA1,            
    output logic ledAA1,         
    output logic ledRA1,            
    output logic ledVB2,            
    output logic ledAB2,         
    output logic ledRB2
);

    // Instancia del DUT (Device Under Test)
    fsm_example1 dut (
        .clk(clk),
        .reset(reset),
        .TA(TA),
        .TB(TB),
        .E(E),
        
        .ledVA1(ledVA1),
        .ledAA1(ledAA1),
        .ledRA1(ledRA1),
        .ledVB2(ledVB2),
        .ledAB2(ledAB2),
        .ledRB2(ledRB2)
    );
    
    // Bloque de inicialización
    initial
     begin
                reset <=1;   #40;
reset <= 0; TA <=1; TB <=0;  E<=0; #40;
reset <=0;  TA <=0; TB <=1;  E<=0; #40;
reset <=0;  TA <=1; TB <=1;  E<=0; #40;
reset <=0;  TA <=0; TB <=1;  E<=1; #40;
reset <=0;  TA <=1; TB <=0;  E<=1; #40;
reset <=0;  TA <=1; TB <=1;  E<=1; #40;
     // Termina la simulación
  end
    
    always
     begin
    clk = 1;   #5;  // Asigna el valor 1 al reloj
    #5;             // Espera un retraso
    clk = 0;   #5;  // Asigna el valor 0 al reloj
    #5;             // Espera otro retraso
end
    
endmodule