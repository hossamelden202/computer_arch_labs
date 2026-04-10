library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        S    : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin  : in  STD_LOGIC;
        F    : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end ALU;

architecture Structural of ALU is
    component partB
        Port ( A, B : in STD_LOGIC_VECTOR(7 downto 0);
               S1, S0 : in STD_LOGIC;
               F : out STD_LOGIC_VECTOR(7 downto 0) );
    end component;

    component partC
        Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
               Cin, S1, S0 : in STD_LOGIC;
               F : out STD_LOGIC_VECTOR(7 downto 0);
               Cout : out STD_LOGIC );
    end component;

    component partD
        Port ( A : in STD_LOGIC_VECTOR(7 downto 0);
               Cin, S1, S0 : in STD_LOGIC;
               F : out STD_LOGIC_VECTOR(7 downto 0);
               Cout : out STD_LOGIC );
    end component;

    signal F_B, F_C, F_D : STD_LOGIC_VECTOR(7 downto 0);
    signal Cout_C, Cout_D : STD_LOGIC;
begin
    uB: partB port map(A => A, B => B, S1 => S(1), S0 => S(0), F => F_B);
    uC: partC port map(A => A, Cin => Cin, S1 => S(1), S0 => S(0), F => F_C, Cout => Cout_C);
    uD: partD port map(A => A, Cin => Cin, S1 => S(1), S0 => S(0), F => F_D, Cout => Cout_D);

    process(S, F_B, F_C, F_D, Cout_C, Cout_D)
    begin
        case S(3 downto 2) is
            when "01" => F <= F_B; Cout <= '0';
            when "10" => F <= F_C; Cout <= Cout_C;
            when "11" => F <= F_D; Cout <= Cout_D;
            when others => F <= (others => '0'); Cout <= '0';
        end case;
    end process;
end Structural;

