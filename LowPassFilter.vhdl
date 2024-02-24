library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LowPassFilter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           x : in STD_LOGIC_VECTOR (7 downto 0);
           y : out STD_LOGIC_VECTOR (7 downto 0));
end LowPassFilter;

architecture Behavioral of LowPassFilter is
    signal y_reg : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
begin
    process (clk, reset)
        variable tmp : INTEGER;
    begin
        if reset = '1' then
            y_reg <= (others => '0');
        elsif rising_edge(clk) then
            tmp := to_integer(signed(x)) + to_integer(signed(y_reg)) / 2;
            y_reg <= std_logic_vector(to_unsigned(tmp, 8));
        end if;
    end process;

    y <= y_reg;
end Behavioral;
