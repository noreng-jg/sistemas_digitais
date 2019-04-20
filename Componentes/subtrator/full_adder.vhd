library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(a,b, ci: in std_logic;
	co, s: out std_logic);
end full_adder;

architecture funcion of full_adder is
begin
		co<=(a and b)or(a and ci)or(ci and b);
		s<= a xor (b xor ci);
end funcion; 