library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fad is
    port(
        a,b,cin : in std_logic;
        o, cout: out std_logic);
end fad;



architecture behavior of fad is
begin
    o <= a xor b xor cin;
    cout <= (a and b)or (cin and (a xor b));
end behavior;