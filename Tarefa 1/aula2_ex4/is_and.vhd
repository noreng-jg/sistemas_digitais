library ieee;
use ieee.std_logic_1164.all;

entity is_and is 
	port(a, b: in std_logic;
	s: out std_logic);
end is_and;

architecture arq of is_and is
begin
	s<=a and b;
end arq;