library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControlMemory256x42_tb is
end ControlMemory256x42_tb;

architecture Behavioral of ControlMemory256x42_tb is
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

  --input
  signal In_car : STD_LOGIC_VECTOR(16 downto 0);

  --output
  signal MW : std_logic;
  signal MM : std_logic;
  signal RW : std_logic;
  signal MD : std_logic;
  signal MB : std_logic;
  signal TB : std_logic;
  signal TA : std_logic;
  signal TD : std_logic;
  signal PL : std_logic;
  signal PI : std_logic;
  signal IL : std_logic;
  signal MC : std_logic;
  signal FS : std_logic_vector(4 downto 0);
  signal MS : std_logic_vector(2 downto 0);
  signal NA : std_logic_vector(16 downto 0);

  begin
    uut : ControlMemory256x42
    port map ( in_car => in_car,
               MW => MW,
               MM => MM,
               RW => RW,
               MD => MD,
               MB => MB,
               TB => TB,
               TA => TA,
               TD => TD,
               PL => PL,
               PI => PI,
               IL => IL,
               MC => MC,
               FS => FS,
               MS => MS,
               NA => NA
    );

    stim_proc : process
    begin
      In_car <= "00000000000000000";
      wait for 10 ns;
      In_car <= "00000000000000001";
      wait for 10 ns;
      In_car <= "00000000000000100";
      wait for 10 ns;
    end process;
  end;
