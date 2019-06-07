library ieee;
use ieee.std_logic_1164.all;


entity contador is 
	port(cnt:in std_logic;
	clk:  in std_logic;
	reset: in std_logic;
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


component reg_reset 
	generic (n: integer:=4);
	
	port(I: in std_logic_vector(N-1 downto 0);
		Q: out std_logic_vector(N-1 downto 0);
		clk: in std_logic;
		reset: in std_logic;
		load:in std_logic);
end component;


signal internal_signal, signal_out : std_logic_vector(3 downto 0);
signal out_bit: std_logic;

begin
	reg:reg_reset port map(internal_signal, signal_out, clk, reset, cnt);
	inc:incrementador port map(signal_out, internal_signal, out_bit);
	tc<=(signal_out(0)and signal_out(1) and signal_out(2) and signal_out(3));
	c<=signal_out;
end funcionamento;