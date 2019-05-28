library ieee;
use ieee.std_logic_1164.all;


entity teste_m_controle is
	port (clk, fim,start: in std_logic;
	loada,loadb, selb, loadacc,pronto: out std_logic);
end teste_m_controle;


architecture controle of teste_m_controle is
	type state is (espera,comeca, compara, opera, finaliza);
	signal current_state,next_state: state;
begin
	
	process(clk)
			begin
				if(clk = '1' and clk'event) then
					current_state <=next_state;
				end if;
		end process;
		
	
	process(current_state, fim, start)
		begin
			case current_state is
				when comeca=>
					loada<='1';
					loadb<='1';
					selb<='0';
					loadacc<='0';
					pronto<='0';
					next_state<=compara;
				when compara =>
					selb<='1';
					loadacc<='1';					
					if fim='1' then
						next_state<=finaliza;
					else
						next_state<=opera;
					end if;
				when finaliza=>
					pronto<='1';
					next_state<=espera;
				when espera=>
						loada<='0';
						loadb<='0';
						if start='1' then
							next_state<=comeca;
						else 
							next_state<=espera;
						end if;
				when opera=>
					loadacc<='1';
					selb<='1';
					next_state<=compara;
				end case;
		end process;
		
end controle;