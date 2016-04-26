library ieee;
use ieee.std_logic_1164.all;
entity prog_count is
	port (i:in std_logic_vector(31 downto 0);
			clk: in std_logic;
			op:in std_logic;--op is increment(1) and clear(0) 
			o:inout std_logic_vector(31 downto 0));
end entity;
architecture oh_behave of prog_count is
	component register32 is
		port (clk:in std_logic;
				op:in std_logic_vector(2 downto 0);
				i:in std_logic_vector(31 downto 0);
				o:inout std_logic_vector(31 downto 0));
	end component;
	signal p:std_logic_vector(2 downto 0);
		begin
		process (op) begin
			case op is
				when '0' =>
					p<="110";
				when '1' =>
					p<="001";
				when others =>
			end case;
		end process;
	register_use: register32 port map (clk, p(2 downto 0), i(31 downto 0), o(31 downto 0));
end oh_behave;