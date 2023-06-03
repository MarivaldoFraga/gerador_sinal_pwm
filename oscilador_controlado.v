module oscilador_controlado(

	input 
		enable,
		clock,
		
	output 
		reg saida
		
);
	reg [3:0] contador = 0;
	
	initial saida = 0;
	
	always @ (posedge clock) 
		if (enable) contador <= contador < 15 ? contador + 1 : contador;
		else contador = 0;
		
	always @ (clock) 
		if (contador == 1 || contador == 15) saida = !saida;
	
endmodule
