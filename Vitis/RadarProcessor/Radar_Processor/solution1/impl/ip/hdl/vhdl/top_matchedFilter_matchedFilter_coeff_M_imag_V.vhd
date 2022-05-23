-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity top_matchedFilter_matchedFilter_coeff_M_imag_V_rom is 
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


architecture rtl of top_matchedFilter_matchedFilter_coeff_M_imag_V_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "100001001", 1 => "010101011", 2 => "111011111", 3 => "101111110", 
    4 => "011110001", 5 => "100010100", 6 => "001100000", 7 => "001101101", 
    8 => "100001000", 9 => "011001010", 10 => "000001100", 11 => "100100001", 
    12 => "011011101", 13 => "000001100", 14 => "100010010", 15 => "010110100", 
    16 => "001101101", 17 => "100000010", 18 => "000100000", 19 => "011110001", 
    20 => "110000001", 21 => "100110100", 22 => "010101011", 23 => "010110110", 
    24 => "101001011", 25 => "101000010", 26 => "010011010", 27 => "011011110", 
    28 => "110101001", 29 => "100000010", 30 => "111011101", 31 => "011100111", 
    32 => "010110110", 33 => "110011111", 34 => "100000000", 35 => "101111110", 
    36 => "001111110", 37 => "011111111", 38 => "010011100", 39 => "110111111", 
    40 => "100011000", 41 => "100010010", 42 => "110011100", 43 => "001010110", 
    44 => "011011101", 45 => "011111101", 46 => "010111101", 47 => "001000011", 
    48 => "110111111", 49 => "101010100", 50 => "100010100", 51 => "100000000", 
    52 => "100001110", 53 => "100110100", 54 => "101100011", 55 => "110010010", 
    56 => "110111100", 57 => "111011101", 58 => "111110011", 59 to 60=> "111111110", 
    61 => "111110011", 62 => "111011101", 63 => "110111100", 64 => "110010010", 
    65 => "101100011", 66 => "100110100", 67 => "100001110", 68 => "100000000", 
    69 => "100010100", 70 => "101010100", 71 => "110111111", 72 => "001000011", 
    73 => "010111101", 74 => "011111101", 75 => "011011101", 76 => "001010110", 
    77 => "110011100", 78 => "100010010", 79 => "100011000", 80 => "110111111", 
    81 => "010011100", 82 => "011111111", 83 => "001111110", 84 => "101111110", 
    85 => "100000000", 86 => "110011111", 87 => "010110110", 88 => "011100111", 
    89 => "111011101", 90 => "100000010", 91 => "110101001", 92 => "011011110", 
    93 => "010011010", 94 => "101000010", 95 => "101001011", 96 => "010110110", 
    97 => "010101011", 98 => "100110100", 99 => "110000001", 100 => "011110001", 
    101 => "000100000", 102 => "100000010", 103 => "001101101", 104 => "010110100", 
    105 => "100010010", 106 => "000001100", 107 => "011011101", 108 => "100100001", 
    109 => "000001100", 110 => "011001010", 111 => "100001000", 112 => "001101101", 
    113 => "001100000", 114 => "100010100", 115 => "011110001", 116 => "101111110", 
    117 => "111011111", 118 => "010101011", 119 => "100001001" );


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

entity top_matchedFilter_matchedFilter_coeff_M_imag_V is
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

architecture arch of top_matchedFilter_matchedFilter_coeff_M_imag_V is
    component top_matchedFilter_matchedFilter_coeff_M_imag_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    top_matchedFilter_matchedFilter_coeff_M_imag_V_rom_U :  component top_matchedFilter_matchedFilter_coeff_M_imag_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


