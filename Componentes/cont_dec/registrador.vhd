Library ieee;
use ieee.std_logic_1164.all;

entity registrador is
	generic (n: integer:=8);
	port(I: in std_logic_vector(n-1 downto 0);
	Q: out std_logic_vector(n-1 downto 0);
	ld: in std_logic;
	clk: in std_logic);
end registrador;

architecture funcionamento of registrador is
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


