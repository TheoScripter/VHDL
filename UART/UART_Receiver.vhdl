library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UART_Receiver is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           rx : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           data_received : out STD_LOGIC);
end UART_Receiver;

architecture Behavioral of UART_Receiver is
    signal start_bit : STD_LOGIC;
    signal shift_reg : STD_LOGIC_VECTOR(9 downto 0) := (others => '1');
    signal bit_count : INTEGER := 0;
    signal data_received_int : STD_LOGIC := '0';
begin
    process (clk, reset)
    begin
        if reset = '1' then
            start_bit <= '1';
            shift_reg <= (others => '1');
            bit_count <= 0;
            data_received_int <= '0';
        elsif rising_edge(clk) then
            if start_bit = '1' and rx = '0' then
                start_bit <= '0';
                bit_count <= 1;
            elsif start_bit = '0' then
                if bit_count < 9 then
                    shift_reg(bit_count - 1) <= rx;
                    bit_count <= bit_count + 1;
                elsif bit_count = 9 then
                    start_bit <= '1';
                    data_out <= shift_reg(7 downto 0);
                    data_received_int <= '1';
                end if;
            end if;
        end if;
    end process;

    data_received <= data_received_int;
end Behavioral;
