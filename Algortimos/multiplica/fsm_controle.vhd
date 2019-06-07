library ieee;
use ieee.std_logic_1164.all;


entity fsm_controle is
	port (clk, fim,start, reset: in std_logic;
	loada,loadb, selb, loadacc,pronto: out std_logic);
end fsm_controle;


architecture controle of fsm_controle is
	type state is (espera,comeca, extra,compara, finaliza);
	signal current_state,next_state: state;
begin
	
	process(clk)
			begin
				if(clk = '1' and clk'event) then
					current_state <=next_state;
				end if;
		end process;
		
	
	process(current_state, fim, start, reset)
		begin
			case current_state is
				when comeca=>
					loada<='1';
					loadb<='1';
					selb<='0';
					loadacc<='1';
					next_state<=compara;
				when compara =>
					selb<='1';
					loada<='0';
					loadb<='0';
					if fim='1' then
						next_state<=finaliza;
					else
						next_state<=compara;
					end if;
				when finaliza=>
					pronto<='1';
					loadacc<='0';
					next_state<=extra;
				when extra=>
					selb<='0';
					pronto<='0';
					if reset='0' then
						next_state<=extra;
					else 
						next_state<=espera;
					end if;
				when espera=>
						loada<='0';
						loadb<='0';
						loadacc<='0';
						pronto<='0';
						selb<='0';
						if start='1' then
							next_state<=comeca;
						else 
							next_state<=espera;
						end if;
				end case;
		end process;
		
end controle;