library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp10b is
    port(
        A, B : in std_logic_vector(9 downto 0);
        comp_out :  out std_logic
    );

end comp10b;

architecture arch of comp10b is
    signal num1, num2 : unsigned(9 downto 0);
    begin
        num1 <= unsigned(A);
        num2 <= unsigned(B);
        comp_out <= '1' when num1 < num2 else '0';
end arch;