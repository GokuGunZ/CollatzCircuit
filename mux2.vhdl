library ieee;
use ieee.std_logic_1164.all;

entity mux2 is 
    port(
        S: in std_logic;
        I0, I1: in std_logic_vector(9 downto 0);
        mux2_out: out std_logic_vector(9 downto 0)
    );
end mux2;

architecture arch of mux2 is 
begin 
    mux2_out <= I0 when S = '0' else
                I1 when S = '1' else
                "XXXXXXXXXX";
end arch;