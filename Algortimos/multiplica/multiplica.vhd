library ieee;
use ieee.std_logic_1164.all;


entity multiplica is 

end multiplica;


architecture func of multiplica is

signal s_loada,sloadb, s_loadacc, s_sel_acc, s_selb: std_logic;
signal clk: std_logic;

component fsm_controle
	port (clk, fim: in std_logic;
	loada,loadb, selb, selacc, loadacc,pronto: out std_logic);
end component;

component datapath
	--declare datapath
end component;

begin

end func;