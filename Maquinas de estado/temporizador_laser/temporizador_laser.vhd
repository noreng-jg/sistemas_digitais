Library ieee;
use ieee.std_logic_1164.all;

entity temporizador_laser is
	port(b: in std_logic;
	x: out std_logic;
	clk,rst: in std_logic);
end temporizador_laser;

architecture comportamento of temporizador_laser is
	type tipoestado is (Desl, Lig1, Lig2, Lig3);

signal estadoatual, proximoestado: tipoestado;

begin
registradordeestado: process(clk, rst)


begin

	if (rst = '1') then -- estado inicial
		estadoatual <= Desl;
		
	elsif (clk = '1' and clk'event) then
		estadoatual <= proximoestado;
	end if;
	end process;
logicacomb: process(estadoatual, b)
begin
case estadoatual is
when Desl =>
x<='0'; -- laser desligado
if (b='0') then
proximoestado <= Desl;
else
proximoestado <= Lig1;
end if;
when Lig1 =>
x<='1'; -- laser ligado
proximoestado <= Lig2;
when Lig2 =>
x<='1'; -- laser ainda ligado
proximoestado <= Lig3;
when Lig3 =>
x<='1'; -- laser ainda ligado
proximoestado <= Desl;
end case;
end process;
end comportamento;