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
	
	
	component somador_nbits
			port(a:in std_logic_vector(7 downto 0);
				cin: in std_logic;
				b:in std_logic_vector(7 downto 0);
				s:out std_logic_vector(8 downto 0)	
		);
	end component;
		

	signal internal, invb: std_logic_vector(7 downto 0);
	signal make_sum: std_logic_vector(7 downto 0);
	signal int_bit: std_logic;


begin 
	int_bit<='1';
	internal <=(others=>'0')&int_bit;
	invb<=not(b);
	make_sum<=internal or invb;
	sub: somador_nbits port map(a, cin, make_sum, s);
	
end funcionamento;


