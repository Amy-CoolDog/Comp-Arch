library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity multiplexer_2to1_tb is
end multiplexer_2to1_tb;

architecture behavioral of multiplexer_2to1_tb is
  component multiplexer_2to1_32bit
  port ( in0 : in std_logic_vector(31 downto 0);
         in1 : in std_logic_vector(31 downto 0);
         s : in std_logic;
         Z : out std_logic_vector(31 downto 0)
  );
end component;

  -- Inputs
  signal in0 : std_logic_vector(31 downto 0) := (others => '0');
  signal in1 : std_logic_vector(31 downto 0) := (others => '0');
  signal s : std_logic := '0';

  -- Outputs
  signal Z : std_logic_vector(31 downto 0) := (others => '0');

  begin
    -- Instantiate the Unit Under Test (UUT)
    uut : multiplexer_2to1_32bit port map
    ( in0,
      in1,
      s,
      Z
    );
    stim_proc : process
    begin
      in0 <= x"FFFF0000";
      in1 <= x"0000FFFF";
      wait for 10 ns;
      s <= '1';
      wait for 10 ns;
      s <= '0';
      wait for 10 ns;
      in0 <= x"05050505";
      in1 <= x"50505050";
      wait for 10 ns;
      s <= '1';
      wait for 10 ns;
      s <= '0';
      wait for 10 ns;
    end process;
  end;
