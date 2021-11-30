library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple_carry_adder_subtractor is
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(1 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end ripple_carry_adder_subtractor;

architecture Behavioral of ripple_carry_adder_subtractor is
  -- 32 bit ripple adder
  component ripple_carry_adder
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end component;

  -- B input logic
  component B_Input_Logic
  port ( B_in : in STD_LOGIC_VECTOR(31 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         B_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

-- signals
signal B_logic_out : STD_LOGIC_VECTOR(31 downto 0);

begin
  B_input : B_Input_Logic
  port map ( B_in => B,
             S => S,
             B_out => B_logic_out
  );

  ripple_add : ripple_carry_adder
  port map ( A => A,
             B => B_logic_out,
             Cin => Cin,
             S => Z,
             Cout => Cout,
             Vout => Vout
  );
end Behavioral;
