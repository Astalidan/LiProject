library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Control_Unit is
port(	kick, clk: in std_logic;
		Fib_out: out std_logic_vector (31 downto 0));
end Control_Unit;

architecture innards of Control_Unit is

component opALU
	port (op: in std_logic_vector (2 downto 0):="ZZZ";
			a, b: in std_logic_vector (31 downto 0);
			s:out std_logic_vector (31 downto 0);
			overflow:out std_logic);
end component;

component tri_buff
    Port 
		(data_in  : in  STD_LOGIC_VECTOR (31 downto 0);
       en  : in  STD_LOGIC;
       data_out : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component register32
	port (clk:in std_logic;
			op:in std_logic_vector(2 downto 0);
			i:in std_logic_vector(31 downto 0);
			o:inout std_logic_vector(31 downto 0));
end component;

component SRAM_DATA

port (
			clk  : 		in std_logic;   
			We   :  		in std_logic;  -- write enable
			Wadd :		in std_logic_vector(6 downto 0);
			radd : 		in std_logic_vector(6 downto 0);
			data_in : 	in std_logic_vector(31 downto 0);
			data_out : 	buffer std_logic_vector(31 downto 0) );
end component;

component SRAM_INST

port (
			clk  : 		in std_logic;   
			radd : 		in std_logic_vector(6 downto 0);
			data_out : 	buffer std_logic_vector(31 downto 0) );
end component;

signal data_bus: std_logic_vector (31 downto 0);
signal tri_out_A: std_logic_vector (31 downto 0);
signal tri_out_B: std_logic_vector (31 downto 0);
signal a_out: std_logic_vector (31 downto 0);
signal b_out: std_logic_vector (31 downto 0);
signal sum: std_logic_vector (31 downto 0);
signal g_in: std_logic_vector (31 downto 0);
signal g_out: std_logic_vector (31 downto 0);
signal r_add, w_adr, r_adr: std_logic_vector (6 downto 0);
signal instructions: std_logic_vector (31 downto 0);
signal overflow, EN_A, EN_B, EN_G, W_e: std_logic;

begin

REG_A: register32 port map (clk, "001", tri_out_A, a_out);
REG_B: register32 port map (clk, "001", tri_out_B, b_out);
TRI_STATE_A: tri_buff port map (data_bus, EN_A, tri_out_A);
TRI_STATE_B: tri_buff port map (data_bus, EN_B, tri_out_B);
OPERATIONAL_ALU: opALU port map ("000", a_out, b_out, sum, overflow);
REG_G: register32 port map (clk, "001", sum, g_in);
TRI_STATE_G: tri_buff port map (g_in, EN_G, g_out); 
INSTRUCTION_SRAM: SRAM_INST port map (clk, r_add, instructions);
DATA_SRAM: SRAM_DATA port map (clk, W_e, w_adr, r_adr, g_out, data_bus);

process(EN_A, EN_B, EN_G, W_e)
begin
for i in 0 to 7 loop



EN_A <= '1';
EN_B <= '0';
W_e <= '0' after 19.99999999ns;   								--step 1 of processor

r_adr <= "(conv_std_logic_vector(i))" after 20 ns;		--step 2 of processor

EN_A <= '0';
EN_B <= '0' after 20ns;  											--step 3 of processor

r_adr <= "(conv_std_logic_vector(i+1))" after 20 ns;		--step 4 of processor

EN_A <= '0';
EN_B <= '1' after 20ns;  											--step 5 of processor

EN_G <= '1' after 20ns;  											--step 6 of processor

w_adr <= "(conv_std_logic_vector(i+2))" after 20ns;		--step 7 of processor

W_e <= '1' after 20ns;   											--step 8 of processor

EN_G <= '0' after 20ns;  											--step 9 of processor

end loop;
end process;
end innards;