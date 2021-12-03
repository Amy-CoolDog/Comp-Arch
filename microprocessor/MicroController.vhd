library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MicroController is
  port ( reset, Clk, V, C, N, Z : in STD_LOGIC;
         inst_in : in STD_LOGIC_VECTOR(31 downto 0);
         TDDR, TASA, TBSB : out STD_LOGIC_VECTOR(4 downto 0);
         FS : out STD_LOGIC_VECTOR(4 downto 0);
         MBout, MDout, MMout, RWout, MWout, FLout, RZout, RNout, RCout, RVout : out STD_LOGIC;
         PCout : out STD_LOGIC_VECTOR(31 downto 0)
  );
end MicroController;

architecture Behavioral of MicroController is
  component CAR
  port ( opcode : in STD_LOGIC_VECTOR(16 downto 0);
         load, Clk, reset : in STD_LOGIC;
         address : out STD_LOGIC_VECTOR(16 downto 0)
  );
  end component;

  component ProgC
  port ( ext : in STD_LOGIC_VECTOR(31 downto 0);
        PL, PI, reset : in STD_LOGIC;
        Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
  end component;

  component Extend
  port ( DR, SB : in STD_LOGIC_VECTOR(4 downto 0);
         Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
  end component;

  component InReg
  port ( IR : in STD_LOGIC_VECTOR(31 downto 0);
         IL : in STD_LOGIC;
         opcode : out STD_LOGIC_VECTOR(16 downto 0);
         DR, SA, SB : out STD_LOGIC_VECTOR(4 downto 0)
  );
  end component;

  component ControlMemory256x42
  port ( In_car : in STD_LOGIC_VECTOR(16 downto 0);
         FL : out std_logic; -- 0
         RZ : out std_logic; -- 1
         RN : out std_logic; -- 2
         RC : out std_logic; -- 3
         RV : out std_logic; -- 4
         MW : out std_logic; -- 5
         MM : out std_logic; -- 6
         RW : out std_logic; -- 7
         MD : out std_logic; -- 8
         FS : out std_logic_vector(4 downto 0); -- 9 to 13
         MB : out std_logic; -- 14
         TB : out std_logic; -- 15
         TA : out std_logic; -- 16
         TD : out std_logic; -- 17
         PL : out std_logic; -- 18
         PI : out std_logic; -- 19
         IL : out std_logic; -- 20
         MC : out std_logic; -- 21
         MS : out std_logic_vector(2 downto 0); -- 22 to 24
         NA : out std_logic_vector(16 downto 0) -- 25 to 41
  );
  end component;

  component MUX8to1
  port ( in0, in1, in2, in3, in4, in5, in6, in7 : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(2 downto 0);
         Z : out STD_LOGIC
  );
  end component;

  component multiplexer_2to1_32bit
  port ( in0 : in std_logic_vector(31 downto 0);
         in1 : in std_logic_vector(31 downto 0);
         s : in std_logic;
         Z : out std_logic_vector(31 downto 0)
  );
  end component;

  signal ext, pcv : STD_LOGIC_VECTOR(31 downto 0);
  signal NZ, NC, muxSout, PI, PL, IL, MC : STD_LOGIC;
  signal DR, SA, SB : STD_LOGIC_VECTOR(4 downto 0);
  signal MS : STD_LOGIC_VECTOR(2 downto 0);
  signal opcode, muxCout, carout, NA : STD_LOGIC_VECTOR(16 downto 0);
  signal unused : STD_LOGIC_VECTOR(31 downto 17);

  begin
    PC : ProgC
    port map ( reset => reset,
               ext => ext,
               PI => PI,
               PL => PL,
               Z => pcv
    );

    PCout <= pcv;

    extnd : Extend
    port map ( DR => DR,
               SB => SB,
               Z => ext
    );

    TDDR <= DR;
    TASA <= SA;
    TBSB <= SB;

    IR1 : InReg
    port map ( IR => inst_in,
               IL => IL,
               opcode => opcode,
               DR => DR,
               SA => SA,
               SB => SB
    );

    muxC : multiplexer_2to1_32bit
    port map ( in0(16 downto 0) => NA,
               in0(31 downto 17) => "000000000000000",
               in1(16 downto 0) => opcode,
               in1(31 downto 17) => "000000000000000",
               S => MC,
               Z(16 downto 0) => muxCout,
               Z(31 downto 17) => unused
    );

    CAR1 : CAR
    port map ( reset => reset,
               opcode => muxCout,
               load => muxSout,
               Clk => Clk,
               address => carout
    );

    ctrlmem : ControlMemory256x42
    port map ( In_car => carout,
               FL => FLout,
               RZ => RZout,
               RN => RNout,
               RC => RCout,
               RV => RVout,
               MW => MWout,
               MM => MMout,
               RW => RWout,
               MD => MDout,
               FS => FS,
               MB => MBout,
               TB => TBSB(4),
               TA => TASA(4),
               TD => TDDR(4),
               PL => PL,
               PI => PI,
               IL => IL,
               MC => MC,
               MS => MS,
               NA => NA
    );

    NZ <= NOT Z;
    NC <= NOT C;

    muxS : MUX8to1
    port map ( in0 => '0',
               in1 => '1',
               in2 => C,
               in3 => V,
               in4 => Z,
               in5 => N,
               in6 => NC,
               in7 => NZ,
               S => MS,
               Z => muxSout
    );
  end Behavioral;
