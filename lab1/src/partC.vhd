library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity partC is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        S1   : in  STD_LOGIC;
        S0   : in  STD_LOGIC;
        F    : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end partC;

architecture Behavioral of partC is
    signal Sel : STD_LOGIC_VECTOR(1 downto 0);  -- helper signal for case
begin
    Sel <= S1 & S0;

    process(A, Cin, Sel)
    begin
        case Sel is
            when "00" =>  -- Logical shift right
                F    <= '0' & A(7 downto 1);
                Cout <= A(0);
            when "01" =>  -- Rotate right
                F    <= A(0) & A(7 downto 1);
                Cout <= A(0);
            when "10" =>  -- Rotate right with Carry
                F    <= Cin & A(7 downto 1);
                Cout <= A(0);
            when "11" =>  -- Arithmetic shift right
                F    <= A(7) & A(7 downto 1);
                Cout <= A(0);
            when others =>
                F    <= (others => '0');
                Cout <= '0';
        end case;
    end process;
end Behavioral;

