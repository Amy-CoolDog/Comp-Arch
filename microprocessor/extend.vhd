library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Extend is
  port ( DR, SB : in STD_LOGIC_VECTOR(4 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end Extend;

architecture Behavioral of Extend is
  signal extend : STD_LOGIC_VECTOR(31 downto 0);

  begin
    extend(4 downto 0) <= SB;
    extend(9 downto 5) <= DR;
    extend(31 downto 10) <= "0000000000000000000000";
    Z <= extend;
  end Behavioral;
