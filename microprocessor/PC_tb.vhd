library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgC_tb is
end ProgC_tb;

architecture Behavioral of ProgC_tb is
  component ProgC
  port ( ext : in STD_LOGIC_VECTOR(31 downto 0);
        PL, PI, reset : in STD_LOGIC;
        Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  -- input
  signal ext : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal PL, PI, reset : STD_LOGIC := '0';

  -- output
  signal Z : STD_LOGIC_VECTOR(31 downto 0);

  begin
    uut : ProgC
    port map ( ext => ext,
               PL => PL,
               PI => PI,
               reset => reset,
               Z => Z
    );

    stim_proc : process
    begin
      reset <= '1';
      ext <= x"00000000";
      wait for 10 ns;
      reset <= '0';
      wait for 10 ns;
      PI <= '1';
      ext <= x"00000002";
      wait for 10 ns;
      PI <= '0';
      PL <= '1';
      ext <= x"0000000F";
      wait for 10 ns;
    end process;
  end Behavioral;
