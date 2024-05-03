`timescale 1ns / 1ps

module  fsm_example1(
    input logic clk,      
    input logic reset,    
    input logic TA,                
    input logic TB,                 
    input logic E, 
    input logic T,                                    
   //output logic [2:0] salida,      
    output logic ledVA1,         // luz verde 1   
    output logic ledAA1,         // luz amarilla 1
    output logic ledRA1,         // luz roja 1  
    output logic ledVB2,         // luz verde 2      
    output logic ledAB2,         // luz amarilla 2
    output logic ledRB2          // luz roja 12   
);

    typedef enum logic [2:0] {          
        S0 = 3'b000,                    // s0 se denine com un estado de 3 bits 
        S1 = 3'b001,                    // s1 se denine com un estado de 3 bits 
        S2 = 3'b010,                    // s2 se denine com un estado de 3 bits 
        S3 = 3'b011,                    // s3 se denine com un estado de 3 bits 
        S4 = 3'b100                     // s4 se denine com un estado de 3 bits 
    } state;                        
     
    state current_state, next_state;       // variables que puedene obtener loa valores en state        
     
    always_ff @(posedge clk or posedge reset)        // definimos el flip-flop
    begin
        if(reset)
            current_state <= S0;                 //si reset esta en un 1 lógico el estado sera S0
     
        else
            current_state <= next_state;           
    end

    // ESTADOS DE LA MAQUINA
    always_comb                                   
    begin
        case(current_state)                                             
            S0: begin                                                   
                next_state = (TA) ? S0 : S1;            // si  Ta es 1, entoncer permanence en el estado s0 de lo contario pasa a s1                 
                if(E) next_state = S0;
                if(T) next_state = S4;                  // si e es 1 se pasa a estado s0                
            end
            
            S1: begin                                                  
                next_state = S2;                         // S1 pasa al estado S2                
                if(E) next_state = S0;  
                if(T) next_state = S4;                   // si e es 1 se pasa a estado s0                
            end
            
            S2: begin                                                   
                next_state = (TB) ? S2 : S3;             // si  TB es 1, entoncer permanence en el estado s2 de lo contario pasa a s3              
                if(E) next_state = S0; 
                if(T) next_state = S4;                  // si e es 1 se pasa a estado s0                 
            end
            
            S3: begin                                                                              
                next_state = S3;                         // s3 pasa al estado s0               
                if(E) next_state = S0;
                if(T) next_state = S4;                    // si e es 1 se pasa a estado s0                
            end
           
            S4: begin                                                  
               next_state = (T) ? S4 : ((TA || TB) ? S0 : S4);         // si TA y TB son 1 pasa al estado s4             
               if(E) next_state = S0;                    // si e es 1 se pasa a estado s0                
            end 
            
            default: next_state = S0;                                   
        endcase
    end
       // definimos los colores dependiendo del estado que se encuntre 
    assign salida = current_state;                                       
    assign ledVA1 = (current_state == S0);                                 
    assign ledAA1 = (current_state == S1);  
    assign ledRA1 = (current_state == S2) || (current_state == S3) || (current_state == S4);       
    assign ledVB2 = (current_state == S2);                               
    assign ledAB2 = (current_state == S3);   
    assign ledRB2 = (current_state == S0) || (current_state == S1) || (current_state == S4);       
      
endmodule