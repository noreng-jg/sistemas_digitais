library ieee;
use ieee.std_logic_1164.all;

entity Q4FSM is
	port(cod, decod: in std_logic;
	clk: in std_logic;
	reset, loadr1, loadr2, op_ok,sel, load_mult, load_div:out std_logic);
end Q4FSM;

architecture behavior of Q4FSM is
	
	--declarando os estados
	type tipo_estado is (inicio, codifica, multiplica, decodifica, divide, pronto);
	signal estado_atual, proximo_estado: tipo_estado;
	
	
	--primeiro process sempre tem begin antes e ele preferencialmente e instanciado
	begin 
		
	registradordeestado: process(clk) --primeiro process pra indicar a logica de proximo estado
	
	begin
		if (rising_edge(clk)) then
			estado_atual<=proximo_estado;
		end if;
	
	
	end process;
	
	
	logicacomb1: process(estado_atual, cod)
	
		begin
		
		case estado_atual is
			
			when inicio => --primeiro estado
				reset<='1';
				loadr1<='0';
				loadr2<='0';
				op_ok<='0';
				
				if (cod='1') then
					proximo_estado<=codifica;
				elsif (decod='1') then
					proximo_estado<=decodifica;
				else 
					proximo_estado<=inicio;
				end if;
				
			when codifica =>
				reset<='0';
				loadr1<='1';
				proximo_estado<=multiplica;
				
			when multiplica =>
				load_mult<='1';
				sel<='1';
				proximo_estado<=pronto;
			
			when pronto =>
				op_ok<='1';
				proximo_estado<=inicio;
				
			
			when decodifica =>
				reset<='0';
				loadr2<='1';
				proximo_estado<=divide;
				
			
			when divide =>
				load_div<='1';
				sel<='0';
				proximo_estado<=pronto;
					
		end case;
				
	end process;

	
end behavior;