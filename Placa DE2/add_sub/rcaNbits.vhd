library ieee;
use ieee.std_logic_1164.all;

entity rcaNbits is

generic(n: integer:=6);
port(a, b: in std_logic_vector(n-1 downto 0);
sel:in std_logic;
hex0, hex1, hex2, hex7,hex4,hex5,hex6: out std_logic_vector(n downto 0)
);
end rcaNbits;

architecture comportamento of rcaNbits is

component sub_espec
	generic(n:integer :=6);
	port (a,b: in std_logic_vector(n-1 downto 0);
	s:out std_logic_vector(n-1 downto 0);
	menor:out std_logic
	);	
end component;

component somador_nbits 
	generic (n: integer:=6);
	port(a:in std_logic_vector(n-1 downto 0);
	cin: in std_logic;
	b:in std_logic_vector(n-1 downto 0);
	s:out std_logic_vector(n downto 0)
	);
end component;

component mux2x1 
	generic (N: integer:=7);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	sel:in std_logic;
	c: out std_logic_vector(N-1 downto 0)
	);
end component;

component converte_entradas
	PORT(entrada: in std_logic_vector(5 downto 0);  -- entrada binaria
		  hex1: out std_logic_vector(6 downto 0); -- saidas para o display de sete segmentos
		  hex2:out std_logic_vector(6 downto 0)); 
End component;


component converte_neg 
	PORT(entrada: in std_logic_vector(5 downto 0);  -- entrada binaria
	hex1: out std_logic_vector(6 downto 0); -- saida para o display de sete segmentos
	hex2:out std_logic_vector(6 downto 0);
	hex3:out std_logic_vector(6 downto 0));  
End component;


component converte_soma 
	PORT(entrada: in std_logic_vector(6 downto 0);  -- entrada binaria
	hex1: out std_logic_vector(6 downto 0); -- saida para o display de sete segmentos
	hex2:out std_logic_vector(6 downto 0); 
	hex3:out std_logic_vector(6 downto 0)); 
End component;


signal soma_sig, resposta : std_logic_vector(n downto 0);
signal sub_sig : std_logic_vector(n-1 downto 0);
signal menor: std_logic;
signal soma1,soma2,soma3: std_logic_vector(n downto 0);
signal csub1,csub2,csub3:std_logic_vector(n downto 0);


begin 

soma: somador_nbits port map(a,'0',b, soma_sig);
sub: sub_espec port map(a,b,sub_sig, menor);
mux: mux2x1 port map("0" & sub_sig,soma_sig, sel, resposta);
cn: converte_neg port map(resposta(n-1 downto 0), csub1,csub2,csub3);
cs: converte_soma port map(resposta, soma1,soma2,soma3);

-----Entradas podem mudar----
cea: converte_entradas port map(a,hex6,hex7);
ceb: converte_entradas port map(b,hex4,hex5);

-----verificar abaixo na placa se de fato os hex são nesse sentido---

---adotando do 4 ao 6------

hex0<=soma1 when (menor='0') else
csub1;

hex1<=soma2 when (menor='0') else
csub2;

hex2 <=soma3 when(menor='0') else
csub3;



END comportamento;