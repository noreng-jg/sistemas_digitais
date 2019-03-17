library ieee;
use ieee.std_logic_1164.all;

entity is_nor is 
	port(a, b: in std_logic;
	s: out std_logic);
end is_nor;

architecture arq of is_nor is
begin
	s<=a nor b;
end arq;