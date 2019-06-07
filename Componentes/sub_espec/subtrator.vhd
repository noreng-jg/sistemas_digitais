library ieee;
use ieee.std_logic_1164.all;

entity subtrator is
	generic(n:integer:=4);
	port(a:in std_logic_vector(N-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(N-1 downto 0);
	s:out std_logic_vector(N-1 downto 0)	
	);
end entity;

architecture funcionamento of subtrator is
	
	
	component somador_8bits
			generic (n: integer:=4);
			port(a:in std_logic_vector(N-1 downto 0);
				cin: in std_logic;
				b:in std_logic_vector(N-1 downto 0);
				s:out std_logic_vector(N-1 downto 0)	
		);
	end component;
		

	signal internal, invb: std_logic_vector(N-1 downto 0);
	signal make_sum: std_logic_vector(N-1 downto 0);
	signal int_bit: std_logic;


begin 
	
	int_bit<='1';
	internal <=(N-1 downto 1 =>'0') & int_bit;
	invb<=not(b);	
	sub1: somador_8bits port map(invb, '0', internal, make_sum);
	sub2: somador_8bits port map(a, cin, make_sum, s);
	
end funcionamento;


