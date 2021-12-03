library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Function_Unit_tb is
end Function_Unit_tb;

architecture Behavioral of Function_Unit_tb is
  component Function_Unit
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin, ALU_S, FU_S : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout, Nout, Zout : out STD_LOGIC
  );
end component;

-- input
signal A, B : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
signal Cin, ALU_S, FU_S : STD_LOGIC := '0';
signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

-- output
signal Z : STD_LOGIC_VECTOR(31 downto 0);
signal Cout, Vout, Nout, Zout : STD_LOGIC;

begin
  uut : Function_Unit
  port map ( A => A,
             B => B,
             Cin => Cin,
             ALU_S => ALU_S,
             FU_S => FU_S,
             S => S,
             Z => Z,
             Cout => Cout,
             Vout => Vout,
             Nout => Nout,
             Zout => Zout
  );

  stim_proc : process
  begin
    -- A = 2033898
    A <= x"0136454A";
    -- B = 20333898 + 8 = 20333906
    B <= x"01364552";
    -- A XOR B
    Cin <= '0';
    FU_S <= '0';
    ALU_S <= '1';
    S <= "10";
    wait for 10 ns;
    -- 1's c A
    S <= "11";
    wait for 10 ns;
    -- A OR B
    S <= "01";
    wait for 10 ns;
    -- A + 1
    ALU_S <= '0';
    S <= "00";
    Cin <= '1';
    wait for 10 ns;
    -- A AND B
    ALU_S <= '1';
    Cin <= '0';
    S <= "00";
    wait for 10 ns;
    -- A (FS = 00111)
    FU_S <= '0';
    ALU_S <= '0';
    Cin <= '1';
    S <= "11";
    wait for 10 ns;
    -- A - 1
    FU_S <= '0';
    ALU_S <= '0';
    Cin <= '0';
    S <= "11";
    wait for 10 ns;
    -- sr B
    FU_S <= '1';
    S <= "01";
    wait for 10 ns;
    -- A + 1's c B + 1
    FU_S <= '0';
    ALU_S <= '0';
    Cin <= '1';
    S <= "10";
    wait for 10 ns;
    -- B
    FU_S <= '1';
    Cin <= '0';
    S <= "00";
    wait for 10 ns;
    -- A + 1's c B
    FU_S <= '0';
    ALU_S <= '0';
    Cin <= '0';
    S <= "10";
    wait for 10 ns;
    -- sl B
    FU_S <= '1';
    S <= "10";
    wait for 10 ns;
    -- A + B + 1
    FU_S <= '0';
    ALU_S <= '0';
    S <= "01";
    Cin <= '1';
    wait for 10 ns;
    -- A + B
    Cin <= '0';
    wait for 10 ns;
    -- A (FS = 00000)
    S <= "00";
    wait for 10 ns;
  end process;
end;
