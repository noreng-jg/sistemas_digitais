library ieee;
use ieee.std_logic_1164.all;

entity somador_nbits is 
	port(a:in std_logic_vector(7 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(7 downto 0);
	s:out std_logic_vector(8 downto 0)
	
	);
end entity;

architecture funcionamento of somador_nbits is
	

	component full_adder 
		port(a,b, ci: in std_logic;
		co, s: out std_logic);
	end component;

	signal c: std_logic_vector(7 downto 1);
	
begin 
	
	--for i in 0 to 7 loop
		--estagio(i): full_adder port map(a(i), b(i), c(i+1), ) 
	--end loop;
	
	
	estagio0: full_adder port map(a(0), b(0), cin, c(1),s(0));
	estagio1: full_adder port map(a(1), b(1), c(1), c(2),s(1));
	estagio2: full_adder port map(a(2), b(2), c(2), c(3),s(2));
	estagio3: full_adder port map(a(3), b(3), c(3), c(4),s(3));
	estagio4: full_adder port map(a(4), b(4), c(4), c(5),s(4));
	estagio5: full_adder port map(a(5), b(5), c(5), c(6),s(5));
	estagio6: full_adder port map(a(6), b(6), c(6), c(7),s(6));
	estagio7: full_adder port map(a(7), b(7), c(7), s(8),s(7));
	
	
end funcionamento;


