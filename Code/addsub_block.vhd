library ieee;
use ieee.std_logic_1164.all;
--this is the adder block for the 32 bit ALU for the CPU
entity addsub_block is
	port (op, a, b, c_in:in std_logic;
			c_out, s:out std_logic);
end entity;
architecture guts of addsub_block is
	signal bx: std_logic;
		begin bx <= op XOR b;
				c_out <= (a AND bx) OR (c_in AND bx) OR (c_in AND a);
				s <= a XOR bx XOR c_in;
end guts;
				