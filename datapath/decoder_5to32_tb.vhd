library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_5to32_tb is
end decoder_5to32_tb;

architecture Behavioral of decoder_5to32_tb is
  component decoder_5to32 is
    port ( A : in std_logic_vector(4 downto 0);
           Q : out std_logic_vector(31 downto 0)
    );
  end component;

  -- Inputs
  signal A : std_logic_vector(4 downto 0) := (others => '0');

  --Outputs
  signal Q : std_logic_vector(31 downto 0);

  begin
    -- Instantiate the Unit Under Test (UUT)
    uut : decoder_5to32
    port map ( A => A,
               Q => Q
    );
    stim_proc: process
    begin
      A <= "00000";
      wait for 10 ns;
      A <= "00001";
      wait for 10 ns;
      A <= "00010";
      wait for 10 ns;
      A <= "00011";
      wait for 10 ns;
      A <= "00100";
      wait for 10 ns;
      A <= "00101";
      wait for 10 ns;
      A <= "00110";
      wait for 10 ns;
      A <= "00111";
      wait for 10 ns;
      A <= "01000";
      wait for 10 ns;
      A <= "01001";
      wait for 10 ns;
      A <= "01010";
      wait for 10 ns;
      A <= "01011";
      wait for 10 ns;
      A <= "01100";
      wait for 10 ns;
      A <= "01101";
      wait for 10 ns;
      A <= "01110";
      wait for 10 ns;
      A <= "01111";
      wait for 10 ns;
      A <= "10000";
      wait for 10 ns;
      A <= "10001";
      wait for 10 ns;
      A <= "10010";
      wait for 10 ns;
      A <= "10011";
      wait for 10 ns;
      A <= "10100";
      wait for 10 ns;
      A <= "10101";
      wait for 10 ns;
      A <= "10110";
      wait for 10 ns;
      A <= "10111";
      wait for 10 ns;
      A <= "11000";
      wait for 10 ns;
      A <= "11001";
      wait for 10 ns;
      A <= "11010";
      wait for 10 ns;
      A <= "11011";
      wait for 10 ns;
      A <= "11100";
      wait for 10 ns;
      A <= "11101";
      wait for 10 ns;
      A <= "11110";
      wait for 10 ns;
      A <= "11111";
      wait for 10 ns;
    end process;
  end;
