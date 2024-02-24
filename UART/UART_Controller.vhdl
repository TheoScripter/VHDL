library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UART_Controller is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           rx_data_received : in STD_LOGIC;
           tx_ready : in STD_LOGIC;
           xon : in STD_LOGIC;
           xoff : in STD_LOGIC;
           interrupt : out STD_LOGIC);
end UART_Controller;

architecture Behavioral of UART_Controller is
    signal interrupt_flag : BOOLEAN := FALSE;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            interrupt_flag <= FALSE;
        elsif rising_edge(clk) then
            if rx_data_received = '1' or (tx_ready = '1' and xon = '1') or (tx_ready = '0' and xoff = '1') then
                interrupt_flag <= TRUE;
            else
                interrupt_flag <= FALSE;
            end if;
        end if;
    end process;

    interrupt <= '1' when interrupt_flag else '0';
end Behavioral;
