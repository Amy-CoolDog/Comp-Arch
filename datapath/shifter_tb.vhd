library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Shifter_tb is
end Shifter_tb;

architecture Behavioral of Shifter_tb is
  component Shifter
  port ( A : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         inL, inR : in STD_LOGIC;
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- input
signal A : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
signal inL, inR : STD_LOGIC := '0';

-- output
signal Z : STD_LOGIC_VECTOR(31 downto 0);

begin
  uut : Shifter
  port map ( A => A,
             S => S,
             inL => inL,
             inR => inR,
             Z => Z
  );

  stim_proc : process
  begin
    inL <= '0';
    inR <= '0';
    -- A
    A <= x"0136454A";
    S <= "00";
    wait for 10 ns;
    -- sr A
    S <= "01";
    wait for 10 ns;
    -- sl A
    S <= "10";
    wait for 10 ns;
  end process;
end;
