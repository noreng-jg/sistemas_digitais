library ieee;
use ieee.std_logic_1164.all;

entity teste is
end teste;

architecture full_testbench of teste is
	--declare component---
	component fsm_controle is
		port (clk, fim, start, reset: in std_logic;
		loada,loadb, selb, loadacc,pronto: out std_logic);
	end component;

	--declare signals---
	signal t_clk:std_logic:='0';
	signal t_fim: std_logic:='0';
	signal t_start:std_logic:='0';
	signal t_loada:std_logic;
	signal t_loadb:std_logic;
	signal t_selb:std_logic;
	signal t_loadacc:std_logic;
	signal t_pronto:std_logic;
	signal t_reset:std_logic:='0';
	

	begin


--instantiate---
	dut: fsm_controle port map(clk=>t_clk, fim=>t_fim, start=>t_start, reset=>t_reset,
loada=>t_loada, loadb=>t_loadb, selb=>t_selb, loadacc=>t_loadacc, pronto=>t_pronto);

--end instantiation--

--generete clk---

process
	begin 
		wait for 10ns;
		t_clk<=not(t_clk);
end process;

--end generate clk----


--generate fim-- Pulso de comeco	

process
	begin 
		wait for 20 ns;
			t_start<='1';
		        wait for 10 ns;
			t_start<='0';
			wait for 210ns;
			t_start<='1';
			wait for 10 ns;
			t_start<='0';	
		wait;
	end process;
--fim do pulso---



--inicio do fim --
process
	begin
		wait for 90 ns;
			t_fim<='1';
		wait for 20 ns;
			t_fim<='0';
		wait;
	end process;
--finaliza sinal do fim

--inicio de reset---
process
	begin 
		wait for 160 ns;
			t_reset<='1';
		        wait for 10 ns;
			t_reset<='0';
		wait;
	end process;
--fim do pulso---



end full_testbench;