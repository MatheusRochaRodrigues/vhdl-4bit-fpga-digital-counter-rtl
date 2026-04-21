LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY soma IS
PORT (
a, b, c_IN : IN BIT; --Valores de entrada.
s, c_OUT : OUT BIT); --Valores de saída; "c_OUT" = carry in.
END soma;
ARCHITECTURE add OF soma IS
	SIGNAL AB_NOR : BIT; --Ponto intermediário usado no somador.
BEGIN  --Somador que sera usado de base para a função de somar 4 bits.
AB_NOR <= (A xOR B);  --XOR entre "A", "B" e seu resultado guardado em "AB_NOR"(Ponto interemediário).
S <= (C_IN xOR AB_NOR); --"S" receberá um XOR entre o calculo feito entre "C_IN", "AB_NOR".
C_OUT <= ((AB_NOR AND C_IN) OR (A AND B)); --Outra saída; "C_OUT" vai receber um OR entre "AB_NOR","C_IN" e "A","B".
END add;
