library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file is
  Port ( src_a, src_b, des_A : in std_logic_vector(4 downto 0);
         Clk, load_enabled, TD, TA, TB : in std_logic;
         data : in std_logic_vector(31 downto 0);
         a_data, b_data : out std_logic_vector(31 downto 0)
       );
end register_file;

architecture Behavioral of register_file is
  -- 32 bit register
  component register_32
    Port ( D : in std_logic_vector(31 downto 0);
           load : in std_logic;
           Clk : in std_logic;
           Q : out std_logic_vector(31 downto 0)
         );
  end component;

  -- 5 to 32 decoder
  component decoder_5to32
    Port ( A : in std_logic_vector(4 downto 0);
           Q : out std_logic_vector(31 downto 0)
         );
  end component;

  -- 32 to 1 line multiplexer
  component multiplexer_32to1
    Port ( in0, in1, in2, in3, in4, in5, in6, in7, in8,
           in9, in10, in11, in12, in13, in14, in15, in16,
           in17, in18, in19, in20, in21, in22, in23, in24,
           in25, in26, in27, in28, in29, in30, in31 : in std_logic_vector(31 downto 0);
           S : in std_logic_vector(4 downto 0);
           Z : out std_logic_vector(31 downto 0)
         );
  end component;

  -- signals
   signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4,
          load_reg5, load_reg6, load_reg7, load_reg8, load_reg9,
          load_reg10, load_reg11, load_reg12, load_reg13, load_reg14,
          load_reg15, load_reg16, load_reg17, load_reg18, load_reg19,
          load_reg20, load_reg21, load_reg22, load_reg23, load_reg24,
          load_reg25, load_reg26, load_reg27, load_reg28, load_reg29,
          load_reg30, load_reg31, load_reg_enabled0, load_reg_enabled1,
          load_reg_enabled2, load_reg_enabled3, load_reg_enabled4,
          load_reg_enabled5, load_reg_enabled6, load_reg_enabled7,
          load_reg_enabled8, load_reg_enabled9, load_reg_enabled10,
          load_reg_enabled11, load_reg_enabled12, load_reg_enabled13,
          load_reg_enabled14, load_reg_enabled15, load_reg_enabled16,
          load_reg_enabled17, load_reg_enabled18, load_reg_enabled19,
          load_reg_enabled20, load_reg_enabled21, load_reg_enabled22,
          load_reg_enabled23, load_reg_enabled24, load_reg_enabled25,
          load_reg_enabled26, load_reg_enabled27, load_reg_enabled28,
          load_reg_enabled29, load_reg_enabled30, load_reg_enabled31 : std_logic;
    signal reg_q0, reg_q1, reg_q2, reg_q3, reg_q4,
           reg_q5, reg_q6, reg_q7, reg_q8, reg_q9,
           reg_q10, reg_q11, reg_q12, reg_q13, reg_q14,
           reg_q15, reg_q16, reg_q17, reg_q18, reg_q19,
           reg_q20, reg_q21, reg_q22, reg_q23, reg_q24,
           reg_q25, reg_q26, reg_q27, reg_q28, reg_q29,
           reg_q30, reg_q31, Aout, Bout : std_logic_vector(31 downto 0);

  begin
    load_reg_enabled0 <= load_enabled AND load_reg0;
    load_reg_enabled1 <= load_enabled AND load_reg1;
    load_reg_enabled2 <= load_enabled AND load_reg2;
    load_reg_enabled3 <= load_enabled AND load_reg3;
    load_reg_enabled4 <= load_enabled AND load_reg4;
    load_reg_enabled5 <= load_enabled AND load_reg5;
    load_reg_enabled6 <= load_enabled AND load_reg6;
    load_reg_enabled7 <= load_enabled AND load_reg7;
    load_reg_enabled8 <= load_enabled AND load_reg8;
    load_reg_enabled9 <= load_enabled AND load_reg9;
    load_reg_enabled10 <= load_enabled AND load_reg10;
    load_reg_enabled11 <= load_enabled AND load_reg11;
    load_reg_enabled12 <= load_enabled AND load_reg12;
    load_reg_enabled13 <= load_enabled AND load_reg13;
    load_reg_enabled14 <= load_enabled AND load_reg14;
    load_reg_enabled15 <= load_enabled AND load_reg15;
    load_reg_enabled16 <= load_enabled AND load_reg16;
    load_reg_enabled17 <= load_enabled AND load_reg17;
    load_reg_enabled18 <= load_enabled AND load_reg18;
    load_reg_enabled19 <= load_enabled AND load_reg19;
    load_reg_enabled20 <= load_enabled AND load_reg20;
    load_reg_enabled21 <= load_enabled AND load_reg21;
    load_reg_enabled22 <= load_enabled AND load_reg22;
    load_reg_enabled23 <= load_enabled AND load_reg23;
    load_reg_enabled24 <= load_enabled AND load_reg24;
    load_reg_enabled25 <= load_enabled AND load_reg25;
    load_reg_enabled26 <= load_enabled AND load_reg26;
    load_reg_enabled27 <= load_enabled AND load_reg27;
    load_reg_enabled28 <= load_enabled AND load_reg28;
    load_reg_enabled29 <= load_enabled AND load_reg29;
    load_reg_enabled30 <= load_enabled AND load_reg30;
    load_reg_enabled31 <= load_enabled AND load_reg31;
    -- port maps
    -- register 1
    register00 : register_32 port map(
              D => data,
              load => load_reg_enabled0,
              Clk => Clk,
              Q => reg_q0
    );

    -- register 2
    register01 : register_32 port map(
              D => data,
              load => load_reg_enabled1,
              Clk => Clk,
              Q => reg_q1
    );

    -- register 3
    register02 : register_32 port map(
              D => data,
              load => load_reg_enabled2,
              Clk => Clk,
              Q => reg_q2
    );

    -- register 4
    register03 : register_32 port map(
              D => data,
              load => load_reg_enabled3,
              Clk => Clk,
              Q => reg_q3
    );

    -- register 5
    register04 : register_32 port map(
              D => data,
              load => load_reg_enabled4,
              Clk => Clk,
              Q => reg_q4
    );

    -- register 6
    register05 : register_32 port map(
              D => data,
              load => load_reg_enabled5,
              Clk => Clk,
              Q => reg_q5
    );

    -- register 7
    register06 : register_32 port map(
              D => data,
              load => load_reg_enabled6,
              Clk => Clk,
              Q => reg_q6
    );

    -- register 8
    register07 : register_32 port map(
              D => data,
              load => load_reg_enabled7,
              Clk => Clk,
              Q => reg_q7
    );

    -- register 9
    register08 : register_32 port map(
              D => data,
              load => load_reg_enabled8,
              Clk => Clk,
              Q => reg_q8
    );

    -- register 10
    register09 : register_32 port map(
              D => data,
              load => load_reg_enabled9,
              Clk => Clk,
              Q => reg_q9
    );

    -- register 11
    register10 : register_32 port map(
              D => data,
              load => load_reg_enabled10,
              Clk => Clk,
              Q => reg_q10
    );

    -- register 12
    register11 : register_32 port map(
              D => data,
              load => load_reg_enabled11,
              Clk => Clk,
              Q => reg_q11
    );

    -- register 13
    register12 : register_32 port map(
              D => data,
              load => load_reg_enabled12,
              Clk => Clk,
              Q => reg_q12
    );

    -- register 14
    register13 : register_32 port map(
              D => data,
              load => load_reg_enabled13,
              Clk => Clk,
              Q => reg_q13
    );

    -- register 15
    register14 : register_32 port map(
              D => data,
              load => load_reg_enabled14,
              Clk => Clk,
              Q => reg_q14
    );

    -- register 16
    register15 : register_32 port map(
              D => data,
              load => load_reg_enabled15,
              Clk => Clk,
              Q => reg_q15
    );

    -- register 17
    register16 : register_32 port map(
              D => data,
              load => load_reg_enabled16,
              Clk => Clk,
              Q => reg_q16
    );

    -- register 18
    register17 : register_32 port map(
              D => data,
              load => load_reg_enabled17,
              Clk => Clk,
              Q => reg_q17
    );

    -- register 19
    register18 : register_32 port map(
              D => data,
              load => load_reg_enabled18,
              Clk => Clk,
              Q => reg_q18
    );

    -- register 20
    register19 : register_32 port map(
              D => data,
              load => load_reg_enabled19,
              Clk => Clk,
              Q => reg_q19
    );

    -- register 21
    register20 : register_32 port map(
              D => data,
              load => load_reg_enabled20,
              Clk => Clk,
              Q => reg_q20
    );

    -- register 22
    register21 : register_32 port map(
              D => data,
              load => load_reg_enabled21,
              Clk => Clk,
              Q => reg_q21
    );

    -- register 23
    register22 : register_32 port map(
              D => data,
              load => load_reg_enabled22,
              Clk => Clk,
              Q => reg_q22
    );

    -- register 24
    register23 : register_32 port map(
              D => data,
              load => load_reg_enabled23,
              Clk => Clk,
              Q => reg_q23
    );

    -- register 25
    register24 : register_32 port map(
              D => data,
              load => load_reg_enabled24,
              Clk => Clk,
              Q => reg_q24
    );

    -- register 26
    register25 : register_32 port map(
              D => data,
              load => load_reg_enabled25,
              Clk => Clk,
              Q => reg_q25
    );

    -- register 27
    register26 : register_32 port map(
              D => data,
              load => load_reg_enabled26,
              Clk => Clk,
              Q => reg_q26
    );

    -- register 28
    register27 : register_32 port map(
              D => data,
              load => load_reg_enabled27,
              Clk => Clk,
              Q => reg_q27
    );

    -- register 29
    register28 : register_32 port map(
              D => data,
              load => load_reg_enabled28,
              Clk => Clk,
              Q => reg_q28
    );

    -- register 30
    register29 : register_32 port map(
              D => data,
              load => load_reg_enabled29,
              Clk => Clk,
              Q => reg_q29
    );

    -- register 31
    register30 : register_32 port map(
              D => data,
              load => load_reg_enabled30,
              Clk => Clk,
              Q => reg_q30
    );

    -- register 32
    register31 : register_32 port map(
              D => data,
              load => load_reg_enabled31,
              Clk => Clk,
              Q => reg_q31
    );

    -- Destination register decoder
    des_decoder_2to32 : decoder_5to32 port map (
                          A(0) => des_A(0),
                          A(1) => des_A(1),
                          A(2) => des_A(2),
                          A(3) => des_A(3),
                          A(4) => TD,
                          Q(0) => load_reg0,
                          Q(1) => load_reg1,
                          Q(2) => load_reg2,
                          Q(3) => load_reg3,
                          Q(4) => load_reg4,
                          Q(5) => load_reg5,
                          Q(6) => load_reg6,
                          Q(7) => load_reg7,
                          Q(8) => load_reg8,
                          Q(9) => load_reg9,
                          Q(10) => load_reg10,
                          Q(11) => load_reg11,
                          Q(12) => load_reg12,
                          Q(13) => load_reg13,
                          Q(14) => load_reg14,
                          Q(15) => load_reg15,
                          Q(16) => load_reg16,
                          Q(17) => load_reg17,
                          Q(18) => load_reg18,
                          Q(19) => load_reg19,
                          Q(20) => load_reg20,
                          Q(21) => load_reg21,
                          Q(22) => load_reg22,
                          Q(23) => load_reg23,
                          Q(24) => load_reg24,
                          Q(25) => load_reg25,
                          Q(26) => load_reg26,
                          Q(27) => load_reg27,
                          Q(28) => load_reg28,
                          Q(29) => load_reg29,
                          Q(30) => load_reg30,
                          Q(31) => load_reg31
    );

    -- 32 to 1 source register multiplexer
    data_src_mux32_32bit_A : multiplexer_32to1 port map (
                          in0 => reg_q0,
                          in1 => reg_q1,
                          in2 => reg_q2,
                          in3 => reg_q3,
                          in4 => reg_q4,
                          in5 => reg_q5,
                          in6 => reg_q6,
                          in7 => reg_q7,
                          in8 => reg_q8,
                          in9 => reg_q9,
                          in10 => reg_q10,
                          in11 => reg_q11,
                          in12 => reg_q12,
                          in13 => reg_q13,
                          in14 => reg_q14,
                          in15 => reg_q15,
                          in16 => reg_q16,
                          in17 => reg_q17,
                          in18 => reg_q18,
                          in19 => reg_q19,
                          in20 => reg_q20,
                          in21 => reg_q21,
                          in22 => reg_q22,
                          in23 => reg_q23,
                          in24 => reg_q24,
                          in25 => reg_q25,
                          in26 => reg_q26,
                          in27 => reg_q27,
                          in28 => reg_q28,
                          in29 => reg_q29,
                          in30 => reg_q30,
                          in31 => reg_q31,
                          S(3 downto 0) => src_a(3 downto 0),
                          S(4) => TA,
                          Z => Aout
    );

    -- 32 to 1 source register multiplexer
    data_src_mux32_32bit_B : multiplexer_32to1 port map (
                          in0 => reg_q0,
                          in1 => reg_q1,
                          in2 => reg_q2,
                          in3 => reg_q3,
                          in4 => reg_q4,
                          in5 => reg_q5,
                          in6 => reg_q6,
                          in7 => reg_q7,
                          in8 => reg_q8,
                          in9 => reg_q9,
                          in10 => reg_q10,
                          in11 => reg_q11,
                          in12 => reg_q12,
                          in13 => reg_q13,
                          in14 => reg_q14,
                          in15 => reg_q15,
                          in16 => reg_q16,
                          in17 => reg_q17,
                          in18 => reg_q18,
                          in19 => reg_q19,
                          in20 => reg_q20,
                          in21 => reg_q21,
                          in22 => reg_q22,
                          in23 => reg_q23,
                          in24 => reg_q24,
                          in25 => reg_q25,
                          in26 => reg_q26,
                          in27 => reg_q27,
                          in28 => reg_q28,
                          in29 => reg_q29,
                          in30 => reg_q30,
                          in31 => reg_q31,
                          S(3 downto 0) => src_b(3 downto 0),
                          S(4) => TB,
                          Z => Bout
    );
    b_data <= data when TB = '1' else Bout;
    a_data <= data when TA = '1' else Aout;
  end Behavioral;
