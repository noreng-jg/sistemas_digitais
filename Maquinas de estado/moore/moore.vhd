LIBRARY ieee;
USE ieee.std_logic_1164.all;


Entity moore is
port(clk : in bit;
reset : in bit;
entrada : in bit;
saida : out bit );
end moore;


architecture funcionamento of moore is
	TYPE STATE_TYPE IS (estado_0, estado_1);
	SIGNAL estado_atual, proximo_estado: STATE_TYPE;
	begin
		process (reset, clk)
		begin
		if (reset = '1') then
		estado_atual <= estado_0;
		elsif (clk'EVENT and clk = '1') then
		estado_atual <= proximo_estado;
		end if;
		end process;
	process (estado_atual, entrada)
	begin
		case estado_atual is
		when estado_0 =>
		saida <= '0';
		if entrada = '0' then
		proximo_estado <= estado_0;
		else
		proximo_estado <= estado_1;
		end if;
		when estado_1 =>
		saida <= '1';
		if entrada = '1' then
		proximo_estado <= estado_1;
		else
		proximo_estado <= estado_0;
		end if;
		end case;
	end process;
	end funcionamento; 