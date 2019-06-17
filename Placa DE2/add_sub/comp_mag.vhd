library ieee;
use ieee.std_logic_1164.all;


entity comp_mag is
	generic(n:integer:=6);
	port(a: in std_logic_vector(n-1 downto 0);
	b: in std_logic_vector(n-1 downto 0);
	ingt, ineq, inlt: in std_logic;
	agtb, aeqb, altb: out std_logic);
end comp_mag;

architecture funcionamento of comp_mag is

component bloco_comparador
	port(a,b: in std_logic;
	igt,ieq,ilt: in std_logic;
	out_gt, out_eq, out_lt: out std_logic);
end component;


signal egt: std_logic_vector(n-2 downto 0);
signal eeq: std_logic_vector(n-2 downto 0);
signal elt: std_logic_vector(n-2 downto 0);


begin
	
	estagio_0: bloco_comparador port map(a(n-1), b(n-1), ingt, '1', inlt, egt(0),eeq(0), elt(0));

	estagios: for i in n-2 downto 1 generate
		bcs: bloco_comparador port map(a(i), b(i), egt(n-2-i), eeq(n-2-i), elt(n-2-i), egt(n-1-i), eeq(n-1-i), elt(n-1-i));
	end generate;
	
	estagio_final: bloco_comparador port map(a(0), b(0), egt(n-2), eeq(n-2), elt(n-2), agtb, aeqb, altb);
	
end funcionamento;
