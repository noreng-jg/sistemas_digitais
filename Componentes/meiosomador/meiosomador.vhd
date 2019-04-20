library ieee;
use ieee.std_logic_1164.all;

entity meiosomador is 
	port(a: in std_logic;
	b: in std_logic;
	s: out std_logic;
	co: out std_logic);
end meiosomador;

architecture funcionameto of meiosomador is
	begin
		s<=a xor b;
		co<=a and b;
end funcionameto;