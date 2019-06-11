library ieee;
use ieee.std_logic_1164.all;

entity d_esq is
	generic(n:integer:=4);
	port(v_in: in std_logic_vector(N+N-1 downto 0);
	q: out std_logic_vector(N+N-1 downto 0);
	shL: in std_logic
	);
end d_esq;



architecture behavior of d_esq is

begin


	process(v_in)
	begin 
	
		if (shL='1') then --desloca pra esquerda
				for i in N +N-1 downto 1 loop
					q(i)<=v_in(i-1);
				end loop;
				q(0)<='0';
		else
			q<=v_in;
		end if;
		
	end process;
	
	
end behavior;