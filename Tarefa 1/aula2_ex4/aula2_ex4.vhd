library ieee;
use ieee.std_logic_1164.all;

entity aula2_ex4 is 
	port(a1,a2,a3,a4,a5,a6,a7: in std_logic;
	sout_0, sout_1:out std_logic);
end aula2_ex4;

architecture funcionamento of aula2_ex4 is

component is_xnor 
	port(a, b: in std_logic;
	s: out std_logic);
end component;

component is_nor
	port(a, b: in std_logic;
	s: out std_logic);
end component;

component is_and
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
 
signal s1, s2, s3, s4, s5, s6: std_logic;

begin
	G1: is_or port map(a5, a6, s1);
	G2: is_and port map(a3,a4, s2);
	G3: is_xnor port map (a1,a2,s3);
	G4: is_and port map(a7,s1, s4);
	G5: is_or port map(s3, s2, s6);
	G6: is_nor port map(s2, s4, s5);
	G7: negado port map(s5, sout_1);
	G8: is_or port map(s6, s5, sout_0);
end funcionamento;
