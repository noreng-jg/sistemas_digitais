library ieee;
use ieee.std_logic_1164.all;

entity aula2ex3 is 
	port(a,b,c: in std_logic;
	x, y:out std_logic);
end aula2ex3;

architecture funcionamento of aula2ex3 is

component is_xnor 
	port(a, b: in std_logic;
	s: out std_logic);
end component;

component is_nand
	port(a, b: in std_logic;
	s: out std_logic);
end component;

component is_or  
	port(a, b: in std_logic;
	s: out std_logic);
end component;

component negado 
	port(a: in std_logic;
	s: out std_logic);
end component;
 
signal s1, s2: std_logic;

begin
	G1: negado port map(a, s1);
	G2: is_nand port map(b,c, s2);
	G3: is_or port map (s1,s2,y);
	G4: is_xnor port map(s1,s2, x);	
end funcionamento;
