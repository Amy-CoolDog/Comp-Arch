library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MicroProcessor_tb is
end MicroProcessor_tb;

architecture Behavioral of MicroProcessor_tb is
  component MicroProcessor
  port ( Clk, reset : in STD_LOGIC;
         PC, inst : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  --input
  signal reset, Clk : STD_LOGIC := '0';

  --output
  signal PC, inst : STD_LOGIC_VECTOR(31 downto 0);

  begin
    Clk <= not Clk after 5 ns;

    uut : MicroProcessor
    port map ( reset => reset,
               Clk => Clk,
               PC => PC,
               inst => inst
    );

    stim_proc : process
    begin
      reset <= '1';
      wait for 10 ns;
      reset <= '0';
      wait for 10 ns;
    end process;
  end;
