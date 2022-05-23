-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity top_matchedFilter_matchedFilter_coeff_M_real_V_rom is 
    generic(
             DWIDTH     : integer := 9; 
             AWIDTH     : integer := 7; 
             MEM_SIZE    : integer := 120
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of top_matchedFilter_matchedFilter_coeff_M_real_V_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "110111100", 1 => "010111101", 2 => "100000010", 3 => "011011101", 
    4 => "110101001", 5 => "110011100", 6 => "011101101", 7 => "100011000", 
    8 => "001000000", 9 => "010011100", 10 => "100000000", 11 => "001111110", 
    12 => "010000001", 13 => "100000000", 14 => "001100000", 15 => "010110110", 
    16 => "100011000", 17 => "111011101", 18 => "011111101", 19 => "110101001", 
    20 => "100100001", 21 => "010011010", 22 => "010111101", 23 => "101001011", 
    24 => "101001001", 25 => "010101011", 26 => "011001011", 27 => "110000001", 
    28 => "100001110", 29 => "000100000", 30 => "011111101", 31 => "001101101", 
    32 => "101001011", 33 => "100010010", 34 => "111110011", 35 => "011011101", 
    36 => "011011110", 37 => "000001100", 38 => "100110101", 39 => "100001000", 
    40 => "110010010", 41 => "001100000", 42 => "011101011", 43 => "011110001", 
    44 => "010000001", 45 => "111011111", 46 => "101010100", 47 => "100001001", 
    48 => "100001000", 49 => "101000010", 50 => "110011100", 51 => "111111110", 
    52 => "001010110", 53 => "010011010", 54 => "011001010", 55 => "011100111", 
    56 => "011110110", 57 => "011111101", 58 to 61=> "011111111", 62 => "011111101", 
    63 => "011110110", 64 => "011100111", 65 => "011001010", 66 => "010011010", 
    67 => "001010110", 68 => "111111110", 69 => "110011100", 70 => "101000010", 
    71 => "100001000", 72 => "100001001", 73 => "101010100", 74 => "111011111", 
    75 => "010000001", 76 => "011110001", 77 => "011101011", 78 => "001100000", 
    79 => "110010010", 80 => "100001000", 81 => "100110101", 82 => "000001100", 
    83 => "011011110", 84 => "011011101", 85 => "111110011", 86 => "100010010", 
    87 => "101001011", 88 => "001101101", 89 => "011111101", 90 => "000100000", 
    91 => "100001110", 92 => "110000001", 93 => "011001011", 94 => "010101011", 
    95 => "101001001", 96 => "101001011", 97 => "010111101", 98 => "010011010", 
    99 => "100100001", 100 => "110101001", 101 => "011111101", 102 => "111011101", 
    103 => "100011000", 104 => "010110110", 105 => "001100000", 106 => "100000000", 
    107 => "010000001", 108 => "001111110", 109 => "100000000", 110 => "010011100", 
    111 => "001000000", 112 => "100011000", 113 => "011101101", 114 => "110011100", 
    115 => "110101001", 116 => "011011101", 117 => "100000010", 118 => "010111101", 
    119 => "110111100" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity top_matchedFilter_matchedFilter_coeff_M_real_V is
    generic (
        DataWidth : INTEGER := 9;
        AddressRange : INTEGER := 120;
        AddressWidth : INTEGER := 7);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of top_matchedFilter_matchedFilter_coeff_M_real_V is
    component top_matchedFilter_matchedFilter_coeff_M_real_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    top_matchedFilter_matchedFilter_coeff_M_real_V_rom_U :  component top_matchedFilter_matchedFilter_coeff_M_real_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


