library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory512x32_tb is
end Memory512x32_tb;

architecture Behavioral of Memory512x32_tb is
  component Memory512x32
  port ( address_mem : in STD_LOGIC_VECTOR(31 downto 0);
         write_data : in STD_LOGIC_VECTOR(31 downto 0);
         mem_write : in STD_LOGIC;
         read_data : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

  -- input
  signal address_mem, write_data : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
  signal mem_write : STD_LOGIC := '0';

  -- output
  signal read_data : STD_LOGIC_VECTOR(31 downto 0);

  begin
    uut : Memory512x32
    port map ( address_mem => address_mem,
               write_data => write_data,
               mem_write => mem_write,
               read_data => read_data
    );

    stim_proc : process
    begin
      address_mem <= x"00000000";
      wait for 10 ns;
      address_mem <= x"00000001";
      wait for 10 ns;
      address_mem <= x"00000006";
      wait for 10 ns;
      address_mem <= x"00000009";
      wait for 10 ns;
      address_mem <= x"00000003";
      write_data <= x"00000002";
      mem_write <= '1';
      wait for 10 ns;
    end process;
  end;
