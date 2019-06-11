library ieee;
use ieee.std_logic_1164.all;


entity fsm_controle is
	port (clk, liga, bi, igualou: in std_logic;
	conta, loada, loadb, loadacc, resetacc, loadresp: out std_logic;
	shlen, reseta_contador, resetaacc, pronto: out std_logic
	);
end fsm_controle;


architecture controle of fsm_controle is

	type state is (s0,s1,s2,s3,s4,s5,s6);
	signal current_state,next_state: state;
	
begin
	
	process(clk)
			begin
				if(clk = '1' and clk'event) then
					current_state <=next_state;
				end if;
		end process;
		
	
	process(current_state, liga, bi, igualou)
		begin
		
			case current_state is
			
				when s0=>
					
					conta<='0';
					loada<='0';
					loadb<='0';
					loadacc<='0';
					resetacc<='0';
					loadresp<='0';
					shlen<='0';
					pronto<='0';
					reseta_contador<='0';
					resetacc<='0';
					
					if liga='1' then
						next_state<=s1;
					else
						next_state<=s0;
					end if;
					
				when s1 =>
					
					loada<='1';
					loadb<='1';
					
					next_state<=s2;
					
				when s2=>
					loada<='0';
					loadb<='0';
					conta<='1';
					shlen<='0';
					
					if bi='1' then
						next_state<=s3;
					else
						next_state<=s4;
					end if;
					
				when s3 =>
					conta<='0';
					loadacc<='1';
					next_state<=s4;
					
				when s4=>
					shlen<='1';
					loadacc<='0';
					conta<='0';
					
					if igualou='1' then
						next_state<=s5;
					else
						next_state<=s2;
					end if;
				
				when s5 =>
					shlen<='0';
					loadresp<='1';
					next_state<=s6;
				
				when s6 =>
					reseta_contador<='1';
					pronto<='1';
					loadresp<='0';
					resetaacc<='1';
					next_state<=s0;
				
				end case;
				
			
		end process;
		
end controle;
