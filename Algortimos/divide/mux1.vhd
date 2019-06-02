library ieee;
use ieee.std_logic_1164.all;


entity mux1 is 
	port(a:in std_logic;
	b:in std_logic;
	sel:in std_logic;
	c: out std_logic
	);
end mux1;


architecture funcionamento of mux1 is
begin
	c<=a when (sel='0') else
	b;
end funcionamento;				