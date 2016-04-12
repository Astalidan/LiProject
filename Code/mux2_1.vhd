library ieee;
use ieee.std_logic_1164.all;
--this will be a 2_1mux to be used in a 32bit parrallel mux
entity mux2_1 is
	PORT ( w0, w1, s : IN STD LOGIC ;
			f : OUT STD LOGIC ) ;
END mux2to1 ;
ARCHITECTURE Behavior OF mux2to1 IS
BEGIN
	WITH s SELECT
	f <= w0 WHEN ’0’,
			w1 WHEN OTHERS ;
END Behavior ;