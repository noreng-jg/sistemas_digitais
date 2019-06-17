library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity acessa_index is 
	generic(n:integer:=4);
	port(b: in std_logic_vector(n-1 downto 0);
	clk: in std_logic;
	start, reset: in std_logic;
	igualou: out std_logic;
	debugsinal: out std_logic_vector(n-1 downto 0);
	index:out std_logic);
end acessa_index;


architecture behaviour of acessa_index is 

--signal inteiro: natural;
signal inteiro: integer;
signal ouch: std_logic;
signal another_signal: std_logic_vector(n-1 downto 0);
signal saidas: std_logic_vector(2 downto 0);
signal syim: std_logic_vector(3 downto 0);


component contador 
	port(cnt:in std_logic;
	clk:  in std_logic;
	rst:in std_logic;
	c:out std_logic_vector(3 downto 0);
	tc: out std_logic
	);
end component;

component shiftr 
	generic(n:integer:=4);
	port(v_in: in std_logic_vector(N-1 downto 0);
	q: out std_logic_vector(N-1 downto 0);
	shr: in std_logic
	);
end component;

component subtrator 
	generic(n:integer:=4);
	port(a:in std_logic_vector(N-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(N-1 downto 0);
	s:out std_logic_vector(N-1 downto 0)	
	);
end component;

component comp_ident 
	generic(n: integer :=4);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	saida: out std_logic
	);
end component;


begin
	
	
	process(clk)
	begin  
		inteiro<=to_integer(unsigned(syim));
		index<=b(inteiro);
	end process;
	
	
	sub: subtrator port map(another_signal, '0',"0001",syim);
	inst: contador port map(start, clk, reset, another_signal, ouch);
	comp: comp_ident port map(syim, "0011", igualou);
	debugsinal<=syim;
	
end behaviour;

