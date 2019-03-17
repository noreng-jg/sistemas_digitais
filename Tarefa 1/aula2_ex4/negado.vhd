library ieee;
use ieee.std_logic_1164.all;

entity negado is 
	port(a: in std_logic;
	s: out std_logic);
end negado;

architecture arq of negado is
begin
	s<=not a;
end arq;