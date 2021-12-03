library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
  port ( data, const_in : in STD_LOGIC_VECTOR(31 downto 0);
         Clk, Cin, ALU_S, FU_S, load_enabled, MUX_S1, MUX_S2 : in STD_LOGIC;
         src_a, src_b, des_A : in STD_LOGIC_VECTOR(4 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         adr_out, data_out : out STD_LOGIC_VECTOR(31 downto 0);
         Vout, Cout, Nout, Zout : out STD_LOGIC
  );
end datapath;

architecture Behavioral of datapath is
  -- 32 bit function unit
  component Function_Unit is
    port ( A, B : in STD_LOGIC_VECTOR(31 downto 0);
           Cin, ALU_S, FU_S : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR(1 downto 0);
           Z : out STD_LOGIC_VECTOR(31 downto 0);
           Cout, Vout, Nout, Zout : out STD_LOGIC
    );
  end component;

  -- 32 bit register file
  component register_file
  port ( src_a, src_b, des_A : in std_logic_vector(4 downto 0);
         Clk, load_enabled, TD, TA, TB : in std_logic;
         data : in std_logic_vector(31 downto 0);
         a_data, b_data : out std_logic_vector(31 downto 0)
  );
end component;

  -- 2 to 1 line 32 bit multiplexer
  component multiplexer_2to1_32bit
  port ( in0 : in std_logic_vector(31 downto 0);
         in1 : in std_logic_vector(31 downto 0);
         s : in std_logic;
         Z : out std_logic_vector(31 downto 0)
  );
end component;

  -- signals
  signal data_a, data_b, const_out, FU_out, data_bus : STD_LOGIC_VECTOR(31 downto 0);
  signal TAin, TDin, TBin : STD_LOGIC;

  begin
    TDin <= des_A(4);
    TAin <= src_A(4);
    TBin <= src_B(4);
    regfile : register_file
    port map ( data => data_bus,
               src_a => src_a,
               src_b => src_b,
               des_A => des_A,
               Clk => Clk,
               load_enabled => load_enabled,
               TD => TDin,
               TA => TAin,
               TB => TBin,
               a_data => data_a,
               b_data => data_b
    );

    mux0 : multiplexer_2to1_32bit
    port map ( in0 => data_b,
               in1 => const_in,
               s => MUX_S1,
               Z => const_out
    );

    FU : Function_Unit
    port map ( A => data_a,
               B => const_out,
               Cin => Cin,
               ALU_S => ALU_S,
               FU_S => FU_S,
               S => S,
               Z => FU_out,
               Cout => Cout,
               Vout => Vout,
               Nout => Nout,
               Zout => Zout
    );

    mux1 : multiplexer_2to1_32bit
    port map ( in0 => FU_out,
               in1 => data,
               s => MUX_S2,
               Z => data_bus
    );

    adr_out <= data_a;
    data_out <= const_out;
  end Behavioral;
