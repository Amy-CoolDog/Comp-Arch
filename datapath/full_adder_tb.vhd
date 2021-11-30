library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
  component full_adder
  port ( A, B, Cin : in STD_LOGIC;
         S, Cout : out STD_LOGIC
  );
end component;

  -- inputs
  signal A, B, Cin : STD_LOGIC := '0';
  -- outputs
  signal S, Cout : STD_LOGIC;

  begin
    uut : full_adder
    port map ( A => A,
               B => B,
               Cin => Cin,
               S => S,
               Cout => Cout
    );

    stim_proc : process
    begin
      wait for 10 ns;
      A <= '1';
      B <= '0';
      Cin <= '0';
      wait for 10 ns;
      A <= '0';
      B <= '1';
      Cin <= '0';
      wait for 10 ns;
      A <= '1';
      B <= '1';
      Cin <= '0';
      wait for 10 ns;
      A <= '0';
      B <= '0';
      Cin <= '1';
      wait for 10 ns;
      A <= '1';
      B <= '0';
      Cin <= '1';
      wait for 10 ns;
      A <= '0';
      B <= '1';
      Cin <= '1';
      wait for 10 ns;
      A <= '1';
      B <= '1';
      Cin <= '1';
      wait for 10 ns;
    end process;
  end;
