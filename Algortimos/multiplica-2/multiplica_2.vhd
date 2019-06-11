library ieee;
use ieee.std_logic_1164.all;


entity multiplica_2 is 
	generic(n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);
	b: in std_logic_vector(n-1 downto 0);
	liga: in std_logic;
	clk: in std_logic;
	resposta: out std_logic_vector(n+n-1 downto 0);
	s_transitorio: out std_logic_vector(n+n-1 downto 0);
	termina:out std_logic
	);
end multiplica_2;


architecture func of multiplica_2 is


component fsm_controle
	port (clk, liga, bi, igualou: in std_logic;
	conta, loada, loadb, loadacc, resetacc, loadresp: out std_logic;
	shlen, reseta_contador, resetaacc, pronto: out std_logic
	);
end component;

component datapath 

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

end component;

signal conta, loada,loadb,loadacc, resetacc, loadresp, shlen, 
reseta_contador, resetaacc, igualou, bi, pronto: std_logic;


begin

pc: fsm_controle port map(clk, liga, bi, igualou, conta,
loada,loadb,loadacc,resetacc,loadresp,shlen, reseta_contador,
resetaacc, pronto
);

po: datapath port map(conta,loada,loadb,loadacc, resetacc, loadresp,shlen, 
reseta_contador, resetaacc, igualou, bi, clk, a, b, resposta, s_transitorio); 


termina<=pronto;

end func;
