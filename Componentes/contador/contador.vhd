library ieee;
use ieee.std_logic_1164.all;


entity contador is 
	port(cnt:in std_logic;
	clk:  in std_logic;
	c:out std_logic_vector(3 downto 0);
	tc: out std_logic
	);
end contador;


architecture funcionamento of contador is

component incrementador
	port(a:in std_logic_vector(3 downto 0);
	s: out std_logic_vector(3 downto 0);
	cout: out std_logic
	);
end component;


component registrador  
	port(I: in std_logic_vector(3 downto 0);
	Q: out std_logic_vector(3 downto 0);
	ld: in std_logic;
	clk: in std_logic);
end component;

signal internal_signal, outro_sinal: std_logic_vector(3 downto 0);
signal extra : std_logic;

begin
	internal_signal<="0000";
	inc:incrementador port map(outro_sinal, internal_signal, extra);
	reg:registrador port map(internal_signal, outro_sinal, cnt, clk);
	tc<=(outro_sinal(0)and outro_sinal(1) and outro_sinal(2) and outro_sinal(3));
	c<=outro_sinal;
end funcionamento;