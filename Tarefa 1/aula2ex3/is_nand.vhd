library ieee;
use ieee.std_logic_1164.all;

entity is_nand is 
	port(a, b: in std_logic;
	s: out std_logic);
end is_nand;

architecture arq of is_nand is
begin
	s<=a nand b;
end arq;