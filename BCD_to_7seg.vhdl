library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BCD_to_7seg is
    Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
           SevenSeg : out  STD_LOGIC_VECTOR (6 downto 0));
end BCD_to_7seg;

architecture Behavioral of BCD_to_7seg is
begin
    process (BCD)
    begin
        case BCD is
            when "0000" =>
                SevenSeg <= "0000001"; -- 0
            when "0001" =>
                SevenSeg <= "1001111"; -- 1
            when "0010" =>
                SevenSeg <= "0010010"; -- 2
            when "0011" =>
                SevenSeg <= "0000110"; -- 3
            when "0100" =>
                SevenSeg <= "1001100"; -- 4
            when "0101" =>
                SevenSeg <= "0100100"; -- 5
            when "0110" =>
                SevenSeg <= "0100000"; -- 6
            when "0111" =>
                SevenSeg <= "0001111"; -- 7
            when "1000" =>
                SevenSeg <= "0000000"; -- 8
            when "1001" =>
                SevenSeg <= "0000100"; -- 9
            when others =>
                SevenSeg <= "1111111"; -- All segments off for invalid input
        end case;
    end process;
end Behavioral;
