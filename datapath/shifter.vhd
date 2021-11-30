library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Shifter is
  port ( A : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         inL, inR : in STD_LOGIC;
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end Shifter;

architecture Behavioral of Shifter is
  -- 4 to 1 line 1 bit multiplexer
  component MUX4to1
  port ( in0, in1, in2, in3 : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC
  );
end component;

-- signals
signal in3 : STD_LOGIC;

begin
  in3 <= '0';
  Bit0 : MUX4to1
  port map(
  in0 => A(0),
  in1 => A(1),
  in2 => inL,
  in3 => in3,
  S => S,
  Z => Z(0)
  );

  Bit1 : MUX4to1
  port map(
  in0 => A(1),
  in1 => A(2),
  in2 => A(0),
  in3 => in3,
  S => S,
  Z => Z(1)
  );

  Bit2 : MUX4to1
  port map(
  in0 => A(2),
  in1 => A(3),
  in2 => A(1),
  in3 => in3,
  S => S,
  Z => Z(2)
  );

  Bit3 : MUX4to1
  port map(
  in0 => A(3),
  in1 => A(4),
  in2 => A(2),
  in3 => in3,
  S => S,
  Z => Z(3)
  );

  Bit4 : MUX4to1
  port map(
  in0 => A(4),
  in1 => A(5),
  in2 => A(3),
  in3 => in3,
  S => S,
  Z => Z(4)
  );

  Bit5 : MUX4to1
  port map(
  in0 => A(5),
  in1 => A(6),
  in2 => A(4),
  in3 => in3,
  S => S,
  Z => Z(5)
  );

  Bit6 : MUX4to1
  port map(
  in0 => A(6),
  in1 => A(7),
  in2 => A(5),
  in3 => in3,
  S => S,
  Z => Z(6)
  );

  Bit7 : MUX4to1
  port map(
  in0 => A(7),
  in1 => A(8),
  in2 => A(6),
  in3 => in3,
  S => S,
  Z => Z(7)
  );

  Bit8 : MUX4to1
  port map(
  in0 => A(8),
  in1 => A(9),
  in2 => A(7),
  in3 => in3,
  S => S,
  Z => Z(8)
  );

  Bit9 : MUX4to1
  port map(
  in0 => A(9),
  in1 => A(10),
  in2 => A(8),
  in3 => in3,
  S => S,
  Z => Z(9)
  );

  Bit10 : MUX4to1
  port map(
  in0 => A(10),
  in1 => A(11),
  in2 => A(9),
  in3 => in3,
  S => S,
  Z => Z(10)
  );

  Bit11 : MUX4to1
  port map(
  in0 => A(11),
  in1 => A(12),
  in2 => A(10),
  in3 => in3,
  S => S,
  Z => Z(11)
  );

  Bit12 : MUX4to1
  port map(
  in0 => A(12),
  in1 => A(13),
  in2 => A(11),
  in3 => in3,
  S => S,
  Z => Z(12)
  );

  Bit13 : MUX4to1
  port map(
  in0 => A(13),
  in1 => A(14),
  in2 => A(12),
  in3 => in3,
  S => S,
  Z => Z(13)
  );

  Bit14 : MUX4to1
  port map(
  in0 => A(14),
  in1 => A(15),
  in2 => A(13),
  in3 => in3,
  S => S,
  Z => Z(14)
  );

  Bit15 : MUX4to1
  port map(
  in0 => A(15),
  in1 => A(16),
  in2 => A(14),
  in3 => in3,
  S => S,
  Z => Z(15)
  );

  Bit16 : MUX4to1
  port map(
  in0 => A(16),
  in1 => A(17),
  in2 => A(15),
  in3 => in3,
  S => S,
  Z => Z(16)
  );

  Bit17 : MUX4to1
  port map(
  in0 => A(17),
  in1 => A(18),
  in2 => A(16),
  in3 => in3,
  S => S,
  Z => Z(17)
  );

  Bit18 : MUX4to1
  port map(
  in0 => A(18),
  in1 => A(19),
  in2 => A(17),
  in3 => in3,
  S => S,
  Z => Z(18)
  );

  Bit19 : MUX4to1
  port map(
  in0 => A(19),
  in1 => A(20),
  in2 => A(18),
  in3 => in3,
  S => S,
  Z => Z(19)
  );

  Bit20 : MUX4to1
  port map(
  in0 => A(20),
  in1 => A(21),
  in2 => A(19),
  in3 => in3,
  S => S,
  Z => Z(20)
  );

  Bit21 : MUX4to1
  port map(
  in0 => A(21),
  in1 => A(22),
  in2 => A(20),
  in3 => in3,
  S => S,
  Z => Z(21)
  );

  Bit22 : MUX4to1
  port map(
  in0 => A(22),
  in1 => A(23),
  in2 => A(21),
  in3 => in3,
  S => S,
  Z => Z(22)
  );

  Bit23 : MUX4to1
  port map(
  in0 => A(23),
  in1 => A(24),
  in2 => A(22),
  in3 => in3,
  S => S,
  Z => Z(23)
  );

  Bit24 : MUX4to1
  port map(
  in0 => A(24),
  in1 => A(25),
  in2 => A(23),
  in3 => in3,
  S => S,
  Z => Z(24)
  );

  Bit25 : MUX4to1
  port map(
  in0 => A(25),
  in1 => A(26),
  in2 => A(24),
  in3 => in3,
  S => S,
  Z => Z(25)
  );

  Bit26 : MUX4to1
  port map(
  in0 => A(26),
  in1 => A(27),
  in2 => A(25),
  in3 => in3,
  S => S,
  Z => Z(26)
  );

  Bit27 : MUX4to1
  port map(
  in0 => A(27),
  in1 => A(28),
  in2 => A(26),
  in3 => in3,
  S => S,
  Z => Z(27)
  );

  Bit28 : MUX4to1
  port map(
  in0 => A(28),
  in1 => A(29),
  in2 => A(27),
  in3 => in3,
  S => S,
  Z => Z(28)
  );

  Bit29 : MUX4to1
  port map(
  in0 => A(29),
  in1 => A(30),
  in2 => A(28),
  in3 => in3,
  S => S,
  Z => Z(29)
  );

  Bit30 : MUX4to1
  port map(
  in0 => A(30),
  in1 => A(31),
  in2 => A(29),
  in3 => in3,
  S => S,
  Z => Z(30)
  );

  Bit31 : MUX4to1
  port map(
  in0 => A(31),
  in1 => inR,
  in2 => A(30),
  in3 => in3,
  S => S,
  Z => Z(31)
  );
end Behavioral;
