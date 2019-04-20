library ieee;
use ieee.std_logic_1164.all;


entity half_adder is
	port(a,b: in std_logic;
	co, s: out std_logic);
end half_adder;

architecture funcion of half_adder is
begin
		co<=a and b;
		s<= a xor b;
end funcion; 