library ieee;
use ieee.std_logic_1164.all;


entity collatz is 
    port(
        load, reset, cloak, en: in std_logic;
        n_in: in std_logic_vector(7 downto 0);
        current_n, current_max: out std_logic_vector(9 downto 0);
        current_count: out std_logic_vector(7 downto 0);
        carry_flag: out std_logic
    );

end collatz;

architecture arch of collatz is 
    component mux1 is
        port(
            S: in std_logic_vector(1 downto 0);
            I0, I1, I2, I3: in std_logic_vector(9 downto 0);
            mux1_out: out std_logic_vector(9 downto 0)
        );
    end component;

    component mux2 is
        port(
            S: in std_logic;
            I0, I1: in std_logic_vector(9 downto 0);
            mux2_out: out std_logic_vector(9 downto 0)
        );
    end component;

    component reg10b is
        port(
            clk, reset, en : in std_logic;
            D : in std_logic_vector(9 downto 0);
            Q : out std_logic_vector(9 downto 0)

        );
    end component;

    component pari is
        port(
            pari_in: in std_logic_vector(9 downto 0);
            pari_out: out std_logic_vector(9 downto 0)
        );
    end component;

    component dispari is
        port(
            dispari_in : in std_logic_vector(9 downto 0);
            dispari_out : out std_logic_vector(9 downto 0);
            carry_out : out std_logic
        );
    end component;

    component comp10b is
        port(
            A, B : in std_logic_vector(9 downto 0);
            comp_out :  out std_logic
        );
    end component;

    component counter8b is
        port(
            clk, reset, en : in std_logic;
            Q : out std_logic_vector(7 downto 0)
        );
    end component;

    signal mux1s_out, mux2s_out, reg1s_out, reg2s_out, paris_out, disparis_out, maxs_out, I2_in : std_logic_vector(9 downto 0);
    signal counters_out : std_logic_vector(7 downto 0);
    signal S_in : std_logic_vector(1 downto 0);
    signal compare_out, clk, load_reset, carry_flags : std_logic;

    begin
        mux4to1: mux1
        port map(
            I0 =>paris_out,
            I1 =>disparis_out,
            I2 =>I2_in,
            I3 =>I2_in,
            S =>S_in,
            mux1_out => mux1s_out);

        current_n_reg: reg10b
        port map(
            D => mux1s_out,
            Q => reg1s_out,
            en => en,
            clk => clk,
            reset => reset);
        
        pari_block: pari
        port map(
            pari_in =>reg1s_out,
            pari_out =>paris_out);
        
        dispari_block: dispari
        port map(
            dispari_in => reg1s_out,
            dispari_out => disparis_out,
            carry_out => carry_flags);

        comparatore: comp10b
        port map(
            A => reg1s_out,
            B => reg2s_out,
            comp_out => compare_out);
        
        current_max_reg: reg10b
        port map(
            D =>mux2s_out,
            Q =>reg2s_out,
            en => en,
            clk => clk,
            reset => load_reset);

        mux2to1 : mux2
        port map(
            I0 => reg1s_out,
            I1 => reg2s_out,
            S => compare_out,
            mux2_out => mux2s_out);

        counter : counter8b
        port map(
            en => en,
            clk => clk,
            reset => load_reset,
            Q => counters_out);
        
        load_reset <= reset or load;
        
        I2_in <= "00" & n_in;

        S_in <= load & reg1s_out(0);

        
        current_n <= reg1s_out;
        current_max <= reg2s_out;
        current_count <= counters_out;
        carry_flag <= carry_flags and reg1s_out(0);
        
end arch;