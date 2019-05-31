library ieee;
use ieee.std_logic_1164.all;

entity datapath is
	generic (n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	b:in std_logic_vector(n-1 downto 0);
	load_a,load_b,sel_b,load_acc,clk:in std_logic;
	fim: out std_logic;
	stransitorio:out std_logic_vector(n+n-1 downto 0);
	s:out std_logic_vector(n+n-1 downto 0)
);
end datapath;


architecture func of datapath is

component subtrator
	generic(n:integer:=4);
	port(a:in std_logic_vector(N-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(N-1 downto 0);
	s:out std_logic_vector(N-1 downto 0)	
	);
end component;

component reg4 
	generic (n: integer:=4);
	port(I: in std_logic_vector(n-1 downto 0);
	Q: out std_logic_vector(n-1 downto 0);
	ld: in std_logic;
	clk: in std_logic);
end component;

component reg8 
	generic (n: integer:=8);
	port(I: in std_logic_vector(n-1 downto 0);
	Q: out std_logic_vector(n-1 downto 0);
	ld: in std_logic;
	clk: in std_logic);
end component;

component mux2x1_4 
	generic (N: integer:=4);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	sel:in std_logic;
	c: out std_logic_vector(N-1 downto 0)
	);
end component;

component comp_mag 
	port(a: in std_logic_vector(3 downto 0);
	b: in std_logic_vector(3 downto 0);
	ingt, ineq, inlt: in std_logic;
	agtb, aeqb, altb: out std_logic);
end component;

component comp_ident
	generic(n: integer :=4);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	saida: out std_logic
	);
end component;


component contador 
	port(cnt:in std_logic;
	clk:  in std_logic;
	c:out std_logic_vector(3 downto 0);
	tc: out std_logic
	);
end component;

component somador_4bits 
	generic (n: integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(n-1 downto 0);
	s:out std_logic_vector(n-1 downto 0);
	cout:out std_logic
	);
end component;

component somador_8bits 
	generic (n: integer:=8);
	port(a:in std_logic_vector(n-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(n-1 downto 0);
	s:out std_logic_vector(n-1 downto 0);
	cout:out std_logic
	);
end component;

signal bm_o,bo,bi: std_logic_vector(n-1 downto 0);--sinais de b
signal acci,acco, accso: std_logic_vector(n+n-1 downto 0);--sinais de acc
signal eq1,eq2: std_logic;--sinais saida comp.
signal ao: std_logic_vector(n-1 downto 0);--saida regA
signal ouch,hut : std_logic;


begin
	rega:reg4 port map(a,ao,load_a, clk);
	regbn:reg4 port map(b,bo,load_b,clk);
	cont:contador port map(sel_b, clk, bi, hut);
	sub: subtrator port map(bo, '0', bi, bm_o);--decrementador
	rec_acc:reg8 port map(accso,acco,load_acc,clk);
	somab:somador_8bits port map(acco,'0',(n+n-1 downto n=>'0')& ao,accso, ouch);
	comp1:comp_ident port map(bm_O,"0000", eq1);
	comp2:comp_ident port map(ao,"0000",eq2);
	regresp:reg8 port map(acco,s,eq1,clk);
	stransitorio<=acco;
	fim<=eq1;
end func;