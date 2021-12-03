library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MicroProcessor is
  port ( Clk, reset : in STD_LOGIC;
         PC, inst : out STD_LOGIC_VECTOR(31 downto 0)
  );
end MicroProcessor;

architecture Behavioral of MicroProcessor is
  component datapath
  port ( data, const_in : in STD_LOGIC_VECTOR(31 downto 0);
         Clk, Cin, ALU_S, FU_S, load_enabled, MUX_S1, MUX_S2 : in STD_LOGIC;
         src_a, src_b, des_A : in STD_LOGIC_VECTOR(4 downto 0);
         S : in STD_LOGIC_VECTOR(1 downto 0);
         adr_out, data_out : out STD_LOGIC_VECTOR(31 downto 0);
         Vout, Cout, Nout, Zout : out STD_LOGIC
  );
end component;

  component MicroController
  port ( reset, Clk, V, C, N, Z : in STD_LOGIC;
         inst_in : in STD_LOGIC_VECTOR(31 downto 0);
         TDDR, TASA, TBSB : out STD_LOGIC_VECTOR(4 downto 0);
         FS : out STD_LOGIC_VECTOR(4 downto 0);
         MBout, MDout, MMout, RWout, MWout, FLout, RZout, RNout, RCout, RVout : out STD_LOGIC;
         PCout : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  component Memory512x32
  port ( address_mem : in STD_LOGIC_VECTOR(31 downto 0);
         write_data : in STD_LOGIC_VECTOR(31 downto 0);
         mem_write : in STD_LOGIC;
         read_data : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  signal memdata, PCout, address, memdatain : STD_LOGIC_VECTOR(31 downto 0);
  signal FS, TDDR, TASA, TBSB : STD_LOGIC_VECTOR(4 downto 0);
  signal RW, MB, MD, V, C, N, Z, RV, RC, RN, RZ, MM, MW, FL : STD_LOGIC;

  begin
    dp : datapath
    port map ( Clk => Clk,
               data => memdata,
               const_in => PCout,
               FU_S => FS(4),
               ALU_S => FS(3),
               S => FS(2 downto 1),
               Cin => FS(0),
               load_enabled => RW,
               MUX_S1 => MB,
               MUX_S2 => MD,
               src_a => TASA,
               src_b => TBSB,
               des_A => TDDR,
               adr_out => address,
               data_out => memdatain,
               Vout => V,
               Cout => C,
               Nout => N,
               Zout => Z
    );

    V <= V XOR RV;
    C <= C XOR RC;
    N <= N XOR RN;
    Z <= Z XOR RZ;

    ctrl : MicroController
    port map ( reset => reset,
               Clk => Clk,
               V => V,
               C => C,
               N => N,
               Z => Z,
               inst_in => memdata,
               TDDR => TDDR,
               TASA => TASA,
               TBSB => TBSB,
               MBout => MB,
               MDout => MD,
               MMout => MM,
               RWout => RW,
               MWout => MW,
               FLout => FL,
               RZout => RZ,
               RNout => RN,
               RCout => RC,
               RVout => RV,
               FS => FS,
               PCout => PCout
    );

    mem : Memory512x32
    port map ( address_mem => address,
               write_data => memdatain,
               mem_write => MW,
               read_data => memdata
    );

    PC <= PCout;
    inst <= memdata;
  end Behavioral;
