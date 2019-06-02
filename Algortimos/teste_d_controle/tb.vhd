library ieee;
use ieee.std_logic_1164.all;

entity teste is
end teste;

architecture full_testbench of teste is
	--declare component---
	
component fsm_controle is
	port (clk, fim,start,less, reset: in std_logic;
	loada,loadb,menor, loadr, loadq, selb,selb2,pronto: out std_logic);
end component;

	--declare signals---
	signal t_clk:std_logic:='0';
	signal t_fim: std_logic:='0';
	signal t_start:std_logic:='0';
	signal t_less:std_logic:='0';
	signal t_rst:std_logic:='0';
	signal t_loada:std_logic;
	signal t_loadb:std_logic;
	signal t_loadr:std_logic;
	signal t_loadq:std_logic;
	signal t_selb:std_logic;
	signal t_menor:std_logic;
	signal t_pronto:std_logic;
	

	begin


--instantiate---
	dut: fsm_controle port map(clk=>t_clk, fim=>t_fim, start=>t_start, less=>t_less,
reset=>t_rst,loada=>t_loada, loadb=>t_loadb,menor=>t_menor, loadr=>t_loadr, loadq=>t_loadq, selb=>t_selb, 
pronto=>t_pronto);

--end instantiation--

--generete clk---

process
	begin 
		wait for 30ns;
		t_clk<=not(t_clk);
end process;

--end generate clk----


--generate fim-- Pulso de comeco	

process
	begin 
		wait for 30 ns;
			t_start<='1';
		        wait for 60 ns;
			t_start<='0';
		wait;
	end process;
--fim do pulso---



--inicio do fim --
process
	begin
		wait for 810 ns;
			t_fim<='1';
		wait for 60 ns;
			t_fim<='0';
		wait;
	end process;
--finaliza sinal do fim
process
	begin
		wait for 170 ns;
			t_less<='1';
		wait for 60 ns;
			t_less<='0';
		wait;
	end process;
process
	begin
		wait for 510 ns;
			t_rst<='1';
		wait for 60 ns;
			t_rst<='0';
		wait;
	end process;



end full_testbench;