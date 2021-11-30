library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_carry_adder is
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end ripple_carry_adder;

architecture Behavioral of ripple_carry_adder is
  -- full adder
  component full_adder
  port ( A, B, Cin : in STD_LOGIC;
         S, Cout : out STD_LOGIC
  );
end component;

-- carry signals
signal c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15,
       c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29,
       c30, c31, Cfinal : STD_LOGIC;

begin
  Bit0 : full_adder
  port map(
  A => A(0),
  B => B(0),
  Cin => Cin,
  S => S(0),
  Cout => c1
  );

  Bit1 : full_adder
  port map(
  A => A(1),
  B => B(1),
  Cin => c1,
  S => S(1),
  Cout => c2
  );

  Bit2 : full_adder
  port map(
  A => A(2),
  B => B(2),
  Cin => c2,
  S => S(2),
  Cout => c3
  );

  Bit3 : full_adder
  port map(
  A => A(3),
  B => B(3),
  Cin => c3,
  S => S(3),
  Cout => c4
  );

  Bit4 : full_adder
  port map(
  A => A(4),
  B => B(4),
  Cin => c4,
  S => S(4),
  Cout => c5
  );

  Bit5 : full_adder
  port map(
  A => A(5),
  B => B(5),
  Cin => c5,
  S => S(5),
  Cout => c6
  );

  Bit6 : full_adder
  port map(
  A => A(6),
  B => B(6),
  Cin => c6,
  S => S(6),
  Cout => c7
  );

  Bit7 : full_adder
  port map(
  A => A(7),
  B => B(7),
  Cin => c7,
  S => S(7),
  Cout => c8
  );

  Bit8 : full_adder
  port map(
  A => A(8),
  B => B(8),
  Cin => c8,
  S => S(8),
  Cout => c9
  );

  Bit9 : full_adder
  port map(
  A => A(9),
  B => B(9),
  Cin => c9,
  S => S(9),
  Cout => c10
  );

  Bit10 : full_adder
  port map(
  A => A(10),
  B => B(10),
  Cin => c10,
  S => S(10),
  Cout => c11
  );

  Bit11 : full_adder
  port map(
  A => A(11),
  B => B(11),
  Cin => c11,
  S => S(11),
  Cout => c12
  );

  Bit12 : full_adder
  port map(
  A => A(12),
  B => B(12),
  Cin => c12,
  S => S(12),
  Cout => c13
  );

  Bit13 : full_adder
  port map(
  A => A(13),
  B => B(13),
  Cin => c13,
  S => S(13),
  Cout => c14
  );

  Bit14 : full_adder
  port map(
  A => A(14),
  B => B(14),
  Cin => c14,
  S => S(14),
  Cout => c15
  );

  Bit15 : full_adder
  port map(
  A => A(15),
  B => B(15),
  Cin => c15,
  S => S(15),
  Cout => c16
  );

  Bit16 : full_adder
  port map(
  A => A(16),
  B => B(16),
  Cin => c16,
  S => S(16),
  Cout => c17
  );

  Bit17 : full_adder
  port map(
  A => A(17),
  B => B(17),
  Cin => c17,
  S => S(17),
  Cout => c18
  );

  Bit18 : full_adder
  port map(
  A => A(18),
  B => B(18),
  Cin => c18,
  S => S(18),
  Cout => c19
  );

  Bit19 : full_adder
  port map(
  A => A(19),
  B => B(19),
  Cin => c19,
  S => S(19),
  Cout => c20
  );

  Bit20 : full_adder
  port map(
  A => A(20),
  B => B(20),
  Cin => c20,
  S => S(20),
  Cout => c21
  );

  Bit21 : full_adder
  port map(
  A => A(21),
  B => B(21),
  Cin => c21,
  S => S(21),
  Cout => c22
  );

  Bit22 : full_adder
  port map(
  A => A(22),
  B => B(22),
  Cin => c22,
  S => S(22),
  Cout => c23
  );

  Bit23 : full_adder
  port map(
  A => A(23),
  B => B(23),
  Cin => c23,
  S => S(23),
  Cout => c24
  );

  Bit24 : full_adder
  port map(
  A => A(24),
  B => B(24),
  Cin => c24,
  S => S(24),
  Cout => c25
  );

  Bit25 : full_adder
  port map(
  A => A(25),
  B => B(25),
  Cin => c25,
  S => S(25),
  Cout => c26
  );

  Bit26 : full_adder
  port map(
  A => A(26),
  B => B(26),
  Cin => c26,
  S => S(26),
  Cout => c27
  );

  Bit27 : full_adder
  port map(
  A => A(27),
  B => B(27),
  Cin => c27,
  S => S(27),
  Cout => c28
  );

  Bit28 : full_adder
  port map(
  A => A(28),
  B => B(28),
  Cin => c28,
  S => S(28),
  Cout => c29
  );

  Bit29 : full_adder
  port map(
  A => A(29),
  B => B(29),
  Cin => c29,
  S => S(29),
  Cout => c30
  );

  Bit30 : full_adder
  port map(
  A => A(30),
  B => B(30),
  Cin => c30,
  S => S(30),
  Cout => c31
  );

  Bit31 : full_adder
  port map(
  A => A(31),
  B => B(31),
  Cin => c31,
  S => S(31),
  Cout => Cfinal
  );

  Cout <= Cfinal;
  Vout <= Cfinal XOR c31;
end Behavioral;
