library ieee;
use ieee.std_logic_1164.all;

entity is_xnor is 
	port(a, b: in std_logic;
	s: out std_logic);
end is_xnor;

architecture arq of is_xnor is
begin
	s<=a xnor b;
end arq;