library ieee;
use ieee.std_logic_1164.all;

entity is_or is 
	port(a, b: in std_logic;
	s: out std_logic);
end is_or;

architecture arq of is_or is
begin
	s<=a or b;
end arq;