library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_5to32 is
  Port ( A : in std_logic_vector(4 downto 0);
         Q : out std_logic_vector(31 downto 0)
       );
end decoder_5to32;

architecture Behavioral of decoder_5to32 is
  begin                                                                                             -- 4 3 2 1 0
    Q(0) <= ((not A(0)) and (not A(1)) and (not A(2)) and (not A(3)) and (not A(4))) after 5 ns;    -- 0 0 0 0 0
    Q(1) <= (A(0) and (not A(1)) and (not A(2)) and (not A(3)) and (not A(4))) after 5 ns;          -- 0 0 0 0 1
    Q(2) <= ((not A(0)) and A(1) and (not A(2)) and (not A(3)) and (not A(4))) after 5 ns;          -- 0 0 0 1 0
    Q(3) <= (A(0) and A(1) and (not A(2)) and (not A(3)) and (not A(4))) after 5 ns;                -- 0 0 0 1 1
    Q(4) <= ((not A(0)) and (not A(1)) and A(2) and (not A(3)) and (not A(4))) after 5 ns;          -- 0 0 1 0 0
    Q(5) <= (A(0) and (not A(1)) and A(2) and (not A(3)) and (not A(4))) after 5 ns;                -- 0 0 1 0 1
    Q(6) <= ((not A(0)) and A(1) and A(2) and (not A(3)) and (not A(4))) after 5 ns;                -- 0 0 1 1 0
    Q(7) <= (A(0) and A(1) and A(2) and (not A(3)) and (not A(4))) after 5 ns;                      -- 0 0 1 1 1
    Q(8) <= ((not A(0)) and (not A(1)) and (not A(2)) and A(3) and (not A(4))) after 5 ns;          -- 0 1 0 0 0
    Q(9) <= (A(0) and (not A(1)) and (not A(2)) and A(3) and (not A(4))) after 5 ns;                -- 0 1 0 0 1
    Q(10) <= ((not A(0)) and A(1) and (not A(2)) and A(3) and (not A(4))) after 5 ns;               -- 0 1 0 1 0
    Q(11) <= (A(0) and A(1) and (not A(2)) and A(3) and (not A(4))) after 5 ns;                     -- 0 1 0 1 1
    Q(12) <= ((not A(0)) and (not A(1)) and A(2) and A(3) and (not A(4))) after 5 ns;               -- 0 1 1 0 0
    Q(13) <= (A(0) and (not A(1)) and A(2) and A(3) and (not A(4))) after 5 ns;                     -- 0 1 1 0 1
    Q(14) <= ((not A(0)) and A(1) and A(2) and A(3) and (not A(4))) after 5 ns;                     -- 0 1 1 1 0
    Q(15) <= (A(0) and A(1) and A(2) and A(3) and (not A(4))) after 5 ns;                           -- 0 1 1 1 1
    Q(16) <= ((not A(0)) and (not A(1)) and (not A(2)) and (not A(3)) and A(4)) after 5 ns;         -- 1 0 0 0 0
    Q(17) <= (A(0) and (not A(1)) and (not A(2)) and (not A(3)) and A(4)) after 5 ns;               -- 1 0 0 0 1
    Q(18) <= ((not A(0)) and A(1) and (not A(2)) and (not A(3)) and A(4)) after 5 ns;               -- 1 0 0 1 0
    Q(19) <= (A(0) and A(1) and (not A(2)) and (not A(3)) and A(4)) after 5 ns;                     -- 1 0 0 1 1
    Q(20) <= ((not A(0)) and (not A(1)) and A(2) and (not A(3)) and A(4)) after 5 ns;               -- 1 0 1 0 0
    Q(21) <= (A(0) and (not A(1)) and A(2) and (not A(3)) and A(4)) after 5 ns;                     -- 1 0 1 0 1
    Q(22) <= ((not A(0)) and A(1) and A(2) and (not A(3)) and A(4)) after 5 ns;                     -- 1 0 1 1 0
    Q(23) <= (A(0) and A(1) and A(2) and (not A(3)) and A(4)) after 5 ns;                           -- 1 0 1 1 1
    Q(24) <= ((not A(0)) and (not A(1)) and (not A(2)) and A(3) and A(4)) after 5 ns;               -- 1 1 0 0 0
    Q(25) <= (A(0) and (not A(1)) and (not A(2)) and A(3) and A(4)) after 5 ns;                     -- 1 1 0 0 1
    Q(26) <= ((not A(0)) and A(1) and (not A(2)) and A(3) and A(4)) after 5 ns;                     -- 1 1 0 1 0
    Q(27) <= (A(0) and A(1) and (not A(2)) and A(3) and A(4)) after 5 ns;                           -- 1 1 0 1 1
    Q(28) <= ((not A(0)) and (not A(1)) and A(2) and A(3) and A(4)) after 5 ns;                     -- 1 1 1 0 0
    Q(29) <= (A(0) and (not A(1)) and A(2) and A(3) and A(4)) after 5 ns;                           -- 1 1 1 0 1
    Q(30) <= ((not A(0)) and A(1) and A(2) and A(3) and A(4)) after 5 ns;                           -- 1 1 1 1 0
    Q(31) <= (A(0) and A(1) and A(2) and A(3) and A(4)) after 5 ns;                                 -- 1 1 1 1 1
  end Behavioral;
