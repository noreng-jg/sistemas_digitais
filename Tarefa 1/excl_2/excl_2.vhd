library ieee;
use ieee.std_logic_1164.all;

entity excl_2 is 
	port(u,v: in std_logic;
	f: out std_logic);
end excl_2;

architecture fluxo_de_dados of excl_2 is
begin
	f<= '0' when(u='0' and v='0') else
	'1' when (u='0' and v='1') else
	'0' when (u='1' and u='0')else
	'1';
end fluxo_de_dados; 