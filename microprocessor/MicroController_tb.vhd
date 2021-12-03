library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MicroController_tb is
end MicroController_tb;

architecture Behavioral of MicroController_tb is
  component MicroController
  port ( reset, Clk, V, C, N, Z : in STD_LOGIC;
         inst_in : in STD_LOGIC_VECTOR(31 downto 0);
         TDDR, TASA, TBSB : out STD_LOGIC_VECTOR(4 downto 0);
         FS : out STD_LOGIC_VECTOR(4 downto 0);
         MBout, MDout, MMout, RWout, MWout, FLout, RZout, RNout, RCout, RVout : out STD_LOGIC;
         PCout : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  -- input
  signal reset, Clk, V, C, N, Z : STD_LOGIC := '0';
  signal inst_in : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

  -- output
  signal TDDR, TASA, TBSB, FS : STD_LOGIC_VECTOR(4 downto 0);
  signal MBout, MDout, MMout, RWout, MWout, FLout, RZout, RNout, RCout, RVout : STD_LOGIC;
  signal PCout : STD_LOGIC_VECTOR(31 downto 0);

  begin
    Clk <= not Clk after 5 ns;

    uut : MicroController
    port map ( reset => reset,
               Clk => Clk,
               V => V,
               C => C,
               N => N,
               Z => Z,
               inst_in => inst_in,
               TDDR => TDDR,
               TASA => TASA,
               TBSB => TBSB,
               FS => FS,
               MBout => MBout,
               MDout => MDout,
               MMout => MMout,
               RWout => RWout,
               MWout => MWout,
               FLout => FLout,
               RZout => RZout,
               RNout => RNout,
               RCout => RCout,
               RVout => RVout,
               PCout => PCout
    );

    stim_proc : process
    begin
      reset <= '1';
      V <= '0';
      C <= '0';
      N <= '0';
      Z <= '0';
      inst_in <= "00000000000000011000000000000000";
      wait for 10 ns;
      reset <= '0';
      wait for 10 ns;
      inst_in <= "00000000000000001000100000000000";
      wait for 10 ns;
      inst_in <= "00000000000000000000000001000111";
      wait for 10 ns;
    end process;
  end;
