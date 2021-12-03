library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity extend_tb is
end extend_tb;

architecture Behavioral of extend_tb is
  component extend
  port ( DR, SB : in STD_LOGIC_VECTOR(4 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  -- input
  signal DR, SB : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');

  -- output
  signal Z : STD_LOGIC_VECTOR(31 downto 0);

  begin
    uut : extend
    port map ( DR => DR,
               SB => SB,
               Z => Z
    );

    stim_proc : process
    begin
      DR <= "10101";
      SB <= "01010";
      wait for 10 ns;
    end process;
  end;
