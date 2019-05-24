library ieee;
use ieee.std_logic_1164.all;

entity cont_dec is
	generic (n:integer:=8);
	port(cnt, clk : in std_logic;
	tc : out std_logic;
	c: out std_logic_vector(N-1 downto 0)
	);

end cont_dec;

architecture behavior of cont_dec is

--func declaration
function many_or(vector: std_logic_vector) return std_logic is
	variable temp_or: std_logic:='0';
	begin
		for i in vector'range loop
			temp_or:=temp_or or vector(i);
		end loop;
		return temp_or;
	end function;
--func end

--component declaration
	
component registrador
	port(I: in std_logic_vector(n-1 downto 0);
	Q: out std_logic_vector(n-1 downto 0);
	ld: in std_logic;
	clk: in std_logic);
end component;


component subtrator is
	port(a:in std_logic_vector(N-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(N-1 downto 0);
	s:out std_logic_vector(N-1 downto 0)	
	);
end component;

--end components

signal internal_signal, out_sub, out_signal : std_logic_Vector(n-1 downto 0);

begin
	g1: registrador port map(out_sub, out_signal, cnt, clk);
	g2: subtrator port map(out_signal, '0', (n-1 downto 1=>'0')&'1', out_sub);
	tc<=not(many_or(out_signal));
	c<=out_signal;
end behavior;