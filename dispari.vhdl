library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dispari is
    port(
        dispari_in : in std_logic_vector(9 downto 0);
        dispari_out : out std_logic_vector(9 downto 0);
        carry_out : out std_logic
    );

end dispari;

architecture arch1 of dispari is
    signal S : unsigned(11 downto 0);
    signal c : std_logic;
    begin
        S <= unsigned("00" & dispari_in) + unsigned('0' & dispari_in & '0') + "000000000001";
        c <= S(11) or S(10);
        carry_out <= S(11) or S(10);
        dispari_out <= std_logic_vector(S(9 downto 0)) when c='0' else 
            "0000000000";
end arch1;
