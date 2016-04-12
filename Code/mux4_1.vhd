library ieee;
use ieee.std_logic_1164.all;
-- this is a 4 to 1 multiplexor to be used in a LR shift register
entity mux4_1
	port (i:in std_logic_vector (3 downto 0);
			s:in std_logic_vector (1 downto 0);
			o:out std_logic);
end entity
architecture selection of mux4_1 is

	with s select
		o <= i(0) when '00';
		i(1) when '01';
		i(2) when '10';
		i(3) when others;
end selection;
