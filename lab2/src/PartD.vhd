library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PartD is
    generic(n: integer := 8);
    port(
        A    : in  STD_LOGIC_VECTOR(n-1 downto 0);
        Cin  : in  STD_LOGIC;
        S    : in  STD_LOGIC_VECTOR(3 downto 0);
        F    : out STD_LOGIC_VECTOR(n-1 downto 0);
        Cout : out STD_LOGIC
    );
end PartD;

architecture Behavioral of PartD is
begin
    process(A, Cin, S)
    begin
        case S is
            when "1100" => F <= A(n-2 downto 0) & '0'; Cout <= A(n-1);        -- LSL
            when "1101" => F <= A(n-2 downto 0) & A(n-1); Cout <= A(n-1);      -- ROL
            when "1110" => F <= A(n-2 downto 0) & Cin; Cout <= A(n-1);         -- ROL with carry
            when "1111" => F <= A(n-2 downto 0) & A(n-1); Cout <= Cin;         -- ROL with carry
            when others => F <= (others => '0'); Cout <= '0';
        end case;
    end process;
end Behavioral;
