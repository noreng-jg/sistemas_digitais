library ieee;
use ieee.std_logic_1164.all;


entity comp_mag is
	port(a: in std_logic_vector(3 downto 0);
	b: in std_logic_vector(3 downto 0);
	ingt, ineq, inlt: in std_logic;
	agtb, aeqb, altb: out std_logic);
end comp_mag;

architecture funcionamento of comp_mag is

component bloco_comparador
	port(a,b: in std_logic;
	igt,ieq,ilt: in std_logic;
	out_gt, out_eq, out_lt: out std_logic);
end component;


signal egt: std_logic_vector(2 downto 0);
signal eeq: std_logic_vector(2 downto 0);
signal elt: std_logic_vector(2 downto 0);


begin
	estagio_0: bloco_comparador port map(a(3), b(3), ingt, '1', inlt, egt(0),eeq(0), elt(0));
	estagio_1: bloco_comparador port map(a(2), b(2), egt(0), eeq(0), elt(0), egt(1), eeq(1), elt(1));
	estagio_2: bloco_comparador port map(a(1),b(1), egt(1), eeq(1), elt(1), egt(2), eeq(2), elt(2));
	estagio_3: bloco_comparador port map(a(0), b(0), egt(2), eeq(2), elt(2), agtb, aeqb, altb);
	
end funcionamento;
