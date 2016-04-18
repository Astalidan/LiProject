LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY Program_Counter IS
PORT(input				: IN  std_logic_vector(31 downto 0);
     clk,Increment,Strobe,Enable	: IN  std_logic;
     output				: OUT std_logic_vector(31 downto 0));
END Program_Counter;

ARCHITECTURE A OF Program_Counter IS
signal p    :std_logic_vector(31 downto 0);
signal temp :std_logic_vector(2 downto 0);
BEGIN
 PROCESS(clk)
 BEGIN
 temp <=  Increment & Strobe & Enable ;
  if(clk'event and clk = '1')
  then
   CASE temp IS
   WHEN "000" => output <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
   WHEN "001" => output <= p;
   WHEN "010" => p <= input; output <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
   WHEN "011" => p <= input; output <= p;

   WHEN "100" => p <= p + "0000000000000000000001";output <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
   WHEN "101" => p <= p + "0000000000000000000001";output <= p;
   WHEN "110" => p <= input;   output <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
   WHEN "111" => p <= input;   output <= p;

   WHEN OTHERS => output <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
   END CASE;
  END if;
 END PROCESS;
END A;
