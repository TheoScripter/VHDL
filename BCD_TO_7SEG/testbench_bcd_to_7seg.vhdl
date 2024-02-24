library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench_bcd_to_7seg is
end testbench_bcd_to_7seg;

architecture Behavioral of testbench_bcd_to_7seg is
    signal BCD : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal SevenSeg : STD_LOGIC_VECTOR (6 downto 0);

    component BCD_to_7seg
        Port ( BCD : in STD_LOGIC_VECTOR (3 downto 0);
               SevenSeg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

begin
    UUT: BCD_to_7seg port map (BCD, SevenSeg);

    stimulus_process : process
    begin
        BCD <= "0000"; 
        wait for 10 ns;
        
        BCD <= "0001";
        wait for 10 ns;
        
        -- Ajouter d'autres séquences si vous le voulez 

        wait;
    end process;
end Behavioral;
