library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX4to1 is
  Port ( in0, in1, in2, in3 : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC
  );
end MUX4to1;

architecture Behavioral of MUX4to1 is
  begin
    Z <= in0 when S = "00" else
         in1 when S = "01" else
         in2 when S = "10" else
         in3 when S = "11" else
         '0';
       end Behavioral;
