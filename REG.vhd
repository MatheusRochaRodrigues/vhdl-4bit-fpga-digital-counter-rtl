library ieee;
USE ieee.std_logic_1164.all;
			--Registrador de 4 bits; Vai usar 4 ff-D para poder armazenar 4 bits de memória.
ENTITY REG IS
	PORT( Rclk, Rclr: IN BIT; --Sincronia de Clock e Clear que será usada em "cont7seg.vhd"; E com "neg_d.vhd".
			Rd: IN BIT_VECTOR(3 DOWNTO 0); 
			Ry: OUT BIT_VECTOR(3 DOWNTO 0)); --"Ry" vai receber a saída "q".
END REG;

ARCHITECTURE registro OF REG IS
	COMPONENT neg_d IS --Chamada da função "neg_d.vhd".
		PORT(clk, d, clr: IN BIT;
			  q: OUT BIT);
	END COMPONENT neg_d;
BEGIN  --Foi feito apenas a sincronia das entradas/saídas do registrador.
	rr0: neg_d PORT MAP(clk => Rclk, d => Rd(0), clr => Rclr,q => Ry(0));
	rr1: neg_d PORT MAP(clk => Rclk, d => Rd(1), clr => Rclr,q => Ry(1));
	rr2: neg_d PORT MAP(clk => Rclk, d => Rd(2), clr => Rclr,q => Ry(2));
	rr3: neg_d PORT MAP(clk => Rclk, d => Rd(3), clr => Rclr,q => Ry(3));
END registro;