LIBRARY ieee;
USE ieee.std_logic_1164.all;
		--Flip Flop do tipo D; com "Clear".
ENTITY neg_d IS 
PORT(
	clk, d, clr: IN BIT; --clk= Clock; clr=Clear.
	q: OUT BIT);
END neg_d;

ARCHITECTURE simple OF neg_d IS
BEGIN
	PROCESS(clk,clr) --Será sensível as mudanças de "clk", "clr".
	BEGIN
		IF clr = '0' THEN
			q <= '0'; --Caso o Clear seja ativado tudo passa a receber 0 na saída.
		ELSIF(clk'EVENT AND clk ='0') THEN --Se a interação com o Clock for feita, no momento de descida do clock(0), acontecerá:
			q <= d; --"q" recebe o valor lógico que "d" recebeu do  somador lógico "Func_soma.vhd" que foi implementado em "cont7seg.vhd".
		END IF;
	END PROCESS;	
END simple;