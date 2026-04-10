library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PartB is
    generic(n: integer := 8);
    port(
        A : in  STD_LOGIC_VECTOR(n-1 downto 0);
        B : in  STD_LOGIC_VECTOR(n-1 downto 0);
        S : in  STD_LOGIC_VECTOR(3 downto 0);
        F : out STD_LOGIC_VECTOR(n-1 downto 0)
    );
end PartB;

architecture Behavioral of PartB is
begin
    process(A, B, S)
    begin
        case S is
            when "0100" => F <= A AND B;
            when "0101" => F <= A OR B;
            when "0110" => F <= not (A OR B); -- NOR
            when "0111" => F <= not A;         -- NOT
            when others => F <= (others => '0');
        end case;
    end process;
end Behavioral;
