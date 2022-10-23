library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter8b is
    port(
        clk, reset, en : in std_logic;
        Q : out std_logic_vector(7 downto 0)
    );

end counter8b;

architecture arch of counter8b is
    signal count : unsigned(7 downto 0);
    begin
        process(clk, reset)
        begin
            if(reset='1') then
                count <= "00000000";
            elsif(rising_edge(clk) and en='1') then
                count <= count + "00000001";
            end if;
        end process;
        Q <= std_logic_vector(count(7 downto 0)); 
end arch;