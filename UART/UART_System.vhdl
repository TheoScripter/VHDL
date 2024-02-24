library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UART_System is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           tx : out STD_LOGIC;
           rx : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           data_received : out STD_LOGIC;
           interrupt : out STD_LOGIC);
end UART_System;

architecture Behavioral of UART_System is
    signal tx_ready : STD_LOGIC;
    signal xon, xoff : STD_LOGIC;
    signal data_received_int : STD_LOGIC;
begin
    -- Emetteur UART
    UART_Transmitter_inst : entity work.UART_Transmitter
        port map (clk, reset, data_in, tx);

    -- Récepteur UART
    UART_Receiver_inst : entity work.UART_Receiver
        port map (clk, reset, rx, data_out, data_received_int);

    -- Logique de Contrôle de Flux (XON/XOFF)
    FlowControlLogic_inst : entity work.FlowControlLogic
        port map (data_received_int, tx_ready, xon, xoff);

    -- Contrôleur d'Interruption
    UART_Controller_inst : entity work.UART_Controller
        port map (clk, reset, data_received_int, tx_ready, xon, xoff, interrupt);

    process (clk, reset)
    begin
        if reset = '1' then
            tx_ready <= '1';
        elsif rising_edge(clk) then
            tx_ready <= not (xon = '0' and xoff = '1');
        end if;
    end process;
end Behavioral;
