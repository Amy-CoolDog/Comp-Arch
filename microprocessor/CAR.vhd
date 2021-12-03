library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAR is
  port ( opcode : in STD_LOGIC_VECTOR(16 downto 0);
         load, Clk, reset : in STD_LOGIC;
         address : out STD_LOGIC_VECTOR(16 downto 0)
  );
end CAR;

architecture Behavioral of CAR is
  component ripple_carry_adder
  port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
         Cin : in STD_LOGIC;
         S : out STD_LOGIC_VECTOR(31 downto 0);
         Cout, Vout : out STD_LOGIC
  );
end component;

  component register_32
  port ( D : in std_logic_vector(31 downto 0);
         load, Clk : in std_logic;
         Q : out std_logic_vector(31 downto 0)
  );
end component;

  signal increment : STD_LOGIC_VECTOR(16 downto 0);
  signal unused1, unused2 : STD_LOGIC_VECTOR(31 downto 17);
  signal current_val : STD_LOGIC_VECTOR(16 downto 0);
  signal reg_input : STD_LOGIC_VECTOR(31 downto 0);
  signal Cout, Vout : STD_LOGIC;

  begin

    reg : register_32
    port map ( D => reg_input,
               load => '1',
               Clk => Clk,
               Q(16 downto 0) => current_val,
               Q(31 downto 17) => unused2
    );

    inc : ripple_carry_adder
    port map ( A(16 downto 0) => current_val,
               A(31 downto 17) => "000000000000000",
               B => x"00000000",
               Cin => '1',
               S(16 downto 0) => increment,
               S(31 downto 17) => unused1,
               Cout => Cout,
               Vout => Vout
    );

    reg_input(16 downto 0) <= opcode(16 downto 0) when load = '1' else increment(16 downto 0);
    reg_input(31 downto 17) <= "000000000000000";
    address(16 downto 0) <= current_val(16 downto 0) when reset = '0' else "00000000011000000";
  end Behavioral;
