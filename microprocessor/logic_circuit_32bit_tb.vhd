library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_circuit_32bit_tb is
end logic_circuit_32bit_tb;

architecture Behavioral of logic_circuit_32bit_tb is
  component logic_circuit_32bit
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- input
signal A, B : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

-- output
signal Z : STD_LOGIC_VECTOR(31 downto 0);

begin
  uut : logic_circuit_32bit
  port map ( A => A,
             B => B,
             S => S,
             Z => Z
  );

  stim_proc : process
  begin
    -- A AND B
    A <= x"0136454A";
    B <= x"0000000A";
    S <= "00";
    wait for 10 ns;
    -- A OR B
    S <= "01";
    wait for 10 ns;
    -- A XOR B
    S <= "10";
    wait for 10 ns;
    -- NOT A
    S <= "11";
    wait for 10 ns;
  end process;
end;
