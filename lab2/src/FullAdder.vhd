library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FullAdder is
    generic(n: integer := 8);
    port(
        A    : in  std_logic_vector(n-1 downto 0);
        B    : in  std_logic_vector(n-1 downto 0);
        Cin  : in  std_logic;
        Sum  : out std_logic_vector(n-1 downto 0);
        Cout : out std_logic
    );
end entity;

architecture Behavioral of FullAdder is
    signal C: std_logic_vector(n downto 0);
begin
    C(0) <= Cin;
    gen_FA: for i in 0 to n-1 generate
        Sum(i) <= A(i) xor B(i) xor C(i);
        C(i+1) <= (A(i) and B(i)) or (A(i) and C(i)) or (B(i) and C(i));
    end generate;
    Cout <= C(n);
end architecture;
