library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UART_System_Testbench is
end UART_System_Testbench;

architecture Behavioral of UART_System_Testbench is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal tx : STD_LOGIC;
    signal rx : STD_LOGIC := '1';
    signal data_in : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
    signal data_out : STD_LOGIC_VECTOR (7 downto 0);
    signal data_received : STD_LOGIC;
    signal interrupt : STD_LOGIC;

    constant clk_period : time := 10 ns;

    component UART_System
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               tx : out STD_LOGIC;
               rx : in STD_LOGIC;
               data_in : in STD_LOGIC_VECTOR (7 downto 0);
               data_out : out STD_LOGIC_VECTOR (7 downto 0);
               data_received : out STD_LOGIC;
               interrupt : out STD_LOGIC);
    end component;

begin
    UUT: UART_System port map (clk, reset, tx, rx, data_in, data_out, data_received, interrupt);

    clk_process : process
    begin
        while now < 1000 ns loop
            clk <= not clk;
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    stimulus_process : process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Envoyer des données
        data_in <= "11011010";  -- Exemple de données à envoyer
        wait for 100 ns;

        -- Simuler l'arrêt de la transmission pour laisser la place à la réception
        rx <= '0';
        wait for 50 ns;

        -- Réception des données
        rx <= '1';
        wait for 100 ns;

        -- Ajouter d'autres séquences de test au besoin

        wait for 100 ns;
        assert false report "Simulation terminée avec succès" severity note;
        wait;
    end process;
end Behavioral;
