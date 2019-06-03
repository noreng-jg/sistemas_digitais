library ieee;
use ieee.std_logic_1164.all;


entity fsm_controle is
	port (clk, fim,start,less, reset: in std_logic;
	loada,loadb,menor, loadr, loadq, selb,selb2,pronto: out std_logic);
end fsm_controle;


architecture controle of fsm_controle is
	type state is (espera,comeca,carrega, compara, finaliza);
	signal current_state,next_state: state;
begin
	
	process(clk)
			begin
				if(clk = '1' and clk'event) then
					current_state <=next_state;
				end if;
		end process;
		
	
	process(current_state, fim, start, reset,less)
		begin
			case current_state is
				when comeca=>
					loada<='1';
					loadb<='0';
					loadq<='1';
					selb<='0';
					selb2<='1';
					loadr<='1';
					pronto<='0';
					menor<='0';
					next_state<=carrega;
				when compara =>
					selb<='0';
					loada<='0';
					loadb<='0';
					pronto<='0';
					menor<='0';
					if fim='1' then
						next_state<=finaliza;
					else
						next_state<=compara;
					end if;
				when carrega=>
					loadb<='1';
					loada<='0';
					selb<='1';
					if less='0' then
					next_state<=compara;
					else
					menor<='1';
					next_state<=finaliza;
					end if;
				when finaliza=>
					loadq<='0';
					pronto<='1';
					loadr<='0';
					menor<='0';
					if reset='1' then
					next_state<=espera;
					end if;
				when espera=>
						loada<='0';
						loadb<='0';
						loadq<='0';
						loadr<='0';
						pronto<='0';
						selb<='0';
						selb2<='0';
						menor<='0';
						if start='1' then
							next_state<=comeca;
						else 
							next_state<=espera;
						end if;
				end case;
		end process;
		
end controle;