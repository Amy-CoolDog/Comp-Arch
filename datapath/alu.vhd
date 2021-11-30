library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin, ALU_S : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end ALU;

architecture Behavioral of ALU is
  -- 2 to 1 line 32 bit multiplexer
  component multiplexer_2to1_32bit
  port ( in0 : in std_logic_vector(31 downto 0);
         in1 : in std_logic_vector(31 downto 0);
         s : in std_logic;
         Z : out std_logic_vector(31 downto 0)
  );
end component;

  -- 32 bit logic circuit
  component logic_circuit_32bit
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  -- 32 bit ripple carry adder/subtractor
  component ripple_carry_adder_subtractor
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end component;

  -- signals
  signal logic_result, adder_result : STD_LOGIC_VECTOR(31 downto 0);
  signal carry_out, overflow_out : STD_LOGIC;

  begin
    logic : logic_circuit_32bit
    port map ( A => A,
               B => B,
               S => S,
               Z => logic_result
    );

    adder : ripple_carry_adder_subtractor
    port map ( A => A,
               B => B,
               Cin => Cin,
               S => S,
               Z => adder_result,
               Cout => carry_out,
               Vout => overflow_out
    );

    mux : multiplexer_2to1_32bit
    port map ( in0 => adder_result,
               in1 => logic_result,
               s => ALU_S,
               Z => Z
    );

    -- set Cout and Vout to 0 when adder/subtractor is not being used to prevent false positives
    Cout <= '0' when ALU_S = '1' else
            carry_out when ALU_S = '0' else
            '0';
    Vout <= '0' when ALU_S = '1' else
            overflow_out when ALU_S = '0' else
            '0'; 
  end Behavioral;
