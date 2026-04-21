--=====RESUMO E OBJETIVO=====
--	O objetivo desse trabalho é fazer um contador que usa um registrador de 4bits e um somador 4bits, e o resultado será
--representado por um display de 7 segmentos. Além disso foi adiciona um "switch" CLEAR.
---------
--	Um registrador possuirá 4 flip-flops do tipo D, sua saída "q" será adicionada a um somador de 4bits que sempre será somado
-- +1 a cada DESCIDA(0) do clock. O somador INICIADO em 0 deve devolver o resultado para o registrador.
--	O resultados serão representados no display de 7 segmentos em HEXADECIMAL por meio de um SIGNAL entre o registrador e
--o somador.
--==========

library ieee;
USE ieee.std_logic_1164.all;

ENTITY cont7seg IS  --Função PRINCIPAL que tem a função de conectar todos os segmetos em um contador de 4 bits.
	PORT(mCLOCK, mCLEAR:IN BIT; --"mCLOCK" vai ser um Push-button com 2.5V SCHMITT TRIGGER.
		  LED : INOUT BIT_VECTOR(7 DOWNTO 0); --Para o DISPLAY de 7 segmentos +DP(ponto).
		  EXITBIN : OUT BIT_VECTOR(3 DOWNTO 0)); --Usado para gerenciar a saída do registrador.
END cont7seg;

ARCHITECTURE box OF cont7seg IS
	SIGNAL exitRegY : BIT_VECTOR(3 DOWNTO 0); --Ponto intermediário entre a saída "q" do Registrador(REG) e a entrada "a" do somador(Func_soma).
	SIGNAL exitFuncSomaY : BIT_VECTOR(3 DOWNTO 0); --Ponto intermediário entre a entrada "d" do Registrador(REG) e a saída "s" do somador(Func_soma).
	
	
	COMPONENT REG IS --=========Chamada da função "REG.vhd"=========--
		PORT(Rclk, Rclr: IN BIT;
			  Rd: IN BIT_VECTOR(3 DOWNTO 0);
			  Ry: OUT BIT_VECTOR(3 DOWNTO 0));
	END COMPONENT REG;
	
	COMPONENT Func_soma IS --=========Chamada da função "Func_soma.vhd"=========--
	PORT (fA : IN BIT_VECTOR(3 DOWNTO 0);
			fS_OUT: OUT BIT_VECTOR(3 DOWNTO 0));
	END COMPONENT Func_soma;
	
	
	COMPONENT DISPLAY IS --=========Chamada da função "DISPLAY.vhd"=========--
	PORT (d1,d2,d3,d4 : IN BIT;
			a, b, c, d, e, f, g, h : OUT BIT);
	END COMPONENT DISPLAY;

BEGIN
	
	regg: REG Port Map (Rclk => mCLOCK, Rclr => mCLEAR, --Sincronia do CLOCK e CLEAR com o registrador.
						    Rd(0) => exitFuncSomaY(0), Rd(1) => exitFuncSomaY(1), Rd(2) => exitFuncSomaY(2), Rd(3) => exitFuncSomaY(3), --Ponto intermediário da entrada(Rd) "d" com a saida "s" do somador.
							 Ry(0) => exitRegY(0), Ry(1) => exitRegY(1), Ry(2) => exitRegY(2), Ry(3) => exitRegY(3)); --Ponto intermediário de saída(Ry) "q" com a entrada "a" do somador.
	
	Rsoma: Func_soma Port Map (fA(0) => exitRegY(0), fA(1) => exitRegY(1), fA(2) => exitRegY(2), fA(3) => exitRegY(3), --Ponto intermediário da entrada(fA) "a" com a saída "q" do registrador.
										fS_OUT(0) => exitFuncSomaY(0), fS_OUT(1) => exitFuncSomaY(1), fS_OUT(2) => exitFuncSomaY(2), fS_OUT(3) => exitFuncSomaY(3)); --Ponto intermediário de saída(fS_OUT) "s" com a entrada "d" do registrador.
	
	
	EXITBIN(0) <= exitRegY(0); --Saída posta em LED's dos valores do registrador.
	EXITBIN(1) <= exitRegY(1);
	EXITBIN(2) <= exitRegY(2);
	EXITBIN(3) <= exitRegY(3);
	
	Disp: DISPLAY Port Map (d1 => exitRegY(3), d2 => exitRegY(2), d3 => exitRegY(1), d4 => exitRegY(0), --Sincronia dos valores de saída do registrador com os valores sensíveis usados no DISPLAY.
									a => LED(0), b => LED(1), c => LED(2), d => LED(3), e => LED(4), f => LED(5), g => LED(6), h => LED(7)); --Sincronia dos LED's de 7 segmentos com as pinagems; Incluido o DP(ponto).
	
END box;