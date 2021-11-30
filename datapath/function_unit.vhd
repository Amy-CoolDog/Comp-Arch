library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Function_Unit is
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin, ALU_S, FU_S : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout, Nout, Zout : out STD_LOGIC
  );
end Function_Unit;

architecture Behavioral of Function_Unit is
  -- 32 bit ALU
  component ALU
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin, ALU_S : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end component;

  -- 32 bit Shifter
  component Shifter
  port ( A : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         inL, inR : in STD_LOGIC;
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  -- 2 to 1 line 32 bit multiplexer
  component multiplexer_2to1_32bit
  port ( in0 : in std_logic_vector(31 downto 0);
         in1 : in std_logic_vector(31 downto 0);
         s : in std_logic;
         Z : out std_logic_vector(31 downto 0)
  );
end component;

-- signals
signal ALU_out, Shifter_out, FU_out : STD_LOGIC_VECTOR(31 downto 0);
signal carry_out, overflow_out : STD_LOGIC;

begin
  alu0 : ALU
  port map ( A => A,
             B => B,
             Cin => Cin,
             ALU_S => ALU_S,
             S => S,
             Z => ALU_out,
             Cout => carry_out,
             Vout => overflow_out
  );

  shift : Shifter
  port map ( A => B,
             S => S,
             inL => '0',
             inR => '0',
             Z => Shifter_out
  );

  mux : multiplexer_2to1_32bit
  port map ( in0 => ALU_out,
             in1 => Shifter_out,
             s => FU_S,
             Z => FU_out
  );
  -- set Cout and Vout to 0 when adder/subtractor is not being used to prevent false positives
  Cout <= '0' when ALU_S = '1' or FU_S = '1' else
          carry_out when ALU_S = '0' and FU_S = '0' else
          '0';
  Vout <= '0' when ALU_S = '1' or FU_S = '1' else
          overflow_out when ALU_S = '0' and FU_S = '0' else
          '0';
  Z <= FU_out;
  Zout <= NOT (FU_out(0) OR FU_out(1) OR FU_out(2) OR FU_out(3) OR FU_out(4) OR
          FU_out(5) OR FU_out(6) OR FU_out(7) OR FU_out(8) OR FU_out(9) OR
          FU_out(10) OR FU_out(11) OR FU_out(12) OR FU_out(13) OR FU_out(14)
          OR FU_out(15) OR FU_out(16) OR FU_out(17) OR FU_out(18) OR FU_out(19)
          OR FU_out(20) OR FU_out(21) OR FU_out(22) OR FU_out(23) OR FU_out(24)
          OR FU_out(25) OR FU_out(26) OR FU_out(27) OR FU_out(28) OR FU_out(29)
          OR FU_out(30) OR FU_out(31));
  Nout <= FU_out(31);

end Behavioral;
