library ieee;
use ieee.std_logic_1164.all;


entity mux2x1 is 
	generic (N: integer:=7);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	sel:in std_logic;
	c: out std_logic_vector(N-1 downto 0)
	);
end mux2x1;


architecture funcionamento of mux2x1 is
begin
	c<=a when (sel='1') else
	b;
end funcionamento;				