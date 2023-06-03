module interface_de_controle (

	input
		btn_mais,
		btn_menos,
		clock,
		reset,
		
	output reg
		habilitar_contagem,
		modo_contagem
		
);
	
	parameter
		[1:0]
			ESPERANDO = 0,
			INCREMENTANDO = 1,
			DECREMENTANDO = 2;
	
	reg [1:0] estado;
	
	initial estado = ESPERANDO;
	
	
	//Decoficador de saída;
	always @ (estado)
		case(estado)
		
			ESPERANDO:
				begin
					habilitar_contagem = 0;
					modo_contagem = 0;
				end
				
			INCREMENTANDO:
				begin
					habilitar_contagem = 1;
					modo_contagem = 0;
				end
				
			DECREMENTANDO:
				begin
					habilitar_contagem = 1;
					modo_contagem = 1;
				end
				
			default:
				begin
					habilitar_contagem = 0;
					modo_contagem = 0;
				end
		endcase
	

	//Decodificador de próximo estado
	always @ (posedge clock, posedge reset)
	
		if (reset) estado <= ESPERANDO;
		
		else 
			case (estado)
				ESPERANDO:
					if (btn_mais ~^ btn_menos) estado <= ESPERANDO; //xnor
					else if (btn_mais) estado <= INCREMENTANDO;
					else estado <= DECREMENTANDO;
					
				INCREMENTANDO:
					if (btn_mais) estado <= INCREMENTANDO;
					else estado <= ESPERANDO;
					
				DECREMENTANDO:
					if (btn_menos) estado <= DECREMENTANDO;
					else estado <= ESPERANDO;
					
				default:
					estado <= ESPERANDO;
			endcase
	
endmodule