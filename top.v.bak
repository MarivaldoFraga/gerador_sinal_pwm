include "interface_de_controle.v"
include  ""

module main (
	
	input btn_mais, btn_menos, clock, reset
	
	output reg[6:0] display_msb, display_lsb;
	
);

	wire habilitar_contagem, modo_contagem, saida_ddf;

	interface_de_controle idc_1(.btn_mais(btn_mais), .btn_menos(btn_menos) .habilitar_contagem(habilitar_contagem), modo_contagem(modo_contagem));
	
	divisor_de_frequencia ddf(.clock(clock) , .saida(saida_ddf) )
	
	contador_assincrono_mod100 cam100(.modo(modo_contagem), .clock(saida_ddf), .reset(reset) .saida())
	
endmodule
