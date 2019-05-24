Library ieee;
use ieee.std_logic_1164.all;

entity reg4 is
	generic (n: integer:=4);
	port(I: in std_logic_vector(n-1 downto 0);
	Q: out std_logic_vector(n-1 downto 0);
	ld: in std_logic;
	clk: in std_logic);
end reg4;

architecture funcionamento of reg4 is
	begin
		process(clk)
		begin
			if ld='1' then 
				if rising_edge(clk) then
					q<=i;
				end if;
			end if;
		end process;
end funcionamento;


