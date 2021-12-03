library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_32 is
  Port ( D : in std_logic_vector(31 downto 0);
         load, Clk : in std_logic;
         Q : out std_logic_vector(31 downto 0)
       );
end register_32;

architecture Behavioral of register_32 is
  begin
    process(Clk)
    begin
      if (rising_edge(Clk)) then
        if load='1' then
          Q <= D;
        end if;
      end if;
    end process;
  end Behavioral;
