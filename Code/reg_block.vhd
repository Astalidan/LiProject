library ieee;
use ieee.std_logic_1164.all;
entity reg_block is
	port(
		i, ls, rs, lr, rr, clear, trues, clk:in std_logic; --"trues" means all high in this context, because "high" is a vhdl word
 		op:std_logic_vector(2 downto 0);
		o:inout std_logic);
end entity;
architecture under_the_hood of reg_block is
	component mux8_1
		port (i7, i6, i5, i4, i3, i2, i1, i0:in std_logic;
			s:in std_logic_vector (2 downto 0);
			o:out std_logic);
	end component;
	component D_FF
		   port(
		clk,d : in std_logic;
		q : out std_logic);
	end component;
	signal m2d:std_logic;
		begin
		operation: mux8_1 port map (o, i, ls, rs, lr, rr, clear, trues, op(2 downto 0), m2d);
		memory: D_FF port map (clk, m2d, o);
end under_the_hood;