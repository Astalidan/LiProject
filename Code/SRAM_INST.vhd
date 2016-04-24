library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SRAM_INST is

port (
			clk  : 		in std_logic;   
			radd : 		in std_logic_vector(6 downto 0);
			data_out : 	buffer std_logic_vector(31 downto 0) );
end SRAM_INST;

architecture behavior of SRAM_INST  is

constant ram_0 : std_logic_vector(31 downto 0) := "00000001001000000000000000000000";
constant ram_1 : std_logic_vector(31 downto 0) := "00010010001100000000000000000000";
constant ram_2 : std_logic_vector(31 downto 0) := "00100011010000000000000000000000";
constant ram_3 : std_logic_vector(31 downto 0) := "00110100010100000000000000000000";
constant ram_4 : std_logic_vector(31 downto 0) := "01000101011000000000000000000000";
constant ram_5 : std_logic_vector(31 downto 0) := "01010110011100000000000000000000";
constant ram_6 : std_logic_vector(31 downto 0) := "01100111100000000000000000000000";
constant ram_7 : std_logic_vector(31 downto 0) := "01111000100100000000000000000000";
begin
					data_out <=  ram_0 when radd = "0000000" else
									 ram_1 when radd = "0000001" else
									 ram_2 when radd = "0000010" else
									 ram_3 when radd = "0000011";

end behavior;