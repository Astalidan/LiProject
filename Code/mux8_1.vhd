library ieee;
use ieee.std_logic_1164.all;
-- this is a 8 to 1 multiplexor to be used in a LR shift/rotate register
entity mux8_1 is
	port (i7, i6, i5, i4, i3, i2, i1, i0:in std_logic;
			s:in std_logic_vector (2 downto 0);
			o:out std_logic);
end entity;
architecture selection of mux8_1 is
 begin
	with s select
		o <= i7 when "000", --hold
		i6 when "001", --parallel in
		i5 when "010", --left shift
		i4 when "011", --right shift
		i3 when "100", --left rotate
		i2 when "101", --right rotate
		i1 when "110", --clear
		i0 when others; --all high
end selection;
