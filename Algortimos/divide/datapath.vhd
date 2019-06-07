library ieee;
use ieee.std_logic_1164.all;

entity datapath is
	generic (n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	b:in std_logic_vector(n-1 downto 0);
	reset,load_a,load_b,load_q,load_r,sel_b,sel_b2,menor,clk, pronto:in std_logic;
	fim, less: out std_logic;
	r,q:out std_logic_vector(n-1 downto 0)
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

component contador 
	port(cnt:in std_logic;
	clk:  in std_logic;
	reset:  in std_logic;
	c:out std_logic_vector(3 downto 0);
	tc: out std_logic
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

component somador_8bits
	generic (n: integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(n-1 downto 0);
	s:out std_logic_vector(n-1 downto 0);
	cout:out std_logic
	);
end component;



signal somaum : std_logic_vector(n-1 downto 0);
signal bi, bo: std_logic_vector(n-1 downto 0);--sinais de b
signal smq,qi,qo,qf: std_logic_vector(n-1 downto 0);--sinais de q
signal smr,ro,rf,rs,rqi: std_logic_vector(n-1 downto 0);--sinais de r
signal lt,eq,gt,lt2,eq2,gt2: std_logic;--sinais saida comp.
signal ao: std_logic_vector(n-1 downto 0);--saida regA
signal ouch,hut,hut2 : std_logic;
signal sinaldemenor:std_logic;

begin
	rega:reg_reset port map(a,ao,clk,reset,load_a);
	regb:reg_reset port map(b,bo,clk,reset,load_b);
	regr:reg_reset port map(rqi,ro,clk,reset,load_r);
	mux: mux2x1_4 port map(ao,rs,sel_b,rqi);
	mux2: mux2x1_4 port map(bo,"0000",sel_b2,bi);	
	
	cont:contador port map(load_q, clk,reset, qo, hut);
	--
	subqo: subtrator port map(qo, '0', "0010", qi);		
	mq: mux2x1_4 port map("0000",qi,lt2,smq);
	mr: mux2x1_4 port map(ao,rs,lt2,smr);	
	regrf:reg_reset port map(smr,rf,clk,reset,lt or lt2);
	regqf:reg_reset port map(smq,qf,clk,reset,lt or lt2);	
	sub: subtrator port map(ro, '0', bi, rs);
	comp:comp_mag port map(rs, bo,'0','0','0', gt, eq, lt);
	compab:comp_mag port map(ao, bo,'0','0','0', gt2, eq2, lt2);	
	
	fim<=lt ;
	r<=rf;
	q<=qf;
	less<=lt2;
	
	
end func;