-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity top_hamming_coeff_M_real_V_rom is 
    generic(
             DWIDTH     : integer := 9; 
             AWIDTH     : integer := 6; 
             MEM_SIZE    : integer := 39
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of top_hamming_coeff_M_real_V_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "000010100", 1 => "000010110", 2 => "000011010", 3 => "000100010", 
    4 => "000101101", 5 => "000111010", 6 => "001001001", 7 => "001011010", 
    8 => "001101101", 9 => "010000000", 10 => "010010011", 11 => "010100111", 
    12 => "010111001", 13 => "011001010", 14 => "011011001", 15 => "011100111", 
    16 => "011110001", 17 => "011111001", 18 => "011111110", 19 => "100000000", 
    20 => "011111110", 21 => "011111001", 22 => "011110001", 23 => "011100111", 
    24 => "011011001", 25 => "011001010", 26 => "010111001", 27 => "010100111", 
    28 => "010010011", 29 => "010000000", 30 => "001101101", 31 => "001011010", 
    32 => "001001001", 33 => "000111010", 34 => "000101101", 35 => "000100010", 
    36 => "000011010", 37 => "000010110", 38 => "000010100" );


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

entity top_hamming_coeff_M_real_V is
    generic (
        DataWidth : INTEGER := 9;
        AddressRange : INTEGER := 39;
        AddressWidth : INTEGER := 6);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of top_hamming_coeff_M_real_V is
    component top_hamming_coeff_M_real_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    top_hamming_coeff_M_real_V_rom_U :  component top_hamming_coeff_M_real_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


