library ieee;
use ieee.std_logic_1164.all;


entity comp_ident is
	generic(n: integer :=4);
	port(a:in std_logic_vector(N-1 downto 0);
	b:in std_logic_vector(N-1 downto 0);
	saida: out std_logic
	);
end comp_ident;


architecture funcionamento of comp_ident is
	signal s: std_logic_vector(N-1 downto 0);
	
	
	--declaracao de funcao
	function many_ands(vector:std_logic_vector) return std_logic is
		variable temp_and: std_logic:='1';
	begin 	
		for i in vector'range loop
			temp_and:=temp_and and vector(i);
		end loop;
		return temp_and;
	end function;
	--fim funcao
	
	
	begin 
		process(a)
			begin
				for i in a'range loop
					s(i)<=a(i) xnor b(i);
				end loop;
			saida<=many_ands(s);		
		end process;
		
end funcionamento;