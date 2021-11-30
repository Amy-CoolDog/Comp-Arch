library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_circuit_1bit_tb is
end logic_circuit_1bit_tb;

architecture Behavioral of logic_circuit_1bit_tb is
  component logic_circuit_1bit
  port ( A, B : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC
  );
end component;

-- input
signal A, B : STD_LOGIC := '0';
signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

-- output
signal Z : STD_LOGIC;

begin
  uut : logic_circuit_1bit
  port map ( A => A,
             B => B,
             S => S,
             Z => Z
  );

  stim_proc : process
  begin
    A <= '1';
    B <= '0';
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
