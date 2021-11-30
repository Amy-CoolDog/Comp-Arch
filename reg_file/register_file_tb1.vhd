library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file_tb1 is
end register_file_tb1;

architecture Behavior of register_file_tb1 is
  -- 32 bit register
  component register_file is
    Port ( src_s : in std_logic_vector(4 downto 0);
           des_A : in std_logic_vector(4 downto 0);
           Clk : in std_logic;
           data_src : in std_logic;
           data : in std_logic_vector(31 downto 0);
           reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8,
           reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16,
           reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24,
           reg25, reg26, reg27, reg28, reg29, reg30, reg31 : out std_logic_vector(31 downto 0)
         );
  end component;

  -- Inputs
  signal src_s : std_logic_vector(4 downto 0) := (others => '0');
  signal des_A : std_logic_vector(4 downto 0) := (others => '0');
  signal Clk : std_logic := '0';
  signal data_src : std_logic := '0';
  signal data : std_logic_vector(31 downto 0) := (others => '0');

  -- Outputs
  signal reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8,
         reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16,
         reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24,
         reg25, reg26, reg27, reg28, reg29, reg30, reg31 : std_logic_vector(31 downto 0);

  begin
    --  Instantiate the Unit Under Test (UUT)
    uut : register_file
    port map ( src_s,
               des_A,
               Clk,
               data_src,
               data,
               reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8,
               reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16,
               reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24,
               reg25, reg26, reg27, reg28, reg29, reg30, reg31
    );

    -- Clock process
    Clk <= not Clk after 5 ns;
    -- Stimulus Process
    stim_proc : process
    begin
      -- 20333867
      wait for 20 ns;
      data <= x"0136452b";
      des_A <= "11111";
      src_s <= "00000";
      wait for 20 ns;
      -- 20333868
      data <= x"0136452c";
      des_A <= "11110";
      wait for 20 ns;
      -- 20333869
      data <= x"0136452d";
      des_A <= "11101";
      wait for 20 ns;
      -- 20333870
      data <= x"0136452e";
      des_A <= "11100";
      wait for 20 ns;
      -- 20333871
      data <= x"0136452f";
      des_A <= "11011";
      wait for 20 ns;
      -- 20333872
      data <= x"01364530";
      des_A <= "11010";
      wait for 20 ns;
      -- 20333873
      data <= x"01364531";
      des_A <= "11001";
      wait for 20 ns;
      -- 20333874
      data <= x"01364532";
      des_A <= "11000";
      wait for 20 ns;
      -- 20333875
      data <=  x"01364533";
      des_A <= "10111";
      wait for 20 ns;
      -- 20333876
      data <= x"01364534";
      des_A <= "10110";
      wait for 20 ns;
      -- 20333877
      data <= x"01364535";
      des_A <= "10101";
      wait for 20 ns;
      -- 20333878
      data <= x"01364536";
      des_A <= "10100";
      wait for 20 ns;
      -- 20333879
      data <= x"01364537";
      des_A <= "10011";
      wait for 20 ns;
      -- 20333880
      data <= x"01364538";
      des_A <= "10010";
      wait for 20 ns;
      -- 20333881
      data <= x"01364539";
      des_A <= "10001";
      wait for 20 ns;
      -- 20333882
      data <= x"0136453a";
      des_A <= "10000";
      wait for 20 ns;
      -- 20333883
      data <= x"0136453b";
      des_A <= "01111";
      wait for 20 ns;
      -- 20333884
      data <= x"0136453c";
      des_A <= "01110";
      wait for 20 ns;
      -- 20333885
      data <= x"0136453d";
      des_A <= "01101";
      wait for 20 ns;
      -- 20333886
      data <= x"0136453e";
      des_A <= "01100";
      wait for 20 ns;
      -- 20333887
      data <= x"0136453f";
      des_A <= "01011";
      wait for 20 ns;
      -- 20333888
      data <= x"01364540";
      des_A <= "01010";
      wait for 20 ns;
      -- 20333889
      data <= x"01364541";
      des_A <= "01001";
      wait for 20 ns;
      -- 20333890
      data <= x"01364542";
      des_A <= "01000";
      wait for 20 ns;
      -- 20333891
      data <= x"01364543";
      des_A <= "00111";
      wait for 20 ns;
      -- 20333892
      data <= x"01364544";
      des_A <= "00110";
      wait for 20 ns;
      -- 20333893
      data <= x"01364545";
      des_A <= "00101";
      wait for 20 ns;
      -- 20333894
      data <= x"01364546";
      des_A <= "00100";
      wait for 20 ns;
      -- 20333895
      data <= x"01364547";
      des_A <= "00011";
      wait for 20 ns;
      -- 20333896
      data <= x"01364548";
      des_A <= "00010";
      wait for 20 ns;
      -- 20333897
      data <= x"01364549";
      des_A <= "00001";
      wait for 20 ns;
      -- 20333898
      data <= x"0136454A";
      des_A <= "00000";
      wait for 20 ns;
      wait for 1000 ns;
    end process;
  end;
