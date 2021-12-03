library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_carry_adder_tb is
end ripple_carry_adder_tb;

architecture Behavioral of ripple_carry_adder_tb is
  component ripple_carry_adder
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end component;

-- input
signal A, B : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal Cin : STD_LOGIC := '0';

-- output
signal S : STD_LOGIC_VECTOR(31 downto 0);
signal Cout, Vout : STD_LOGIC;

begin
  uut : ripple_carry_adder
  port map ( A => A,
             B => B,
             Cin => Cin,
             S => S,
             Cout => Cout,
             Vout => Vout
  );

  stim_proc : process
  begin
    -- positive student ID + 10
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '0';
    wait for 10 ns;
    -- positive student ID - 10
    A <= x"0136454A";
    B <= x"FFFFFFF6";
    Cin <= '0';
    wait for 10 ns;
    -- negative student ID + 10
    A <= x"FEC9BAB6";
    B <= x"0000000A";
    Cin <= '0';
    wait for 10 ns;
    -- negative student ID - 10
    A <= x"FEC9BAB6";
    B <= x"FFFFFFF6";
    Cin <= '0';
    wait for 10 ns;
    A <= x"0136454A";
    B <= x"00000000";
    Cin <= '1';
    wait for 10 ns;
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '1';
    wait for 10 ns;
    A <= x"0136454A";
    B <= x"FFFFFFFF";
    Cin <= '0';
    wait for 10 ns;
    A <= x"0136454A";
    B <= x"FFFFFFFF";
    Cin <= '1';
    wait for 10 ns;
    -- worst case propagation delay
    A <= x"FFFFFFFF";
    B <= x"00000001";
    Cin <= '0';
    wait for 10 ns;
    -- setting C and V flag
    A <= x"FFFFFFFF";
    B <= x"80000000";
    Cin <= '0';
    wait for 10 ns;
  end process;
end;
