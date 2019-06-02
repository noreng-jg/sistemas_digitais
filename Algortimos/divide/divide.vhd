library ieee;
use ieee.std_logic_1164.all;


entity divide is 
	generic(n: integer := 4);
	port(a,b: in std_logic_vector(n-1 downto 0);
	start, clk,rst: in std_logic;
	final: out std_logic;
	r, q, debuga, debugb, debugr: out std_logic_vector(n-1 downto 0)
	);
end divide;


architecture main of divide is 

signal s_loada,s_loadb, s_loadr, s_loadq, s_selb,s_selb2,
s_fim,s_pronto: std_logic;

component fsm_controle
	port (clk, fim,start, reset: in std_logic;
	loada,loadb, loadr, loadq, selb, selb2,pronto: out std_logic);
end component;

component datapath 
	generic (n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	b:in std_logic_vector(n-1 downto 0);
	reset,load_a,load_b,load_q,load_r,sel_b,sel_b2,clk, pronto:in std_logic;
	fim: out std_logic;
	r,q,debuga,debugb,debugr:out std_logic_vector(n-1 downto 0)
);
end component;

begin

pc: fsm_controle port map(clk, s_fim, start, rst, s_loada, s_loadb, s_loadr,
s_loadq, s_selb,s_selb2, s_pronto);
po: datapath port map(a,b,rst, s_loada, s_loadb, s_loadq,s_loadr, 
s_selb, s_selb2,clk, s_pronto, s_fim,r,q,debuga,debugb,debugr);

final<=s_fim;

end main;
