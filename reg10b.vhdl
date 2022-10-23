library ieee;
use ieee.std_logic_1164.all;

entity reg10b is
    port(
        clk, reset, en : in std_logic;
        D : in std_logic_vector(9 downto 0);
        Q : out std_logic_vector(9 downto 0)

    );

end reg10b;

architecture arch of reg10b is
    begin
        process (clk,reset)
            begin
                if (reset = '1') then
                    Q<= "0000000000";
                elsif(rising_edge(clk) and en='1') then
                    Q<=D;
                end if;
        end process;
end arch;