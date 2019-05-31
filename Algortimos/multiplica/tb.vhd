
library ieee;
use ieee.std_logic_1164.all;

entity teste is
end teste;

architecture full_testbench of teste is
	--declare component---
component multiplica is 
	generic(n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);--
	b: in std_logic_vector(n-1 downto 0);--
	iniciar: in std_logic;
	clk: in std_logic;--
	s: out std_logic_vector(n+n-1 downto 0);--
	termina:out std_logic
	);
end component;

	--declare signals---
	signal t_clk:std_logic:='0';
	signal t_start: std_logic:='1';
	signal t_termina:std_logic;
	signal signal_a: std_logic_vector(3 downto 0);
	signal signal_b:std_logic_vector(3 downto 0);
	signal signal_s:std_logic_vector(7 downto 0);

begin


--instantiate---
	dut: multiplica port map(a=>signal_a, b=>signal_b, iniciar=>t_start, 
clk=>t_clk, s=>signal_s, termina=>t_termina);

--end instantiation--

--generete clk---

process
	begin
		signal_a<="1111";
		wait for 100ns;
		signal_a<="0000";
		wait;
end process;


process
	begin
		signal_b<="1110";
		wait for 100ns;
		signal_b<="0000";
		wait;
end process;


process
	begin 
		wait for 30ns;
		t_clk<=not(t_clk);
end process;

--end generate clk----


--generate fim-- Pulso de comeco	

process
	begin 
		        wait for 60 ns;
			t_start<='0';
		wait;
	end process;
--fim do pulso---





end full_testbench;