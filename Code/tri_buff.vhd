library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tri_buff is --the tristate buffer
    Port 
		(i  : in  STD_LOGIC_VECTOR (31 downto 0);
       en  : in  STD_LOGIC;
       o : out STD_LOGIC_VECTOR (31 downto 0));
end entity;
architecture habits of tri_buff is
	begin
		with en select -- I always thought high impedance was denoted with x's, i was wrong, use z's
		o(31 downto 0) <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ" when '0', --high impedance
		i(31 downto 0) when others; --passing the input to the control unit bus
end habits;
