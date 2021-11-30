library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_32_tb is
end register_32_tb;

architecture Behavioral of register_32_tb is
  component register_32
  port ( D : in std_logic_vector(31 downto 0);
         load, Clk : in std_logic;
         Q : out std_logic_vector(31 downto 0)
  );
end component;

-- Inputs
signal D : std_logic_vector(31 downto 0) := (others => '0');
signal load : std_logic := '0';
signal Clk : std_logic := '0';

-- Outputs
signal Q : std_logic_vector(31 downto 0);

begin
  -- Instantiate the Unit Under Test (UUT)
  uut : register_32
  port map ( D,
             load,
             Clk,
             Q
  );

  Clk <= not Clk after 5 ns;

  stim_proc : process
  begin
    load <= '1';
    D <= x"0136454A";
    wait for 10 ns;
    D <= x"00000000";
    wait for 10 ns;
    D <= x"0136454A";
    wait for 10 ns;
    D <= x"00000000";
    wait for 10 ns;
    load <= '0';
    D <= x"0136454A";
    wait for 10 ns;
    D <= x"00000000";
    wait for 10 ns;
    D <= x"0136454A";
    wait for 10 ns;
    D <= x"00000000";
    wait for 10 ns;
  end process;
end;
