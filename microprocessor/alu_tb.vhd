library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
  component ALU
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin, ALU_S : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end component;

-- input
signal A, B : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal Cin, ALU_S : STD_LOGIC := '0';
signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

-- output
signal Z : STD_LOGIC_VECTOR(31 downto 0);
signal Cout, Vout : STD_LOGIC;

begin
  uut : ALU
  port map ( A => A,
             B => B,
             Cin => Cin,
             ALU_S => ALU_S,
             S => S,
             Z => Z,
             Cout => Cout,
             Vout => Vout
  );

  stim_proc : process
  begin
    -- adder/sub operations
    -- A
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '0';
    ALU_S <= '0';
    S <= "00";
    wait for 10 ns;
    -- A + 1
    Cin <= '1';
    wait for 10 ns;
    -- A + B
    Cin <= '0';
    S <= "01";
    wait for 10 ns;
    -- A + B + 1
    Cin <= '1';
    wait for 10 ns;
    -- A + 1s(B)
    Cin <= '0';
    S <= "10";
    wait for 10 ns;
    -- A + 1s(B) + 1
    Cin <= '1';
    wait for 10 ns;
    -- A - 1
    Cin <= '0';
    S <= "11";
    wait for 10 ns;
    -- A
    Cin <= '1';
    wait for 10 ns;
    -- logic circuit operations
    -- A AND B
    A <= x"0136454A";
    B <= x"0000000A";
    Cin <= '0';
    ALU_S <= '1';
    S <= "00";
    wait for 10 ns;
    -- A OR B
    S <= "01";
    wait for 10 ns;
    -- A XOR B
    S <= "10";
    -- NOT A
    S <= "11";
    wait for 10 ns;
  end process;
end;
