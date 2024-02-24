library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_filter is
end testbench_filter;

architecture Behavioral of testbench_filter is
    signal clk : STD_LOGIC := '0';
    signal reset : STD_LOGIC := '0';
    signal x : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal y : STD_LOGIC_VECTOR (7 downto 0);

    component LowPassFilter
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               x : in STD_LOGIC_VECTOR (7 downto 0);
               y : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    UUT: LowPassFilter port map (clk, reset, x, y);

    clk_process : process
    begin
        while now < 1000 ns loop
            clk <= not clk;
            wait for 5 ns;
        end loop;
        wait;
    end process;

    stimulus_process : process
    begin
        reset <= '1';
        wait for 20 ns;
        reset <= '0';

        -- Envoyer des données
        x <= "11011010";
        wait for 100 ns;

        -- Ajouter d'autres séquences si vous le voulez

        wait for 100 ns;
        assert false report "Simulation terminée avec succès" severity note;
        wait;
    end process;
end Behavioral;
