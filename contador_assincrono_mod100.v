module contador_assincrono_mod100(clock, reset, modo_contagem, saida);

	input	modo_contagem, clock, reset;
		
	output reg [6:0] saida;
	
	parameter INICIAL = 7'd0, LIMITE = 7'd99, PASSO = 7'd1;		

	initial saida = INICIAL;
	
	always @ (posedge clock or negedge reset)
	
		if (!reset) saida = INICIAL;
		
		else begin 
		
			if (modo_contagem) saida = saida == INICIAL ? INICIAL : saida - PASSO;
		
			else saida = saida == LIMITE ? LIMITE : saida + PASSO;
			
		end
		
endmodule
