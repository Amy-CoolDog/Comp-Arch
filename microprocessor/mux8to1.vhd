library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX8to1 is
  port ( in0, in1, in2, in3, in4, in5, in6, in7 : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(2 downto 0);
         Z : out STD_LOGIC
  );
end MUX8to1;

architecture Behavioral of MUX8to1 is
  begin
    Z <= in0 when S = "000" else
         in1 when S = "001" else
         in2 when S = "010" else
         in3 when S = "011" else
         in4 when S = "100" else
         in5 when S = "101" else
         in6 when S = "110" else
         in7 when S = "111" else
         '0';
       end Behavioral;
