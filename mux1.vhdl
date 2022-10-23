library ieee;
use ieee.std_logic_1164.all;

entity mux1 is 
    port(
        S: in std_logic_vector(1 downto 0);
        I0, I1, I2, I3: in std_logic_vector(9 downto 0);
        mux1_out: out std_logic_vector(9 downto 0)
    );
end mux1;

architecture arch of mux1 is 
begin 
    mux1_out <= I0 when S = "00" else
                I1 when S = "01" else
                I2 when S = "10" else
                I3 when S = "11" else
                "XXXXXXXXXX";
end arch;