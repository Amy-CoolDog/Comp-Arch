library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX4to1_tb is
end MUX4to1_tb;

architecture Behavioral of MUX4to1_tb is
  component MUX4to1
  port ( in0, in1, in2, in3 : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC
  );
end component;

-- input
signal in0, in1, in2, in3 : STD_LOGIC := '0';
signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

-- output
signal Z : STD_LOGIC;

begin
  uut : MUX4to1
  port map ( in0 => in0,
             in1 => in1,
             in2 => in2,
             in3 => in3,
             S => S,
             Z => Z
  );

  stim_proc : process
  begin
    in0 <= '0';
    in1 <= '1';
    in2 <= '0';
    in3 <= '1';
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
