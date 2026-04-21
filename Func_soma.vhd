LIBRARY ieee;
USE ieee.std_logic_1164.all;
					--Função que vai usar "soma.vhd" como base para o de 4 bits.
ENTITY Func_soma IS 
	PORT (fA : IN BIT_VECTOR(3 DOWNTO 0); --"fA" recebe os valores de "a" da função "soma" em linha 21-24.
			fS_OUT: OUT BIT_VECTOR(3 DOWNTO 0)); --"fS_OUT" recebe os valores de "s".
END Func_soma;

ARCHITECTURE somador OF Func_soma IS
	SIGNAL h, l: BIT; --Usado para forçar valores "1" e "0" quando bem desejado usado em linha 21-24.
	
	SIGNAL fC_OUT : BIT_VECTOR(3 DOWNTO 0);  --Vetor intermediário usado para mover valores.
	
	COMPONENT soma IS --Chamada da função "soma.vhd"; Importando seus dados/portas lógicas.
	PORT (a, b, c_IN : IN BIT;
			s, c_OUT : OUT BIT);
	END COMPONENT soma;
BEGIN
	h <= '1'; --"h" agora emite "1"; qualquer valor que receber "h" passará a transmitir "1".
	l <= '0'; --"l" agora emite "0"; qualquer valor que receber "l" passará a transmitir "0".
	soma0: soma PORT MAP(C_IN => l,         a => fA(0), b => h, c_out => fC_OUT(0), s => fS_OUT(0));--Primeiro somador deve receber 0 em carry e 1 em "b".
	soma1: soma PORT MAP(C_IN => fC_OUT(0), a => fA(1), b => l, c_out => fC_OUT(1), s => fS_OUT(1));
	soma2: soma PORT MAP(C_IN => fC_OUT(1), a => fA(2), b => l, c_out => fC_OUT(2), s => fS_OUT(2));
	soma3: soma PORT MAP(C_IN => fC_OUT(2), a => fA(3), b => l, c_out => fC_OUT(3), s => fS_OUT(3));
END somador;