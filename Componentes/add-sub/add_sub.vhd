library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add_sub is
    generic(N : natural := 4);
    port(
        a, b : in std_logic_vector(N-1 downto 0);
        sub : in std_logic;
        o : out std_logic_vector(N-1 downto 0);
        scout, ucout : out std_logic);

end add_sub;

architecture behavior of add_sub is
    signal carries : std_logic_vector(N downto 0);
    signal bXorSub : std_logic_vector(N-1 downto 0);
    component fad is
        port( a, b, cin : in std_logic;
                o, cout : out std_logic
        );
    end component;
begin
    carries(0) <= sub;
    subtraction: for i in 0 to N-1 generate
        bXorSub(i) <= b(i) xor sub; 
    end generate subtraction;

    RCA: for i in 0 to N-1 generate
        fadN: fad port map( 
            a => a(i), 
            b => bXorSub(i), 
            cin => carries(i),
            o => o(i), 
            cout => carries(i+1));
    end generate RCA;
    ucout <= carries(N);
    scout <= carries(N) xor carries(N-1);
end behavior;