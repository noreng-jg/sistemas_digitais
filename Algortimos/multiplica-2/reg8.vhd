Library ieee;
use ieee.std_logic_1164.all;

entity reg8 is
	generic (n: integer:=8);
	port(I: in std_logic_vector(n-1 downto 0);
	Q: out std_logic_vector(n-1 downto 0);
	reset: in std_logic;
	clk: in std_logic);
end reg8;

architecture funcionamento of reg8 is
	begin
		process(clk)
		begin
			if reset='0' then 
				if rising_edge(clk) then
					q<=i;
				end if;
			else
				q<=(others=>'0');
			end if;
		end process;
end funcionamento;


