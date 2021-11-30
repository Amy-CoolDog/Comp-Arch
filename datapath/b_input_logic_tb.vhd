library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity B_Input_Logic_tb is
end B_Input_Logic_tb;

architecture Behavioral of B_Input_Logic_tb is
  component B_Input_Logic
  port ( B_in : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         B_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- input
signal B_in : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

-- output
signal B_out : STD_LOGIC_VECTOR(31 downto 0);

begin
  uut : B_Input_Logic
  port map ( B_in => B_in,
             S => S,
             B_out => B_out
  );

  stim_proc : process
  begin
    B_in <= x"0136454A";
    S <= "00";
    wait for 10 ns;
    S <= "01";
    wait for 10 ns;
    S <= "10";
    wait for 10 ns;
    S <= "11";
    wait for 10 ns;
  end process;
end;
