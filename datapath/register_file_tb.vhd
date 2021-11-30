library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file_tb is
end register_file_tb;

architecture Behavioral of register_file_tb is
  component register_file
  port ( src_a, src_b, des_A : in std_logic_vector(4 downto 0);
         Clk, load_enabled : in std_logic;
         data : in std_logic_vector(31 downto 0);
         a_data, b_data : out std_logic_vector(31 downto 0)
  );
end component;

-- input
signal src_a, src_b, des_A : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
signal Clk, load_enabled : STD_LOGIC := '0';
signal data : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

-- output
signal a_data, b_data : STD_LOGIC_VECTOR(31 downto 0);

begin
  uut : register_file
  port map ( src_a => src_a,
             src_b => src_b,
             des_A => des_A,
             Clk => Clk,
             load_enabled => load_enabled,
             data => data,
             a_data => a_data,
             b_data => b_data
  );

  Clk <= not Clk after 5 ns;

  stim_proc : process
  begin
    load_enabled <= '1';
    src_a <= "00001";
    src_b <= "00010";
    data <= "00000001001101100100010101001010";
    des_A <= "00000";
    wait for 10 ns;
    data <= "00000001001101100100010101001001";
    des_A <= "00001";
    wait for 10 ns;
    data <= "00000001001101100100010101001000";
    des_A <= "00010";
    wait for 10 ns;
    data <= "00000001001101100100010101000111";
    des_A <= "00011";
    wait for 10 ns;
    load_enabled <= '0';
    data <= "00000001001101100100010101000110";
    des_A <= "00100";
    wait for 10 ns;
    load_enabled <= '1';
    data <= "00000001001101100100010101000101";
    des_A <= "00101";
    wait for 10 ns;
    data <= "00000001001101100100010101000100";
    des_A <= "00110";
    wait for 10 ns;
    data <= "00000001001101100100010101000011";
    des_A <= "00111";
    wait for 10 ns;
    data <= "00000001001101100100010101000010";
    des_A <= "01000";
    wait for 10 ns;
    data <= "00000001001101100100010101000001";
    des_A <= "01001";
    wait for 10 ns;
    data <= "00000001001101100100010101000000";
    des_A <= "01010";
    wait for 10 ns;
    data <= "00000001001101100100010100111111";
    des_A <= "01011";
    wait for 10 ns;
    data <= "00000001001101100100010100111110";
    des_A <= "01100";
    wait for 10 ns;
    load_enabled <= '0';
    data <= "00000001001101100100010100111101";
    des_A <= "01101";
    wait for 10 ns;
    load_enabled <= '1';
    data <= "00000001001101100100010100111100";
    des_A <= "01110";
    wait for 10 ns;
    data <= "00000001001101100100010100111011";
    des_A <= "01111";
    wait for 10 ns;
    data <= "00000001001101100100010100111010";
    des_A <= "10000";
    wait for 10 ns;
    data <= "00000001001101100100010100111001";
    des_A <= "10001";
    wait for 10 ns;
    data <= "00000001001101100100010100111000";
    des_A <= "10010";
    wait for 10 ns;
    data <= "00000001001101100100010100110111";
    des_A <= "10011";
    wait for 10 ns;
    data <= "00000001001101100100010100110110";
    des_A <= "10100";
    wait for 10 ns;
    data <= "00000001001101100100010100110101";
    des_A <= "10101";
    wait for 10 ns;
    data <= "00000001001101100100010100110100";
    des_A <= "10110";
    wait for 10 ns;
    data <= "00000001001101100100010100110011";
    des_A <= "10111";
    wait for 10 ns;
    data <= "00000001001101100100010100110010";
    des_A <= "11000";
    wait for 10 ns;
    data <= "00000001001101100100010100110001";
    des_A <= "11001";
    wait for 10 ns;
    data <= "00000001001101100100010100110000";
    des_A <= "11010";
    wait for 10 ns;
    data <= "00000001001101100100010100101111";
    des_A <= "11011";
    wait for 10 ns;
    data <= "00000001001101100100010100101110";
    des_A <= "11100";
    wait for 10 ns;
    data <= "00000001001101100100010100101101";
    des_A <= "11101";
    wait for 10 ns;
    data <= "00000001001101100100010100101100";
    des_A <= "11110";
    wait for 10 ns;
    data <= "00000001001101100100010100101011";
    des_A <= "11111";
    wait for 10 ns;
    src_a <= "11111";
    src_b <= "01010";
    wait for 20 ns;
    src_a <= "00100";
    src_b <= "01101";
    wait for 20 ns;
  end process;
end;
