library ieee;
use ieee.std_logic_1164.all;

entity somador_nbits is
	generic (n: integer:=8);
	port(a:in std_logic_vector(n-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(n-1 downto 0);
	s:out std_logic_vector(n-1 downto 0);
	cout:out std_logic
	);
end entity;

architecture funcionamento of somador_nbits is
	

	component full_adder 
		port(a,b, ci: in std_logic;
		co, s: out std_logic);
	end component;

	signal c: std_logic_vector(n-1 downto 1);
	
begin 
	
	estagio0: full_adder port map(a(0), b(0), cin, c(1),s(0));
	
	gates:for i in 1 to n-2 generate
		fas: full_adder port map(a(i), b(i), c(i), c(i+1),s(i));
	end generate;
	
	estagio7: full_adder port map(a(n-1), b(n-1), c(n-1), cout,s(n-1));
	
end funcionamento;


