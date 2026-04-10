library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALSU is
    generic(n: integer := 8);
    port(
        A    : in  STD_LOGIC_VECTOR(n-1 downto 0);
        B    : in  STD_LOGIC_VECTOR(n-1 downto 0);
        Cin  : in  STD_LOGIC;
        S    : in  STD_LOGIC_VECTOR(3 downto 0);
        F    : out STD_LOGIC_VECTOR(n-1 downto 0);
        Cout : out STD_LOGIC
    );
end ALSU;

architecture Behavioral of ALSU is
    signal F_partA, F_partB, F_partC, F_partD: STD_LOGIC_VECTOR(n-1 downto 0);
    signal Cout_partA, Cout_partC, Cout_partD: STD_LOGIC;
begin

    U_PARTA: entity work.PartA
        generic map(n => n)
        port map(A => A, B => B, Cin => Cin, S => S, F => F_partA, Cout => Cout_partA);

    U_PARTB: entity work.PartB
        generic map(n => n)
        port map(A => A, B => B, S => S, F => F_partB);

    U_PARTC: entity work.PartC
        generic map(n => n)
        port map(A => A, Cin => Cin, S => S, F => F_partC, Cout => Cout_partC);

    U_PARTD: entity work.PartD
        generic map(n => n)
        port map(A => A, Cin => Cin, S => S, F => F_partD, Cout => Cout_partD);

    -- Output selection based on S[3:2] (Arithmetic, Logic, Shift/Rotate)
    process(S, F_partA, F_partB, F_partC, F_partD, Cout_partA, Cout_partC, Cout_partD)
    begin
        case S(3 downto 2) is
            when "00" =>
                F <= F_partA; Cout <= Cout_partA;
            when "01" =>
                F <= F_partB; Cout <= '0';
            when "10" =>
                F <= F_partC; Cout <= Cout_partC;
            when "11" =>
                F <= F_partD; Cout <= Cout_partD;
            when others =>
                F <= (others => '0'); Cout <= '0';
        end case;
    end process;

end Behavioral;
