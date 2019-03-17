library ieee;
use ieee.std_logic_1164.all;

entity porta_x is 
	port(u,v: in std_logic;
	f: out std_logic);
end porta_x;

architecture fluxo_de_dados of porta_x is
begin
	f<= '1' when(u='0' and v='0') else
	'0' when (u='0' and v='1') else
	'1' when (u='1' and u='0')else
	'1';
end fluxo_de_dados; 