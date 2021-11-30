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
    in0 <= "00000000000000000000000000000000";
    in1 <= "10101010101010101010101010101010";
    in2 <= "01010101010101010101010101010101";
    in3 <= "11001100110011001100110011001100";
    in4 <= "00110011001100110011001100110011";
    in5 <= "11100011100011100011100011100011";
    in6 <= "00011100011100011100011100011100";
    in7 <= "11110000111100001111000011110000";
    in8 <= "00001111000011110000111100001111";
    in9 <= "11111111000000001111111100000000";
    in10 <= "00000000111111110000000011111111";
    in11 <= "11111111111111110000000000000000";
    in12 <= "00000000000000001111111111111111";
    in13 <= "11000010000001000010000001000010";
    in14 <= "11001100001110110010101000011001";
    in15 <= "10010010000111111011010101000100";
    in16 <= "01011010001100001000110100110001";
    in17 <= "01001100011001100010100010111000";
    in18 <= "00000110111000001110011001010100";
    in19 <= "10000111111101110010101100011101";
    in20 <= "11001001011110000110100100010100";
    in21 <= "10110001010110110001011011111110";
    in22 <= "10010010000110001011000001000010";
    in23 <= "10100011110101000001000011110001";
    in24 <= "10000101110011010110011011110001";
    in25 <= "10011101100011101101001111101111";
    in26 <= "10010101110111110000010011111001";
    in27 <= "11001110110100111000010101110011";
    in28 <= "10101101011110101000001110110000";
    in29 <= "10110000100001011000000000001010";
    in30 <= "00100101011101111111111001100011";
    in31 <= "11111111111111111111111111111111";
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
