library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity collatz_tb is 
end collatz_tb;

architecture testbench of collatz_tb is 
    signal clk, load, reset, en, carry_flags: std_logic;
    signal current_n, current_max : std_logic_vector(9 downto 0);
    signal n_in, current_count : std_logic_vector(7 downto 0 );
    constant clk_period : time := 50 fs;

    component collatz is
        port(
            load, reset, cloak, en: in std_logic;
            n_in: in std_logic_vector(7 downto 0);
            current_n, current_max: out std_logic_vector(9 downto 0);
            current_count: out std_logic_vector(7 downto 0);
            carry_flag: out std_logic
        );
    end component;

    begin
        u1 : collatz 
        port map(
            cloak => clk,
            load => load,
            reset => reset,
            en => en,
            n_in => n_in,
            current_n => current_n,
            current_max => current_max,
            current_count => current_count,
            carry_flag => carry_flags);

        genclk : process
        begin
            clk <= '0';
            wait for clk_period/2;
            clk <= '1';
            wait for clk_period/2;
        end process;

        tb : process
            begin
                reset <= '1';
                en <= '1';
                load <= '1';
                n_in <= "00011010";
                wait for 3*clk_period /2;
                load <= '0';
                reset <= '0';

                wait for clk_period*13;

                n_in <= "01010010";
                wait for 2*clk_period;
                load <= '1';
                wait for 3*clk_period;
                load <= '0';
                wait for 15*clk_period;
                
                n_in <= "11010010";
                load <= '1';
                wait for 3*clk_period/2;
                load <= '0';
                wait for 25*clk_period;
                
                n_in <= "11010010";
                load <= '1';
                wait for 3*clk_period/2;
                load <= '0';
                wait for 25*clk_period;

                wait;
            end process;

end testbench;