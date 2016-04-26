library ieee;
use ieee.std_logic_1164.all;
--this is a 2_1mux switches 2 32bit inputs into 1 32 bit output
entity parallel_mux2_1 is
	port (a, b:in std_logic_vector (31 downto 0); --0 outputs a, 1 outputs b
			s:in std_logic;
			o:out std_logic_vector (31 downto 0));
end entity;
architecture insides of Parallel_mux2_1 is
begin	
	with s select
	o(31 downto 0) <= a(31 downto 0) when '0',
	b(31 downto 0) when others;
end insides;