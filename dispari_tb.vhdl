library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dispari_tb is 
end dispari_tb;

architecture testbench of dispari_tb is 
        component dispari is
            port(
                dispari_in : in std_logic_vector(9 downto 0);
                dispari_out : out std_logic_vector(9 downto 0);
                carry_out : out std_logic
            );
        end component;

        signal dispari_ins, dispari_outs : std_logic_vector(9 downto 0);
        signal carry_outs : std_logic;

        begin
        
            u1 : dispari
            port map(
                dispari_in => dispari_ins,
                dispari_out => dispari_outs,
                carry_out => carry_outs
            );

            tb : process
                begin
                    dispari_ins <= "0101001101";
                    wait for 100 fs;
                    
                    dispari_ins <= "0111001101";
                    wait for 100 fs;
                    
                    dispari_ins <= "0110011101";
                    wait for 100 fs;

                    dispari_ins <= "1111001101";
                    wait for 100 fs;
                    
                    dispari_ins <= "0101101101";
                    wait for 100 fs;

                    wait;
            end process;
end testbench;