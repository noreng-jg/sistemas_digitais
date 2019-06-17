library ieee;
use ieee.std_logic_1164.all;


entity datapath is 

	generic(n: integer:=4);

		port(
		------entradas de controle-----
		conta,loada,loadb,loadacc, resetacc, loadresp, shlen: in std_logic;

		
		reseta_contador, resetaacc: in std_logic;
		
		------saídas para o controle-------
		igualou, bi: out std_logic;

		
		---clock ----
		clk: in std_logic;
		
		
		-------vetores-------
		a,b: in std_logic_vector(N-1 downto 0);
		resposta: out std_logic_vector(N+N-1 downto 0);

		---saidas de debug---

		saida_acc: out std_logic_vector(N+N-1 downto 0)
		 
		);

end datapath;




 architecture func of datapath is

-------Declaração dos componentes------------

	component acessa_index 
		generic(n:integer:=4);
		port(b: in std_logic_vector(n-1 downto 0);
		clk: in std_logic;
		start, reset: in std_logic;
		igualou: out std_logic;
		--debugsinal: out std_logic_vector(n-1 downto 0);
		index:out std_logic);
	end component;

	component reg_reset 
	generic (n: integer:=8);
	port(I: in std_logic_vector(N-1 downto 0);
		Q: out std_logic_vector(N-1 downto 0);
		clk: in std_logic;
		reset: in std_logic;
		load:in std_logic);
	end component;
	
	
	component reg4
	generic (n: integer:=4);
	port(I: in std_logic_vector(N-1 downto 0);
		Q: out std_logic_vector(N-1 downto 0);
		clk: in std_logic;
		reset: in std_logic;
		load:in std_logic);
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
	
	component Deslocador_duplo 
	generic(n:integer:=4);
	port(v_in: in std_logic_vector(N-1 downto 0);
	loada, reset: in std_logic;
	q: out std_logic_vector(N+N-1 downto 0);
	clk: in std_logic;
	shL: in std_logic
	);
	end component;

	
----------------------------------------------
 
 
 ----------Declaração dos Sinais-------
 
signal soma,ao,acco: std_logic_vector(N+N-1 downto 0);
signal bo : std_logic_vector(N-1 downto 0) ;
signal sobra: std_logic;
 ---------------------------------------
 
 
begin
	
	rb: reg4 port map (b, bo, clk, '0', loadb);
	ai: acessa_index port map (bo, clk, conta, reseta_contador, igualou, bi);
	dd: Deslocador_duplo port map(a, loada,'0', ao, clk, shlen);
	racc: reg_reset port map(soma, acco, clk, resetaacc, loadacc);
	add: somador_nbits port map(ao, '0', acco, soma, sobra);
	rresp: reg_reset port map(soma, resposta, clk, '0', loadresp);
	
	saida_acc<=acco;
 
end func;