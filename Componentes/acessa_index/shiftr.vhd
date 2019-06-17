library ieee;
use ieee.std_logic_1164.all;

entity shiftr is
	generic(n:integer:=4);
	port(v_in: in std_logic_vector(N-1 downto 0);
	q: out std_logic_vector(N-1 downto 0);
	shr: in std_logic
	);
end shiftr;



architecture behavior of shiftr is

begin


	process(v_in)
	begin 
	
		if (shr='1') then --desloca pra esquerda
				for i in 0 to n-2 loop
					q(i)<=v_in(i+1);
				end loop;
				q(n-1)<='0';
		else
			q<=v_in;
		end if;
		
	end process;
	
	
end behavior;