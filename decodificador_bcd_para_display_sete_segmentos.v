module decodificador_bcd_para_display_sete_segmentos (
	
	input
		[3:0]
			entrada,
			
	output reg 
		[6:0]
			saida
			
);
	
	parameter 
		[6:0] 
			ZERO = 7'b1111110,
			UM = 7'b0110000,
			DOIS = 7'b1101101,
			TRES = 7'b1111001,
			QUATRO = 7'b0110011,
			CINCO = 7'b1011011,
			SEIS = 7'b1011111,
			SETE = 7'b1110000,
			OITO = 7'b1111111,
			NOVE = 7'b1111011,
			ERRO = 7'b0110000;
	
	initial saida = ZERO;

	// circuito sequencial assincrono que atualiza a saida conforme entrada
	always @ (entrada)
		case (entrada)
			0: saida = ZERO;
			1: saida = UM;
			2: saida = DOIS;
			3: saida = TRES;
			4: saida = QUATRO;
			5: saida = CINCO;
			6: saida = SEIS;
			7: saida = SETE;
			8: saida = OITO;
			9: saida = NOVE;
			default: saida = ERRO;
		endcase
endmodule
