library ieee;
use ieee.std_logic_1164.all;
--this is the operation ALU for the CPU
entity opalu_debug is
	port (op: in std_logic_vector (2 downto 0);
			a, b: in std_logic_vector (31 downto 0);
			s:out std_logic_vector (31 downto 0);
			overflow:out std_logic);
end entity;
architecture gibblets of opalu_debug is
	component ALU32
		port (op: in std_logic;
				a, b: in std_logic_vector (31 downto 0);
				s:out std_logic_vector (31 downto 0);
				overflow:out std_logic);
	end component;
	signal add, subt:std_logic_vector (31 downto 0);
	signal add_overflow, subt_overflow:std_logic;
		begin
			addition: ALU32 port map ('0', a(31 downto 0), b(31 downto 0), add(31 downto 0), add_overflow);
			subtraction: ALU32 port map ('1', a(31 downto 0), b(31 downto 0), subt(31 downto 0), subt_overflow);
			process(op) begin
				if op="000" then
					s(31 downto 0) <= add(31 downto 0);
					overflow <= add_overflow;
				elsif op="001" then
					s(31 downto 0) <= subt(31 downto 0);
					overflow <= subt_overflow;
				elsif op="010" then
					s(31 downto 0) <= a(31 downto 0) AND b(31 downto 0);
					overflow <= '0';
				elsif op="011" then
					s(31 downto 0) <= a(31 downto 0) OR b(31 downto 0);
					overflow <= '0';
				elsif op="100" then
					s(31 downto 0) <= a(31 downto 0) XOR b(31 downto 0);
					overflow <= '0';
				elsif op="101" then
					s(31 downto 0) <= a(31 downto 0) NAND b(31 downto 0);
					overflow <= '0';
				elsif op="110" then
					s(31 downto 0) <= a(31 downto 0) NOR b(31 downto 0);
					overflow <= '0';
				elsif op="111" then
					s(31 downto 0) <= a(31 downto 0) XNOR b(31 downto 0);
					overflow <= '0';
				end if;
				end process;
end gibblets;