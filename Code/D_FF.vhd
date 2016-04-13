library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
   port(
		clk,d : in std_logic;
		q : out std_logic);
end entity;
architecture innards of D_FF is
	begin
		process (clk) is begin
			if rising_edge(clk) then  
				q <= d;
			end if;
		end process;
end innards;
