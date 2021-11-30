library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_32to1_tb is
end multiplexer_32to1_tb;

architecture Behavioral of multiplexer_32to1_tb is
  component multiplexer_32to1
  port ( in0, in1, in2, in3, in4, in5, in6, in7, in8,
         in9, in10, in11, in12, in13, in14, in15, in16,
         in17, in18, in19, in20, in21, in22, in23, in24,
         in25, in26, in27, in28, in29, in30, in31 : in std_logic_vector(31 downto 0);
         S : in std_logic_vector(4 downto 0);
         Z : out std_logic_vector(31 downto 0)
  );
end component;

-- Inputs
signal in0, in1, in2, in3, in4, in5, in6, in7, in8,
       in9, in10, in11, in12, in13, in14, in15, in16,
       in17, in18, in19, in20, in21, in22, in23, in24,
       in25, in26, in27, in28, in29, in30, in31 : std_logic_vector(31 downto 0) := (others => '0');
signal S : std_logic_vector(4 downto 0) := (others => '0');

-- Outputs
signal Z : std_logic_vector(31 downto 0);

begin
  -- Instantiate the Unit Under Test (UUT)
  uut : multiplexer_32to1
  port map ( in0, in1, in2, in3, in4, in5, in6, in7, in8,
             in9, in10, in11, in12, in13, in14, in15, in16,
             in17, in18, in19, in20, in21, in22, in23, in24,
             in25, in26, in27, in28, in29, in30, in31,
             S,
             Z
  );
  stim_proc : process
  begin
    in0 <= "00000001001101100100010101001010";
    in1 <= "00000001001101100100010101001001";
    in2 <= "00000001001101100100010101001000";
    in3 <= "00000001001101100100010101000111";
    in4 <= "00000001001101100100010101000110";
    in5 <= "00000001001101100100010101000101";
    in6 <= "00000001001101100100010101000100";
    in7 <= "00000001001101100100010101000011";
    in8 <= "00000001001101100100010101000010";
    in9 <= "00000001001101100100010101000001";
    in10 <= "00000001001101100100010101000000";
    in11 <= "00000001001101100100010100111111";
    in12 <= "00000001001101100100010100111110";
    in13 <= "00000001001101100100010100111101";
    in14 <= "00000001001101100100010100111100";
    in15 <= "00000001001101100100010100111011";
    in16 <= "00000001001101100100010100111010";
    in17 <= "00000001001101100100010100111001";
    in18 <= "00000001001101100100010100111000";
    in19 <= "00000001001101100100010100110111";
    in20 <= "00000001001101100100010100110110";
    in21 <= "00000001001101100100010100110101";
    in22 <= "00000001001101100100010100110100";
    in23 <= "00000001001101100100010100110011";
    in24 <= "00000001001101100100010100110010";
    in25 <= "00000001001101100100010100110001";
    in26 <= "00000001001101100100010100110000";
    in27 <= "00000001001101100100010100101111";
    in28 <= "00000001001101100100010100101110";
    in29 <= "00000001001101100100010100101101";
    in30 <= "00000001001101100100010100101100";
    in31 <= "00000001001101100100010100101011";
    wait for 10 ns;
    S <= "00000";
    wait for 10 ns;
    S <= "00001";
    wait for 10 ns;
    S <= "00010";
    wait for 10 ns;
    S <= "00011";
    wait for 10 ns;
    S <= "00100";
    wait for 10 ns;
    S <= "00101";
    wait for 10 ns;
    S <= "00110";
    wait for 10 ns;
    S <= "00111";
    wait for 10 ns;
    S <= "01000";
    wait for 10 ns;
    S <= "01001";
    wait for 10 ns;
    S <= "01010";
    wait for 10 ns;
    S <= "01011";
    wait for 10 ns;
    S <= "01100";
    wait for 10 ns;
    S <= "01101";
    wait for 10 ns;
    S <= "01110";
    wait for 10 ns;
    S <= "01111";
    wait for 10 ns;
    S <= "10000";
    wait for 10 ns;
    S <= "10001";
    wait for 10 ns;
    S <= "10010";
    wait for 10 ns;
    S <= "10011";
    wait for 10 ns;
    S <= "10100";
    wait for 10 ns;
    S <= "10101";
    wait for 10 ns;
    S <= "10110";
    wait for 10 ns;
    S <= "10111";
    wait for 10 ns;
    S <= "11000";
    wait for 10 ns;
    S <= "11001";
    wait for 10 ns;
    S <= "11010";
    wait for 10 ns;
    S <= "11011";
    wait for 10 ns;
    S <= "11100";
    wait for 10 ns;
    S <= "11101";
    wait for 10 ns;
    S <= "11110";
    wait for 10 ns;
    S <= "11111";
    wait for 10 ns;
  end process;
end;
