library ieee;
use ieee.std_logic_1164.all;

entity pari is
    port(
        pari_in: in std_logic_vector(9 downto 0);
        pari_out: out std_logic_vector(9 downto 0);
        finish_flag : out std_logic
        );

end pari;

architecture arch of pari is
    signal pari_s : std_logic_vector(9 downto 0);
    begin
        pari_s <= '0' & pari_in(9 downto 1)
        pari_out <= pari_s;
        finish_flag <= '1' when pari_s = "0000000001" else '0';
end arch;