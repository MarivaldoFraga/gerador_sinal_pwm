module contador_assincrono_mod100(

	input
		modo,
		clock,
		reset,
		
	output reg [6:0] saida
		
);
	
	parameter [6:0] INICIAL = 0, LIMITE = 99, PASSO = 1;		

	initial saida = INICIAL;
	
	always @ (posedge clock or posedge reset)
		if (reset) saida <= INICIAL;
		else if (modo) saida <= saida - PASSO;
		else saida <= saida + PASSO;
		
endmodule
