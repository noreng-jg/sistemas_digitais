library ieee;
use ieee.std_logic_1164.all;

entity Deslocador_duplo is
	generic(n:integer:=8);
	port(v_in: in std_logic_vector(N-1 downto 0);
	q: out std_logic_vector(N-1 downto 0);
	clk: in std_logic;
	inR, inL, shL, shR: in std_logic
	);
end Deslocador_duplo;


architecture behavior of Deslocador_duplo is
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if (shL='1' and shR='0') then --desloca pra esquerda
				for i in N-1 downto 1 loop
					q(i)<=v_in(i-1);
				end loop;
				q(0)<=inL;
			elsif(shR='1'and shL='0') then --desloca pra direita
				for i in 0 to N-2 loop
					q(i)<=v_in(i+1);
				end loop;
				q(N-1)<=inR;
			else -- joga pra 0
				q<=(others=>'0');
			end if;
		end if;	
	end process;
end behavior;