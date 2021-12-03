library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ProgC is
  port( ext : in STD_LOGIC_VECTOR(31 downto 0);
        PL, PI, reset : in STD_LOGIC;
        Z : out STD_LOGIC_VECTOR(31 downto 0)
  );
end ProgC;

architecture Behavioral of ProgC is
  begin
    process(reset, PL, PI)
    variable current : STD_LOGIC_VECTOR(31 downto 0);
    variable tmp : integer;
    variable tmp1 : STD_LOGIC_VECTOR(31 downto 0);

    begin
      if(reset = '1') then current := x"00000000";
    elsif(PL = '1') then
      current := current + ext;
    elsif(PI = '1') then
      tmp := conv_integer(current);
      tmp := tmp + conv_integer(1);
      tmp1 := conv_std_logic_vector(tmp, 32);
      current := tmp1;
    end if;
    Z <= current;
  end process;
end Behavioral;      
