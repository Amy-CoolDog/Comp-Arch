library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MUX8to1_tb is
end MUX8to1_tb;

architecture Behavioral of MUX8to1_tb is
  component MUX8to1
  port ( in0, in1, in2, in3, in4, in5, in6, in7 : in STD_LOGIC;
         S : in STD_LOGIC_VECTOR(2 downto 0);
         Z : out STD_LOGIC
  );
end component;

 -- input
 signal in0, in1, in2, in3, in4, in5, in6, in7 : STD_LOGIC := '0';
 signal S : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

 -- output
 signal Z : STD_LOGIC;

 begin
   uut : MUX8to1
   port map ( in0 => in0,
              in1 => in1,
              in2 => in2,
              in3 => in3,
              in4 => in4,
              in5 => in5,
              in6 => in6,
              in7 => in7,
              S => S,
              Z => Z
   );

   stim_proc : process
   begin
     in0 <= '1';
     in1 <= '0';
     in2 <= '1';
     in3 <= '0';
     in4 <= '1';
     in5 <= '0';
     in6 <= '1';
     in7 <= '0';
     S <= "000";
     wait for 10 ns;
     S <= "001";
     wait for 10 ns;
     S <= "010";
     wait for 10 ns;
     S <= "011";
     wait for 10 ns;
     S <= "100";
     wait for 10 ns;
     S <= "101";
     wait for 10 ns;
     S <= "110";
     wait for 10 ns;
     S <= "111";
     wait for 10 ns;
   end process;
 end;
