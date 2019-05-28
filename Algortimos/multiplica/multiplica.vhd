library ieee;
use ieee.std_logic_1164.all;


entity multiplica is 
	generic(n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	b: in std_logic_vector(n-1 downto 0);
	iniciar: in std_logic;
	clk: in std_logic;
	s: out std_logic_vector(n+n-1 downto 0)
	);
end multiplica;


architecture func of multiplica is

signal s_loada,s_loadb, s_loadacc, s_selb,
s_fim,s_pronto: std_logic;


component fsm_controle
	port (clk, fim,start: in std_logic;
	loada,loadb, selb, loadacc,pronto: out std_logic);
end component;

component datapath 
	generic (n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	b:in std_logic_vector(n-1 downto 0);
	load_a,load_b,sel_b,load_acc,clk:in std_logic;
	fim: out std_logic;
	s:out std_logic_vector(n+n-1 downto 0)
);
end component;

begin

pc: fsm_controle port map(clk, s_fim, iniciar, s_loada, s_loadb,
s_selb,s_loadacc, s_pronto);

po: datapath port map(a,b,s_loada, s_loadb,s_selb, s_loadacc,clk, 
s_fim,s);

end func;