library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath_tb is
end datapath_tb;

architecture Behavioral of datapath_tb is
  component datapath
  port ( data, const_in : in STD_LOGIC_VECTOR(31 downto 0);
         Clk, Cin, ALU_S, FU_S, load_enabled, MUX_S1, MUX_S2 : in STD_LOGIC;
         src_a, src_b, des_A : in STD_LOGIC_VECTOR(4 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         adr_out, data_out : out STD_LOGIC_VECTOR(31 downto 0);
         Vout, Cout, Nout, Zout : out STD_LOGIC
  );
end component;

  -- input
  signal data, const_in : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal Clk, Cin, ALU_S, FU_S, load_enabled, MUX_S1, MUX_S2 : STD_LOGIC := '0';
  signal src_a, src_b, des_A : STD_LOGIC_VECTOR(4 downto 0) := (others => '0');
  signal S : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');

  -- output
  signal adr_out, data_out : STD_LOGIC_VECTOR(31 downto 0);
  signal Vout, Cout, Nout, Zout : STD_LOGIC;

  begin
    uut : datapath
    port map ( data => data,
               const_in => const_in,
               Clk => Clk,
               Cin => Cin,
               ALU_S => ALU_S,
               FU_S => FU_S,
               load_enabled => load_enabled,
               MUX_S1 => MUX_S1,
               MUX_S2 => MUX_S2,
               src_a => src_a,
               src_b => src_b,
               des_A => des_A,
               S => S,
               adr_out => adr_out,
               data_out => data_out,
               Vout => Vout,
               Cout => Cout,
               Nout => Nout,
               Zout => Zout
    );

    -- clock process
    Clk <= NOT Clk after 5 ns;

    stim_proc : process
    begin
      -- setting all registers
      load_enabled <= '1';
      MUX_S2 <= '1';
      MUX_S1 <= '1';
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
      data <= "00000001001101100100010101000110";
      des_A <= "00100";
      wait for 10 ns;
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
      data <= "00000001001101100100010100111101";
      des_A <= "01101";
      wait for 10 ns;
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
      -- set D address to 8
      des_A <= "01000";
      -- set A address to 8 + 5 = 13
      src_a <= "01101";
      -- set B address to 8 + 15 = 23
      src_b <= "10111";
      wait for 10 ns;
      MUX_S1 <= '0';
      MUX_S2 <= '0';
      -- demonstrating various operations
      -- A XOR B
      Cin <= '0';
      FU_S <= '0';
      ALU_S <= '1';
      S <= "10";
      wait for 10 ns;
      -- 1's c A
      S <= "11";
      wait for 10 ns;
      -- A OR B
      S <= "01";
      wait for 10 ns;
      -- A + 1
      ALU_S <= '0';
      S <= "00";
      Cin <= '1';
      wait for 10 ns;
      -- A AND B
      ALU_S <= '1';
      Cin <= '0';
      S <= "00";
      wait for 10 ns;
      -- A (FS = 00111)
      FU_S <= '0';
      ALU_S <= '0';
      Cin <= '1';
      S <= "11";
      wait for 10 ns;
      -- A - 1
      FU_S <= '0';
      ALU_S <= '0';
      Cin <= '0';
      S <= "11";
      wait for 10 ns;
      -- sr B
      FU_S <= '1';
      S <= "01";
      wait for 10 ns;
      -- A + 1's c B + 1
      FU_S <= '0';
      ALU_S <= '0';
      Cin <= '1';
      S <= "10";
      wait for 10 ns;
      -- B
      FU_S <= '1';
      Cin <= '0';
      S <= "00";
      wait for 10 ns;
      -- A + 1's c B
      FU_S <= '0';
      ALU_S <= '0';
      Cin <= '0';
      S <= "10";
      wait for 10 ns;
      -- sl B
      FU_S <= '1';
      S <= "10";
      wait for 10 ns;
      -- A + B + 1
      FU_S <= '0';
      ALU_S <= '0';
      S <= "01";
      Cin <= '1';
      wait for 10 ns;
      -- A + B
      Cin <= '0';
      wait for 10 ns;
      -- A (FS = 00000)
      S <= "00";
      wait for 10 ns;
      -- switching MUX B to constant in
      MUX_S1 <= '1';
      -- demonstrating various operations
      -- A XOR B
      Cin <= '0';
      FU_S <= '0';
      ALU_S <= '1';
      S <= "10";
      wait for 10 ns;
      -- A OR B
      S <= "01";
      wait for 10 ns;
      -- A AND B
      ALU_S <= '1';
      Cin <= '0';
      S <= "00";
      wait for 10 ns;
      -- sr B
      FU_S <= '1';
      S <= "01";
      wait for 10 ns;
      -- A + 1's c B + 1
      FU_S <= '0';
      ALU_S <= '0';
      Cin <= '1';
      S <= "10";
      wait for 10 ns;
      -- B
      FU_S <= '1';
      Cin <= '0';
      S <= "00";
      wait for 10 ns;
      -- A + 1's c B
      FU_S <= '0';
      ALU_S <= '0';
      Cin <= '0';
      S <= "10";
      wait for 10 ns;
      -- sl B
      FU_S <= '1';
      S <= "10";
      wait for 10 ns;
      -- A + B + 1
      FU_S <= '0';
      ALU_S <= '0';
      S <= "01";
      Cin <= '1';
      wait for 10 ns;
      -- A + B
      Cin <= '0';
      wait for 50 ns;
    end process;
  end;
