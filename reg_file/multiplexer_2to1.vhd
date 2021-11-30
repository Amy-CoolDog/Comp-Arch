library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_2to1_32bit is
  Port ( in0 : in std_logic_vector(31 downto 0);
         in1 : in std_logic_vector(31 downto 0);
         s : in std_logic;
         Z : out std_logic_vector(31 downto 0)
         );
  end multiplexer_2to1_32bit;

architecture Behavioral of multiplexer_2to1_32bit is
  begin
    Z <= in0 after 10 ns when s='0'
         else in1 after 10 ns when s='1'
         else "00000000000000000000000000000000" after 10 ns;
  end Behavioral;
