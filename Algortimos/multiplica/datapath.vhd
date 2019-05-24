library ieee;
use ieee.std_logic_1164.all;

entity datapath is
	generic (n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	b:in std_logic_vector(n-1 downto 0);
	load_a,load_b,sel_b,sel_acc,load_acc,clk:in std_logic;
	fim: out std_logic
);
end datapath;


architecture func of datapath is

component subtrator
	generic(n:integer:=8);
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
	generic (N: integer:=8);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	sel:in std_logic;
	c: out std_logic_vector(N-1 downto 0)
	);
end component;

component mux2x1_8 
	generic (N: integer:=8);
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

component somador_nbits 
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
signal lt1,gt1,eq1,lt2,gt2,eq2: std_logic;--sinais saida comp.
signal ao: std_logic_vector(n-1 downto 0);--saida regA
signal zero_vec_8: std_logic_vector(n+n-1 downto 0):=(others=>'0');
signal zero_vec_4: std_logic_vector(n-1 downto 0):=(others=>'0');
signal ouch : std_logic;


begin
	rega:reg4 port map(a,ao,load_a, clk);
	regb:reg4 port map(bi,bo,load_b,clk);
	mux_acc:mux2x1_8 port map(accso,zero_vec_8,sel_acc,acci);
	sub: subtrator port map(b0, '0', "00000001", bm_o);--decrementador
	mux_b:mux2x1_8 port map(bm_o,b,load_b,bi);
	rec_acc:reg8 port map(acci,acco,load_acc,clk);
	soma:somador_nbits port map(acco,'0',bo,accso, ouch);
	comp1:comp_mag port map(bo,"0000",'0','0','0', gt1,eq1,lt1);
	comp2:comp_mag port map(ao,"0000",'0','0','0', gt2,eq2,lt2);
	fim<=eq1 or eq2;
end func;