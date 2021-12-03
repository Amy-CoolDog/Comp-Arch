library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CAR_tb is
end CAR_tb;

architecture Behavioral of CAR_tb is
  component CAR
  port ( opcode : in STD_LOGIC_VECTOR(16 downto 0);
         load, Clk, reset : in STD_LOGIC;
         address : out STD_LOGIC_VECTOR(16 downto 0)
  );
end component;

  -- input
  signal opcode : STD_LOGIC_VECTOR(16 downto 0) := (others => '0');
  signal load, Clk, reset : STD_LOGIC := '0';

  -- output
  signal address : STD_LOGIC_VECTOR(16 downto 0);

  begin
    uut : CAR
    port map ( opcode => opcode,
               load => load,
               Clk => Clk,
               reset => reset,
               address => address
    );

    stim_proc : process
    begin
      reset <= '1';
      wait for 10 ns;
      reset <= '0';
      wait for 10 ns;
      opcode <= "00000000000000011";
      wait for 10 ns;
      opcode <= "00000000000000111";
      load <= '1';
      wait for 10 ns;
    end process;
  end;
