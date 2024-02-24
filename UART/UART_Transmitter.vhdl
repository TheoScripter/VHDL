library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UART_Transmitter is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           tx : out STD_LOGIC);
end UART_Transmitter;

architecture Behavioral of UART_Transmitter is
    signal start_bit : STD_LOGIC := '1';
    signal stop_bit : STD_LOGIC := '1';
    signal shift_reg : STD_LOGIC_VECTOR(9 downto 0) := (others => '1');
    signal bit_count : INTEGER := 0;
    signal tx_reg : STD_LOGIC := '1';
begin
    process (clk, reset)
    begin
        if reset = '1' then
            start_bit <= '1';
            stop_bit <= '1';
            shift_reg <= (others => '1');
            bit_count <= 0;
            tx_reg <= '1';
        elsif rising_edge(clk) then
            if start_bit = '1' then
                if bit_count = 0 then
                    tx_reg <= '0'; -- start bit
                elsif bit_count < 9 then
                    tx_reg <= data_in(bit_count - 1);
                elsif bit_count = 9 then
                    tx_reg <= '1'; -- stop bit
                else
                    start_bit <= '0';
                end if;
                
                if bit_count = 10 then
                    bit_count <= 0;
                else
                    bit_count <= bit_count + 1;
                end if;
            end if;
        end if;
    end process;

    tx <= tx_reg;
end Behavioral;
