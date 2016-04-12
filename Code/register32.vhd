library IEEE;
use IEEE.std_logic_1164.all;
entity register32 is
	port (clk:in std_logic;
			op:in std_logic_vector(2 downto 0);
			i:in std_logic_vector(31 downto 0);
			o:inout std_logic_vector(31 downto 0));
end entity;
architecture innards of register32 is
	signal m1:std_logic_vector(31 downto 0); --these are needed for shifting
	signal m2:std_logic_vector(31 downto 0);
	begin	
		process(clk) begin
			if (clk'event and clk='1') then
				if op="001" then
						o(31 downto 0) <= i(31 downto 0);
						m1(31 downto 0) <= i(31 downto 0);
				elsif op="010" then --shifting to the left
					for op="010" loop
						m2(31) <= m1(30);
						m2(30) <= m1(29);
						m2(29) <= m1(28);
						m2(28) <= m1(27);
						m2(27) <= m1(26);
						m2(26) <= m1(25);
						m2(25) <= m1(24);
						m2(24) <= m1(23);
						m2(23) <= m1(22);
						m2(22) <= m1(21);
						m2(21) <= m1(20);
						m2(20) <= m1(19);
						m2(19) <= m1(18);
						m2(18) <= m1(17);
						m2(17) <= m1(16);
						m2(16) <= m1(15);
						m2(15) <= m1(14);
						m2(14) <= m1(13);
						m2(13) <= m1(12);
						m2(12) <= m1(11);
						m2(11) <= m1(10);
						m2(10) <= m1(9);
						m2(9) <= m1(8);
						m2(8) <= m1(7);
						m2(7) <= m1(6);
						m2(6) <= m1(5);
						m2(5) <= m1(4);
						m2(4) <= m1(3);
						m2(3) <= m1(2);
						m2(2) <= m1(1);
						m2(1) <= m1(0);
						m2(0) <= '0';
						o(31 downto 0) <= m2(31 downto 0);
					end loop;
				end if;

		end process;
end innards;