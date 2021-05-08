`timescale 1ns/1ps

//Declaracion del modulo
module tb_ProyectoFinal;

//Señales
reg tb_clk;
integer i;

//Instanciar DUT
ProyectoFinal Final0(
    .clk(tb_clk)
);

//Generador de Reloj
initial begin 
    tb_clk = 1;

    for (i = 0;i < 109;i = i+1) 
        begin
            tb_clk = ~tb_clk;
            #1;
        end
    $stop;
end



endmodule 