library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity partB is
    Port (
        A  : in  STD_LOGIC_VECTOR(7 downto 0);
        B  : in  STD_LOGIC_VECTOR(7 downto 0);
        S1 : in  STD_LOGIC;
        S0 : in  STD_LOGIC;
        F  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end partB;

architecture Behavioral of partB is
    signal Sel : STD_LOGIC_VECTOR(1 downto 0);
begin
    Sel <= S1 & S0;

    process(A, B, Sel)
    begin
        case Sel is
            when "00" => F <= A and B;        -- AND
            when "01" => F <= A or B;         -- OR
            when "10" => F <= not (A or B);   -- NOR
            when "11" => F <= not A;           -- NOT A
            when others => F <= (others => '0');
        end case;
    end process;
end Behavioral;

