
library ieee;
use ieee.std_logic_1164.all;

entity teste is
end teste;

architecture full_testbench of teste is
	--declare component---
component multiplica_2 is 
	generic(n:integer:=4);
	port(a:in std_logic_vector(n-1 downto 0);--
	b: in std_logic_vector(n-1 downto 0);--
	liga: in std_logic;
	clk: in std_logic;--
	resposta: out std_logic_vector(n+n-1 downto 0);
	s_transitorio: out std_logic_vector(n+n-1 downto 0);--
	termina:out std_logic
	);
end component;

	--declare signals---
	signal t_clk:std_logic:='0';
	signal t_start: std_logic:='0';
	signal t_termina:std_logic;
	signal signal_a: std_logic_vector(3 downto 0);
	signal signal_b:std_logic_vector(3 downto 0);
	signal signal_s:std_logic_vector(7 downto 0);
	signal signal_trans:std_logic_vector(7 downto 0);

begin


--instantiate---
	dut: multiplica_2 port map(a=>signal_a, b=>signal_b, liga=>t_start, 
clk=>t_clk, resposta=>signal_s,s_transitorio=>signal_trans, termina=>t_termina);

--end instantiation--

--generete clk---

process
	begin
		signal_a<="1111";
		wait for 1000ns;
		signal_a<="0100";
		wait for 1000ns;
		signal_a<="1010";
		wait for 1000ns;
		signal_a<="1100";
		wait;

end process;


process
	begin
		signal_b<="1110";
		wait for 1000ns;
		signal_b<="0110";
		wait for 100ns;
		signal_b<="1000";
		wait for 1000ns;
		signal_b<="1110";
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
		        wait for 100 ns;
			t_start<='1';
			wait for 100 ns;
			t_start<='0';
			wait for 200 ns;
			t_start<='1';
			wait for 100ns;
			t_start<='0';

		wait;
	end process;
--fim do pulso---





end full_testbench;