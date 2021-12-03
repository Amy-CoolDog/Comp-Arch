library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_fill is
  port ( SB : in STD_LOGIC_VECTOR(4 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end zero_fill;

architecture Behavioral of zero_fill is
  signal zero : STD_LOGIC_VECTOR(31 downto 0);
  begin
    zero(4 downto 0) <= SB;
    zero(31 downto 5) <= "000000000000000000000000000";
    Z <= zero;
  end Behavioral;
