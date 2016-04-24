
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity SRAM_DATA is

port (
			clk  : 		in std_logic;   
			We   :  		in std_logic;  -- write enable
			Wadd :		in std_logic_vector(6 downto 0);
			radd : 		in std_logic_vector(6 downto 0);
			data_in : 	in std_logic_vector(31 downto 0);
			data_out : 	buffer std_logic_vector(31 downto 0) );
end SRAM_DATA;

architecture behavior of SRAM_DATA  is

type ram is array(127 downto 0) of std_logic_vector(31 downto 0);


signal  ram_d : ram;

begin
ram_d(0) <= "00000000000000000000000000000000";
		process(clk, we)
			begin
				if clk'event and clk = '1' then
						if  we = '1' then
							ram_d(conv_integer(wadd)) <= data_in;
						else
					     data_out <= ram_d(conv_integer(radd));
						ram_d(0) <= X"AAAAFFFF";
					end if;
				end if;
		end process;

end behavior;