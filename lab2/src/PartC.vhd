library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PartC is
    generic(n: integer := 8);
    port(
        A    : in  STD_LOGIC_VECTOR(n-1 downto 0);
        Cin  : in  STD_LOGIC;
        S    : in  STD_LOGIC_VECTOR(3 downto 0);
        F    : out STD_LOGIC_VECTOR(n-1 downto 0);
        Cout : out STD_LOGIC
    );
end PartC;

architecture Behavioral of PartC is
begin
    process(A, Cin, S)
        variable temp: STD_LOGIC_VECTOR(A'range);
    begin
        case S is
            when "1000" => F <= '0' & A(n-1 downto 1); Cout <= A(0);            -- LSR
            when "1001" => F <= A(n-1) & A(n-1 downto 1); Cout <= A(0);          -- ROR
            when "1010" => F <= Cin & A(n-1 downto 1); Cout <= A(0);             -- ROR with Carry
            when "1011" => F <= A(n-1) & A(n-1 downto 1); Cout <= Cin;           -- ROR with Carry
            when others => F <= (others => '0'); Cout <= '0';
        end case;
    end process;
end Behavioral;
