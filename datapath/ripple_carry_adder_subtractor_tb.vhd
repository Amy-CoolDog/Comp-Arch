library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_carry_adder_subtractor_tb is
end ripple_carry_adder_subtractor_tb;

architecture Behavioral of ripple_carry_adder_subtractor_tb is
  component ripple_carry_adder_subtractor
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- input
signal A, B : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal Cin : STD_LOGIC := '0';
signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

-- output
signal Z : STD_LOGIC_VECTOR(31 downto 0);

begin
  uut : ripple_carry_adder_subtractor
  port map ( A => A,
             B => B,
             Cin => Cin,
             S => S,
             Z => Z
  );

  stim_proc : process
  begin
    -- A
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '0';
    S <= "00";
    wait for 10 ns;
    -- A + 1
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '1';
    S <= "00";
    wait for 10 ns;
    -- A + B
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '0';
    S <= "01";
    wait for 10 ns;
    -- A + B + 1
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '1';
    S <= "01";
    wait for 10 ns;
    -- A + 1s(B)
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '0';
    S <= "10";
    wait for 10 ns;
    -- A + 1s(B) + 1
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '1';
    S <= "10";
    wait for 10 ns;
    -- A - 1
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '0';
    S <= "11";
    wait for 10 ns;
    -- A
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '1';
    S <= "11";
    wait for 10 ns;
  end process;
end;
