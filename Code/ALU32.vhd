library ieee;
use ieee.std_logic_1164.all;
-- this is the 32 bit ALU for the project
entity ALU32 is
	port (op: in std_logic; -- 0 adds, 1 subtracts
			a, b: in std_logic_vector (31 downto 0);
			s:out std_logic_vector (31 downto 0);
			overflow:out std_logic);
end entity;
architecture guts of ALU32 is
	component addsub_block
			port (op, a, b, c_in:in std_logic;
			c_out, s:out std_logic);
	end component;
	signal carry: std_logic_vector (31 downto 0);
	begin overflow <= carry(0) XOR carry(1);
		fa0: addsub_block port map (op, a(0), b(0), op, carry(31), s(0));
		fa1: addsub_block port map (op, a(1), b(1), carry(31), carry(30), s(1));
		fa2: addsub_block port map (op, a(2), b(2), carry(30), carry(29), s(2));
		fa3: addsub_block port map (op, a(3), b(3), carry(29), carry(28), s(3));
		fa4: addsub_block port map (op, a(4), b(4), carry(28), carry(27), s(4));
		fa5: addsub_block port map (op, a(5), b(5), carry(27), carry(26), s(5));
		fa6: addsub_block port map (op, a(6), b(6), carry(26), carry(25), s(6));
		fa7: addsub_block port map (op, a(7), b(7), carry(25), carry(24), s(7));
		fa8: addsub_block port map (op, a(8), b(8), carry(24), carry(23), s(8));
		fa9: addsub_block port map (op, a(9), b(9), carry(23), carry(22), s(9));
		fa10: addsub_block port map (op, a(10), b(10), carry(22), carry(21), s(10));
		fa11: addsub_block port map (op, a(11), b(11), carry(21), carry(20), s(11));
		fa12: addsub_block port map (op, a(12), b(12), carry(20), carry(19), s(12));
		fa13: addsub_block port map (op, a(13), b(13), carry(19), carry(18), s(13));
		fa14: addsub_block port map (op, a(14), b(14), carry(18), carry(17), s(14));
		fa15: addsub_block port map (op, a(15), b(15), carry(17), carry(16), s(15));
		fa16: addsub_block port map (op, a(16), b(16), carry(16), carry(15), s(16));
		fa17: addsub_block port map (op, a(17), b(17), carry(15), carry(14), s(17));
		fa18: addsub_block port map (op, a(18), b(18), carry(14), carry(13), s(18));
		fa19: addsub_block port map (op, a(19), b(19), carry(13), carry(12), s(19));
		fa20: addsub_block port map (op, a(20), b(20), carry(12), carry(11), s(20));
		fa21: addsub_block port map (op, a(21), b(21), carry(11), carry(10), s(21));
		fa22: addsub_block port map (op, a(22), b(22), carry(10), carry(9), s(22));
		fa23: addsub_block port map (op, a(23), b(23), carry(9), carry(8), s(23));
		fa24: addsub_block port map (op, a(24), b(24), carry(8), carry(7), s(24));
		fa25: addsub_block port map (op, a(25), b(25), carry(7), carry(6), s(25));
		fa26: addsub_block port map (op, a(26), b(26), carry(6), carry(5), s(26));
		fa27: addsub_block port map (op, a(27), b(27), carry(5), carry(4), s(27));
		fa28: addsub_block port map (op, a(28), b(28), carry(4), carry(3), s(28));
		fa29: addsub_block port map (op, a(29), b(29), carry(3), carry(2), s(29));
		fa30: addsub_block port map (op, a(30), b(30), carry(2), carry(1), s(30));
		fa31: addsub_block port map (op, a(31), b(31), carry(1), carry(0), s(31));
end guts;
