library ieee;
use ieee.std_logic_1164.all;


entity incrementador is 
	port(a:in std_logic_vector(3 downto 0);
	s: out std_logic_vector(3 downto 0);
	cout: out std_logic
	);
end incrementador;


architecture funcionamento of incrementador is

component meiosomador
	port(a: in std_logic;
	b: in std_logic;
	s: out std_logic;
	co: out std_logic);	
end component;


signal um: std_logic;
signal temp_c: std_logic_vector(3 downto 1);
begin
	
	um<='1';
	
	g0: meiosomador port map(a(0), um, s(0),temp_c(1));
	g1: meiosomador port map(a(1), temp_c(1), s(1), temp_c(2));
	g2: meiosomador port map(a(2), temp_c(2), s(2), temp_c(3));
	g3: meiosomador port map(a(3), temp_c(3), s(3), cout);
	
end funcionamento;