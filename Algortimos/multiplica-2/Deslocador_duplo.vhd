library ieee;
use ieee.std_logic_1164.all;

entity Deslocador_duplo is
	generic(n:integer:=4);
	port(v_in: in std_logic_vector(N-1 downto 0);
	loada, reset: in std_logic;
	q: out std_logic_vector(N+N-1 downto 0);
	clk: in std_logic;
	shL: in std_logic
	);
end Deslocador_duplo;


architecture behavior of Deslocador_duplo is


component reg8 
	generic (n: integer:=8);
	port(I: in std_logic_vector(n-1 downto 0);
	Q: out std_logic_vector(n-1 downto 0);
	reset: in std_logic;
	clk: in std_logic);
end component;


component mux2x1 
	generic (N: integer:=8);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	sel:in std_logic;
	c: out std_logic_vector(N-1 downto 0)
	);
end component;

component d_esq 
	generic(n:integer:=4);
	port(v_in: in std_logic_vector(N+N-1 downto 0);
	q: out std_logic_vector(N+N-1 downto 0);
	shL: in std_logic
	);
end component;




signal desloc_esq : std_logic_vector(N+N-1 downto 0);
signal entrada_rotativa: std_logic_vector(n+n-1 downto 0);
signal entra_reg: std_logic_vector(n+n-1 downto 0);
signal concatena_entrada: std_logic_vector(n+n-1 downto 0);

begin

concatena_entrada<=(n+n-1 downto n=>'0')& v_in;

mux: mux2x1 port map(concatena_entrada, entrada_rotativa, loada, entra_reg);

esq: d_esq port map(desloc_esq, entrada_rotativa,shl);

reg: reg8 port map(entra_reg,desloc_esq,reset,clk);
	
q<=desloc_esq;
	
end behavior;