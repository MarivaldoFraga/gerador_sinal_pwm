module top (btn_mais, btn_menos, clock, reset, display_ls, display_ms, led);

	input btn_mais, btn_menos, clock, reset;
	
	output reg [6:0] display_ls, display_ms;
	
	output reg led;
	
	wire habilitar_contagem, modo_contagem, pulso;
	
	
	interface_de_entrada interface_de_entrada_1 (
		.clock(clock),
		.reset(reset),
		.btn_mais(btn_mais),
		.btn_menos(btn_menos),
		.habilitar_contagem(habilitar_contagem),
		.modo_contagem(modo_contagem)
	);
	
	oscilador_customizado oscilador_customizado_1 (
		.clock(clock),
		.reset(reset),
		.habilitar_contagem(habilitar_contagem),
		.pulso(pulso)
	);
	
	contador_assincrono_mod100 contador_assincrono_mod100_1 (
		.clock(clock),
		.reset(reset),
		.modo_contagem(modo_contagem)
	);
	
	
endmodule
