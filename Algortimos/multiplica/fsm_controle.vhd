library ieee;
use ieee;std_logic_1164.all;


entity fsm_controle is
	port (clk, fim: in std_logic;
	loada,loadb, selb, selacc, loadacc,pronto: out std_logic);
end fsm_controle;


architecture controle of fsm_controle is
	type state is (comeca, compara, opera, finaliza);
	signal current_state,next_state: state;
begin
	
	process(clk)
		begin
			if (rising_edge(clk))
				current_state <=next_state;
		end process;
		
	
	process(clk, fim)
		begin
			case current_state is
				when comeca=>
					loada='1';
					loadb='1';
					selb='0';
					loadacc='1';
					selacc='0';
					next_state<=compara;
				when compara =>
					if fim='1' then
						next_state<=finaliza;
					else
						next_state<=opera
					end if;
				when finaliza=>
					pronto<='1';
					next_state<=finaliza;
				when opera=>
					selacc='1';
					selb='1';
					next_state<=compara;
		end process;
		
end controle;