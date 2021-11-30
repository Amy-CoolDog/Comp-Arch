library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity B_Input_Logic is
  port ( B_in : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         B_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end B_Input_Logic;

architecture Behavioral of B_Input_Logic is
  begin
    B_out <= "00000000000000000000000000000000" when S = "00" else
             B_in when S = "01" else
             NOT B_in when S = "10" else
             "11111111111111111111111111111111" when S = "11";
           end Behavioral;
