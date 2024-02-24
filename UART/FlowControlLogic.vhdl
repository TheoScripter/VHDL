library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FlowControlLogic is
    Port ( rx_data : in STD_LOGIC;
           tx_ready : in STD_LOGIC;
           xon : out STD_LOGIC;
           xoff : out STD_LOGIC);
end FlowControlLogic;

architecture Behavioral of FlowControlLogic is
    signal xon_sent : BOOLEAN := TRUE;
    signal xoff_sent : BOOLEAN := FALSE;
begin
    process (rx_data, tx_ready)
    begin
        if rx_data = '1' then
            xon_sent <= TRUE;
            xoff_sent <= FALSE;
        elsif tx_ready = '1' then
            xon_sent <= FALSE;
            xoff_sent <= TRUE;
        end if;
    end process;

    xon <= '1' when xon_sent else '0';
    xoff <= '1' when xoff_sent else '0';
end Behavioral;
