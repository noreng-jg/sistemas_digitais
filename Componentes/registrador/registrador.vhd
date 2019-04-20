Library ieee;
Use ieee.std_logic_1164.all;

entity registrador is
port(I: in std_logic_vector(7 downto 0);
	Q: out std_logic_vector(7 downto 0);
	clk: in std_logic;
	reset: in std_logic;
	load:in std_logic);
end registrador;


architecture comportamento of registrador is
begin

process(clk, load)
begin
	if(reset='0') then
		if(clk = '1' and clk'event and load='1') then
			Q <= I;
		end if;
	else
		Q<="00000000";--ou (others=>'0');
	end if;
end process;

end comportamento;