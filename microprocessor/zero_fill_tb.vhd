library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity zero_fill_tb is
end zero_fill_tb;

architecture Behavioral of zero_fill_tb is
  component zero_fill
  port ( SB : in STD_LOGIC_VECTOR(4 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  -- input
  signal SB : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');

  -- output
  signal Z : STD_LOGIC_VECTOR(31 downto 0);

  begin
    uut : zero_fill
    port map ( SB => SB,
               Z => Z
    );

    stim_proc : process
    begin
      SB <= "10101";
      wait for 10 ns;
      SB <= "01010";
      wait for 10 ns;
    end process;
  end;
