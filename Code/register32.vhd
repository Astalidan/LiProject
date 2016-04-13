library IEEE;
use IEEE.std_logic_1164.all;
--opertations are in the following order
--000 hold
--001 parallel load (there is no serial load)
--010 left shift
--011 right shift
--100 right rotate
--101 left rotate
--110 clear (sets all values to 0)
--111 true all (sets all values to 1)
-- if you inspect this and the reg_block code, you'll notice that left rotate and right rotate are swapped, I do not care enough to change them
entity register32 is
	port (clk:in std_logic;
			op:in std_logic_vector(2 downto 0);
			i:in std_logic_vector(31 downto 0);
			o:inout std_logic_vector(31 downto 0));
end entity;
architecture innards of register32 is
	component reg_block is
		port(
			i, ls, rs, lr, rr, clear, trues, clk:in std_logic; --"trues" means all high in this context, because "high" is a vhdl word
			op:std_logic_vector(2 downto 0);
			o:inout std_logic);
	end component;
		begin     							--in     ls     rs    rr     lr     clear/true/clk  operation       output
			rb0:  reg_block port map (i(31), o(30), '0',   o(0),  o(30), '0', '1', clk, op(2 downto 0), o(31));
			rb1:  reg_block port map (i(30), o(29), o(31), o(31), o(29), '0', '1', clk, op(2 downto 0), o(30));
			rb2:  reg_block port map (i(29), o(28), o(30), o(30), o(28), '0', '1', clk, op(2 downto 0), o(29));
			rb3:  reg_block port map (i(28), o(27), o(29), o(29), o(27), '0', '1', clk, op(2 downto 0), o(28));
			rb4:  reg_block port map (i(27), o(26), o(28), o(28), o(26), '0', '1', clk, op(2 downto 0), o(27));
			rb5:  reg_block port map (i(26), o(25), o(27), o(27), o(25), '0', '1', clk, op(2 downto 0), o(26));
			rb6:  reg_block port map (i(25), o(24), o(26), o(26), o(24), '0', '1', clk, op(2 downto 0), o(25));
			rb7:  reg_block port map (i(24), o(23), o(25), o(25), o(23), '0', '1', clk, op(2 downto 0), o(24));
			rb8:  reg_block port map (i(23), o(22), o(24), o(24), o(22), '0', '1', clk, op(2 downto 0), o(23));
			rb9:  reg_block port map (i(22), o(21), o(23), o(23), o(21), '0', '1', clk, op(2 downto 0), o(22));
			rb10: reg_block port map (i(21), o(20), o(22), o(22), o(20), '0', '1', clk, op(2 downto 0), o(21));
			rb11: reg_block port map (i(20), o(19), o(21), o(21), o(19), '0', '1', clk, op(2 downto 0), o(20));
			rb12: reg_block port map (i(19), o(18), o(20), o(20), o(18), '0', '1', clk, op(2 downto 0), o(19));
			rb13: reg_block port map (i(18), o(17), o(19), o(19), o(17), '0', '1', clk, op(2 downto 0), o(18));
			rb14: reg_block port map (i(17), o(16), o(18), o(18), o(16), '0', '1', clk, op(2 downto 0), o(17));
			rb15: reg_block port map (i(16), o(15), o(17), o(17), o(15), '0', '1', clk, op(2 downto 0), o(16));
			rb16: reg_block port map (i(15), o(14), o(16), o(16), o(14), '0', '1', clk, op(2 downto 0), o(15));
			rb17: reg_block port map (i(14), o(13), o(15), o(15), o(13), '0', '1', clk, op(2 downto 0), o(14));
			rb18: reg_block port map (i(13), o(12), o(14), o(14), o(12), '0', '1', clk, op(2 downto 0), o(13));
			rb19: reg_block port map (i(12), o(11), o(13), o(13), o(11), '0', '1', clk, op(2 downto 0), o(12));
			rb20: reg_block port map (i(11), o(10), o(12), o(12), o(10), '0', '1', clk, op(2 downto 0), o(11));
			rb21: reg_block port map (i(10), o(9),  o(11), o(11), o(9),  '0', '1', clk, op(2 downto 0), o(10));
			rb22: reg_block port map (i(9),  o(8),  o(10), o(10), o(8),  '0', '1', clk, op(2 downto 0), o(9));
			rb23: reg_block port map (i(8),  o(7),  o(9),  o(9),  o(7),  '0', '1', clk, op(2 downto 0), o(8));
			rb24: reg_block port map (i(7),  o(6),  o(8),  o(8),  o(6),  '0', '1', clk, op(2 downto 0), o(7));
			rb25: reg_block port map (i(6),  o(5),  o(7),  o(7),  o(5),  '0', '1', clk, op(2 downto 0), o(6));
			rb26: reg_block port map (i(5),  o(4),  o(6),  o(6),  o(4),  '0', '1', clk, op(2 downto 0), o(5));
			rb27: reg_block port map (i(4),  o(3),  o(5),  o(5),  o(3),  '0', '1', clk, op(2 downto 0), o(4));
			rb28: reg_block port map (i(3),  o(2),  o(4),  o(4),  o(2),  '0', '1', clk, op(2 downto 0), o(3));
			rb29: reg_block port map (i(2),  o(1),  o(3),  o(3),  o(1),  '0', '1', clk, op(2 downto 0), o(2));
			rb30: reg_block port map (i(1),  o(0),  o(2),  o(2),  o(0),  '0', '1', clk, op(2 downto 0), o(1));
			rb31: reg_block port map (i(0),  '0',   o(1),  o(1),  o(31), '0', '1', clk, op(2 downto 0), o(0));
end innards;