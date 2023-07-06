module divisor_de_frequencia(clock, reset, saida);

	input clock, reset;
	
	output reg saida;
	
	parameter INICIAL = 27'd0, PASSO = 27'd1;
	
	reg [26:0] contador = INICIAL;
	
	initial saida = 0;
	
	always @ (posedge clock or negedge reset) begin
		
		if (!reset) contador = INICIAL;
		
		else begin
			
			if (contador == INICIAL) saida = !saida;
			
			contador = contador + PASSO;
			
		end
		
	end
		
endmodule
