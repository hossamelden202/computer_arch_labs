library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PartA is
    generic(n : integer := 8);
    port(
        A    : in  STD_LOGIC_VECTOR(n-1 downto 0);
        B    : in  STD_LOGIC_VECTOR(n-1 downto 0);
        Cin  : in  STD_LOGIC;
        S    : in  STD_LOGIC_VECTOR(3 downto 0);
        F    : out STD_LOGIC_VECTOR(n-1 downto 0);
        Cout : out STD_LOGIC
    );
end PartA;

architecture Behavioral of PartA is
    signal B_sel   : STD_LOGIC_VECTOR(n-1 downto 0);
    signal Cin_sel : STD_LOGIC;
    signal Sum     : STD_LOGIC_VECTOR(n-1 downto 0);
    signal Cout_int: STD_LOGIC;
begin

    process(A, B, Cin, S)
    begin
        case S is
            when "0000" =>
                if Cin='0' then
                    B_sel   <= (others => '0');
                    Cin_sel <= '0';
                else
                    B_sel   <= (others => '0');
                    Cin_sel <= '1';
                end if;
            when "0001" =>
                B_sel   <= B;
                Cin_sel <= Cin;
            when "0010" =>
                B_sel   <= not B;
                Cin_sel <= not Cin;
            when "0011" =>
                if Cin='0' then
                    B_sel   <= (others => '1');
                    Cin_sel <= '0';
                else
                    B_sel   <= (others => '0');
                    Cin_sel <= '0';
                end if;
            when others =>
                B_sel   <= (others => '0');
                Cin_sel <= '0';
        end case;
    end process;

    FA_inst: entity work.FullAdder
        generic map(n => n)
        port map(A => A, B => B_sel, Cin => Cin_sel, Sum => Sum, Cout => Cout_int);

    F    <= Sum;
    Cout <= Cout_int;

end Behavioral;
