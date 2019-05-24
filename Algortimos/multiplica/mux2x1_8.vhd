library ieee;
use ieee.std_logic_1164.all;


entity mux2x1_8 is 
	generic (N: integer:=8);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	sel:in std_logic;
	c: out std_logic_vector(N-1 downto 0)
	);
end mux2x1_8;


architecture funcionamento of mux2x1_8 is
begin
	c<=a when (sel='1') else
	b;
end funcionamento;				