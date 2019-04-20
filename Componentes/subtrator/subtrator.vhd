library ieee;
use ieee.std_logic_1164.all;

entity subtrator is 
	port(a:in std_logic_vector(7 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(7 downto 0);
	s:out std_logic_vector(7 downto 0)
	
	);
end entity;

architecture funcionamento of subtrator is
	

	component full_adder 
		port(a,b, ci: in std_logic;
		co, s: out std_logic);
	end component;

	signal c: std_logic_vector(7 downto 1);
	signal invb:std_logic_vector(7 downto 0);
begin 
	
	--for i in 0 to 7 loop
		--estagio(i): full_adder port map(a(i), b(i), c(i+1), ) 
	--end loop;
	
	invb<=not(b)or'1';
	s<=invb;
	
end funcionamento;


