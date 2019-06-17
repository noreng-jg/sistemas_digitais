library ieee;
use ieee.std_logic_1164.all;

entity sub_espec is
	generic(n:integer :=4);
	port (a,b: in std_logic_vector(n-1 downto 0);
	s:out std_logic_vector(n-1 downto 0);
	menor:out std_logic
	);	
end sub_espec;


architecture funcionamento of sub_espec is
	
component subtrator 
	generic(n:integer:=4);
	port(a:in std_logic_vector(N-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(N-1 downto 0);
	s:out std_logic_vector(N-1 downto 0)	
	);
end component;

component comp_mag 
	port(a: in std_logic_vector(3 downto 0);
	b: in std_logic_vector(3 downto 0);
	ingt, ineq, inlt: in std_logic;
	agtb, aeqb, altb: out std_logic);
end component;

signal gt,eq,lt: std_logic;
signal definitive_a, definitive_b: std_logic_vector(n-1 downto 0);

begin 
	comp:comp_mag port map(a, b,'0','0','0', gt, eq, lt);
	definitive_a<=a when (gt='1'and lt='0' and eq='0') else
	b;
	definitive_b<=b when (gt='1' and lt='0' and eq='0') else
	a;
	sub: subtrator port map(definitive_a, '0', definitive_b, s);
	menor<=lt;
end funcionamento;