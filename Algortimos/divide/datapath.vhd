library ieee;
use ieee.std_logic_1164.all;

entity datapath is
	generic (n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	b:in std_logic_vector(n-1 downto 0);
	reset,load_a,load_b,load_q,load_r,sel_b,sel_b2,clk, pronto:in std_logic;
	fim: out std_logic;
	r,q,debuga,debugb,debugr:out std_logic_vector(n-1 downto 0)
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


component add_sub 
    generic(N : natural := 4);
    port(
        a, b : in std_logic_vector(N-1 downto 0);
        sub : in std_logic;
        o : out std_logic_vector(N-1 downto 0);
        scout, ucout : out std_logic);

end component;


component sub_espec
	generic(n:integer :=4);
	port (a,b: in std_logic_vector(n-1 downto 0);
	s:out std_logic_vector(n-1 downto 0);
	menor:out std_logic);		
end component;

component mux1  
	generic (N: integer:=4);
	port(a:in std_logic;
	b:in std_logic;
	sel:in std_logic;
	c: out std_logic
	);
end component;



signal somaum : std_logic_vector(n-1 downto 0);
signal bi, bo: std_logic_vector(n-1 downto 0);--sinais de b
signal qi,qo,qf: std_logic_vector(n-1 downto 0);--sinais de q
signal ro,rf,rs,rqi: std_logic_vector(n-1 downto 0);--sinais de r
signal lt,eq,gt: std_logic;--sinais saida comp.
signal ao: std_logic_vector(n-1 downto 0);--saida regA
signal ouch,hut,hut2 : std_logic;
signal sinaldemenor:std_logic;

begin
	rega:reg4 port map(a,ao,load_a, clk);
	regb:reg4 port map(b,bo,load_b,clk);
	regr:reg4 port map(rqi,ro,load_r,clk);
	--soma1: somador_8bits port map(ao, '0', "0001", somaum, ouch);
	mux: mux2x1_4 port map(ao,rs,sel_b,rqi);
	mux2: mux2x1_4 port map(bo,"0000",sel_b2,bi);
	regrf:reg_reset port map(rs,rf,clk,reset,sinaldemenor);
	regqf:reg_reset port map(qi,qf,clk,reset,sinaldemenor);
	cont:contador port map(load_q, clk, qo, hut);
	--sub: subtrator port map(ro, '0', bi, rs);
	--sub:sub_espec port map(ro,bo,rs, sinaldemenor);
	subdesconta1clock: subtrator port map(qo, '0', "0010", qi);
	--comp:comp_mag port map(rs, bo,'0','0','0', gt, eq, lt);
	--muxr:mux1 port map(sinalmenor, lt, sinalmenor, fim)
	fim<=sinaldemenor;
	r<=rf;
	q<=qf;
	debuga<=ao;
	debugb<=bo;
	debugr<=rs;
end func;