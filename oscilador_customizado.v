module oscilador_customizado(clock, reset, habilitar_contagem, pulso);
	
	input clock, reset, habilitar_contagem;
		
	output reg pulso;
	
	parameter INICIAL = 8'd0, PASSO = 8'd1, LIMITE = 8'd10, METADE = 8'd5;
	
	initial pulso = 0;
	
	reg [7:0] contador = INICIAL;
	
	always @ (posedge clock or negedge reset) begin
		
		if (!reset) begin
			
			pulso = 0;
			
			contador = INICIAL;
			
		end else begin
		
			if (habilitar_contagem) begin
				
				if (contador <= INICIAL + PASSO) pulso = !pulso;
				
				else if (contador >= LIMITE) pulso = !pulso;
			
				contador = contador <= LIMITE ? contador + PASSO : contador - METADE;
				
			end else begin
				
				pulso = 0;
				
				contador = INICIAL;
				
			end
		
		end
		
	end
	
endmodule
