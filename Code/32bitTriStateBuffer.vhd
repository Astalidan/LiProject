library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tristate_buffer is
    Port ( IN32  : in  STD_LOGIC_VECTOR (31 downto 0);
           EN32  : in  STD_LOGIC;
           OUT32 : out STD_LOGIC_VECTOR (31 downto 0));
end tristate_buffer;

architecture Behavioral of tristate_buffer is

begin
    -- 32 input/output active low enabled tri-state buffer
    OUT32 <= IN32 when (EN32 = '0') else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

end Behavioral;
--Failed to compile, says error with top level design is undefined
