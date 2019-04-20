library ieee;
use ieee.std_logic_1164.all;

--Mudar posteriormente pra bloco comparador

entity bloco_comparador is
	port(a,b: in std_logic;
	igt,ieq,ilt: in std_logic;
	out_gt, out_eq, out_lt: out std_logic);
end bloco_comparador;

architecture funcionamento of bloco_comparador is
begin
			--talvez tenha que colocar uma and pra nao dar colisao de maior, igual, menor ao mesmo tempo
			out_gt<='1' when(igt='1') else
				'1' when (ieq='1') and (a='1' and b='0') else
				'0';
			out_lt<='1' when (ilt='1') else
			'1' when (ieq='1') and (a='0' and b='1') else
			'0';
			out_eq<='1' when (ieq='1') and (a='0' and b='0') else
			'1' when (ieq='1') and (a='1' and b='1') else
			'0';

end funcionamento;