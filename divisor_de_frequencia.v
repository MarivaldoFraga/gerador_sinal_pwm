module divisor_de_frequencia(

	input clock,
	
	output reg saida
	
);
	
	parameter INICIAL = 27'd0, PASSO = 27'd1;
	
	reg [26:0] contador = INICIAL;
	
	initial saida = 0;
	
	always @ (posedge clock) if (contador == INICIAL) saida = !saida;
	
	always @ (posedge clock) contador = contador + PASSO ;
		
endmodule
