library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity IR_tb is
end IR_tb;

architecture Behavioral of IR_tb is
  component InReg
  port ( IR : in STD_LOGIC_VECTOR(31 downto 0);
         IL : in STD_LOGIC;
         opcode : out STD_LOGIC_VECTOR(16 downto 0);
         DR, SA, SB : out STD_LOGIC_VECTOR(4 downto 0)
  );
end component;

  -- input
  signal IR : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal IL : STD_LOGIC := '0';

  -- output
  signal opcode : STD_LOGIC_VECTOR(16 downto 0);
  signal DR, SA, SB : STD_LOGIC_VECTOR(4 downto 0);

  begin
    uut : InReg
    port map ( IR => IR,
               IL => IL,
               opcode => opcode,
               DR => DR,
               SA => SA,
               SB => SB
    );

    stim_proc : process
    begin
      IR <= "00000000000000011000000000000000";
      wait for 10 ns;
      IL <= '1';
      IR <= "00000000000000001000100000000000";
      wait for 10 ns;
      IR <= "00000000000000000000000001000111";
      wait for 10 ns;
    end process;
  end;
