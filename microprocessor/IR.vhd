library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity InReg is
  port ( IR : in STD_LOGIC_VECTOR(31 downto 0);
         IL : in STD_LOGIC;
         opcode : out STD_LOGIC_VECTOR(16 downto 0);
         DR, SA, SB : out STD_LOGIC_VECTOR(4 downto 0)
  );
end InReg;

architecture Behavioral of InReg is
  begin
    opcode <= IR(31 downto 15) when IL = '1';
    DR <= IR(14 downto 10) when IL = '1';
    SA <= IR(9 downto 5) when IL = '1';
    SB <= IR(4 downto 0) when IL = '1';
  end Behavioral;
