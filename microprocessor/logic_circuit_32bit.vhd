library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_circuit_32bit is
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end logic_circuit_32bit;

architecture Behavioral of logic_circuit_32bit is
  -- 1 bit logic circuit
  component logic_circuit_1bit
  port ( A, B : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC
  );
end component;

begin
  Bit0 : logic_circuit_1bit
  port map(
  A => A(0),
  B => B(0),
  S => S,
  Z => Z(0)
  );

  Bit1 : logic_circuit_1bit
  port map(
  A => A(1),
  B => B(1),
  S => S,
  Z => Z(1)
  );

  Bit2 : logic_circuit_1bit
  port map(
  A => A(2),
  B => B(2),
  S => S,
  Z => Z(2)
  );

  Bit3 : logic_circuit_1bit
  port map(
  A => A(3),
  B => B(3),
  S => S,
  Z => Z(3)
  );

  Bit4 : logic_circuit_1bit
  port map(
  A => A(4),
  B => B(4),
  S => S,
  Z => Z(4)
  );

  Bit5 : logic_circuit_1bit
  port map(
  A => A(5),
  B => B(5),
  S => S,
  Z => Z(5)
  );

  Bit6 : logic_circuit_1bit
  port map(
  A => A(6),
  B => B(6),
  S => S,
  Z => Z(6)
  );

  Bit7 : logic_circuit_1bit
  port map(
  A => A(7),
  B => B(7),
  S => S,
  Z => Z(7)
  );

  Bit8 : logic_circuit_1bit
  port map(
  A => A(8),
  B => B(8),
  S => S,
  Z => Z(8)
  );

  Bit9 : logic_circuit_1bit
  port map(
  A => A(9),
  B => B(9),
  S => S,
  Z => Z(9)
  );

  Bit10 : logic_circuit_1bit
  port map(
  A => A(10),
  B => B(10),
  S => S,
  Z => Z(10)
  );

  Bit11 : logic_circuit_1bit
  port map(
  A => A(11),
  B => B(11),
  S => S,
  Z => Z(11)
  );

  Bit12 : logic_circuit_1bit
  port map(
  A => A(12),
  B => B(12),
  S => S,
  Z => Z(12)
  );

  Bit13 : logic_circuit_1bit
  port map(
  A => A(13),
  B => B(13),
  S => S,
  Z => Z(13)
  );

  Bit14 : logic_circuit_1bit
  port map(
  A => A(14),
  B => B(14),
  S => S,
  Z => Z(14)
  );

  Bit15 : logic_circuit_1bit
  port map(
  A => A(15),
  B => B(15),
  S => S,
  Z => Z(15)
  );

  Bit16 : logic_circuit_1bit
  port map(
  A => A(16),
  B => B(16),
  S => S,
  Z => Z(16)
  );

  Bit17 : logic_circuit_1bit
  port map(
  A => A(17),
  B => B(17),
  S => S,
  Z => Z(17)
  );

  Bit18 : logic_circuit_1bit
  port map(
  A => A(18),
  B => B(18),
  S => S,
  Z => Z(18)
  );

  Bit19 : logic_circuit_1bit
  port map(
  A => A(19),
  B => B(19),
  S => S,
  Z => Z(19)
  );

  Bit20 : logic_circuit_1bit
  port map(
  A => A(20),
  B => B(20),
  S => S,
  Z => Z(20)
  );

  Bit21 : logic_circuit_1bit
  port map(
  A => A(21),
  B => B(21),
  S => S,
  Z => Z(21)
  );

  Bit22 : logic_circuit_1bit
  port map(
  A => A(22),
  B => B(22),
  S => S,
  Z => Z(22)
  );

  Bit23 : logic_circuit_1bit
  port map(
  A => A(23),
  B => B(23),
  S => S,
  Z => Z(23)
  );

  Bit24 : logic_circuit_1bit
  port map(
  A => A(24),
  B => B(24),
  S => S,
  Z => Z(24)
  );

  Bit25 : logic_circuit_1bit
  port map(
  A => A(25),
  B => B(25),
  S => S,
  Z => Z(25)
  );

  Bit26 : logic_circuit_1bit
  port map(
  A => A(26),
  B => B(26),
  S => S,
  Z => Z(26)
  );

  Bit27 : logic_circuit_1bit
  port map(
  A => A(27),
  B => B(27),
  S => S,
  Z => Z(27)
  );

  Bit28 : logic_circuit_1bit
  port map(
  A => A(28),
  B => B(28),
  S => S,
  Z => Z(28)
  );

  Bit29 : logic_circuit_1bit
  port map(
  A => A(29),
  B => B(29),
  S => S,
  Z => Z(29)
  );

  Bit30 : logic_circuit_1bit
  port map(
  A => A(30),
  B => B(30),
  S => S,
  Z => Z(30)
  );

  Bit31 : logic_circuit_1bit
  port map(
  A => A(31),
  B => B(31),
  S => S,
  Z => Z(31)
  );
end Behavioral;
