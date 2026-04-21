library ieee;
USE ieee.std_logic_1164.all;
ENTITY DISPLAY IS
	PORT (d1,d2,d3,d4 : IN BIT; --Entrada lógica dos bits que sera usada em Process().
			a, b, c, d, e, f, g, h : OUT BIT); --Entradas dos display de 7 segmentos; sincronizar com a pinagem.
END DISPLAY;

ARCHITECTURE video OF DISPLAY IS
SIGNAL in_bits : BIT_VECTOR (3 DOWNTO 0);
BEGIN
in_bits <= d1 & d2 & d3 & d4; --"in_bits" encapsulará "d1", "d2", "d3", d4".
Process(d1, d2, d3, d4) --Será sensível a estes valores em "CASE".
BEGIN

CASE in_bits IS --O valores encapsulados serão lidos aqui.
         WHEN "0000" => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '1'; h <= '0'; --0
		 WHEN "0001" => a <= '1'; b <= '0'; c <= '0'; d <= '1'; e <= '1'; f <= '1'; g <= '1'; h <= '1'; --1
		 WHEN "0010" => a <= '0'; b <= '0'; c <= '1'; d <= '0'; e <= '0'; f <= '1'; g <= '0'; h <= '1'; --2
		 WHEN "0011" => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '1'; f <= '1'; g <= '0'; h <= '1'; --3
		 WHEN "0100" => a <= '1'; b <= '0'; c <= '0'; d <= '1'; e <= '1'; f <= '0'; g <= '0'; h <= '1'; --4
		 WHEN "0101" => a <= '0'; b <= '1'; c <= '0'; d <= '0'; e <= '1'; f <= '0'; g <= '0'; h <= '1'; --5
		 WHEN "0110" => a <= '0'; b <= '1'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '0'; h <= '1'; --6
		 WHEN "0111" => a <= '0'; b <= '0'; c <= '0'; d <= '1'; e <= '1'; f <= '1'; g <= '1'; h <= '1'; --7
		 WHEN "1000" => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '0'; h <= '0'; --8
		 WHEN "1001" => a <= '0'; b <= '0'; c <= '0'; d <= '0'; e <= '1'; f <= '0'; g <= '0'; h <= '0'; --9
		 WHEN "1010" => a <= '0'; b <= '0'; c <= '0'; d <= '1'; e <= '0'; f <= '0'; g <= '0'; h <= '0'; --a
		 WHEN "1011" => a <= '1'; b <= '1'; c <= '0'; d <= '0'; e <= '0'; f <= '0'; g <= '0'; h <= '0'; --b
		 WHEN "1100" => a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '0'; f <= '0'; g <= '1'; h <= '0'; --c
		 WHEN "1101" => a <= '1'; b <= '0'; c <= '0'; d <= '0'; e <= '0'; f <= '1'; g <= '0'; h <= '0'; --d
		 WHEN "1110" => a <= '0'; b <= '1'; c <= '1'; d <= '0'; e <= '0'; f <= '0'; g <= '0'; h <= '0'; --e
		 WHEN "1111" => a <= '0'; b <= '1'; c <= '1'; d <= '1'; e <= '0'; f <= '0'; g <= '0'; h <= '0'; --f
END CASE;  
END PROCESS;
END video;