library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_circuit_1bit is
  port ( A, B : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC
  );
end logic_circuit_1bit;

architecture Behavioral of logic_circuit_1bit is
  -- 1 bit 4 to 1 MUX
  component MUX4to1
  port ( in0, in1, in2, in3 : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC
  );
end component;

-- signals
signal logic_and, logic_or, logic_xor, logic_not : STD_LOGIC;

begin
  logic_and <= A AND B;
  logic_or <= A OR B;
  logic_xor <= A XOR B;
  logic_not <= NOT A;

  mux : MUX4to1
  port map ( in0 => logic_and,
             in1 => logic_or,
             in2 => logic_xor,
             in3 => logic_not,
             S => S,
             Z => Z
  );
end Behavioral;
