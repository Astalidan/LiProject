library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Control_Unit is
port(	clk: in std_logic;
		choose_register: std_logic_vector(6 downto 0);
		Fib_out: out std_logic_vector (31 downto 0));
end Control_Unit;

architecture innards of Control_Unit is

component ALU32 is
port (op: in std_logic;
			a, b: in std_logic_vector (31 downto 0);
			s:out std_logic_vector (31 downto 0);
			overflow:out std_logic);
end component;

component tri_buff
    Port 
		(i  : in  STD_LOGIC_VECTOR (31 downto 0);
       en  : in  STD_LOGIC;
       o : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component register32
	port (clk:in std_logic;
			op:in std_logic_vector(2 downto 0);
			i:in std_logic_vector(31 downto 0);
			o:inout std_logic_vector(31 downto 0));
end component;

component SRAM_DATA

port (
			clk: 						in std_logic;   
			we:  						in std_logic;  -- write enable
			wadd,radd:				in std_logic_vector(6 downto 0);
			data_in, data_out: 	buffer std_logic_vector(31 downto 0) );
end component;

component SRAM_INST

port (
			clk  : 		in std_logic;   
			radd : 		in std_logic_vector(6 downto 0);
			data_out : 	out std_logic_vector(31 downto 0) );
end component;

signal data_bus: std_logic_vector (31 downto 0);
signal tri_out_a: std_logic_vector (31 downto 0);
signal tri_out_b: std_logic_vector (31 downto 0);
signal a_out: std_logic_vector (31 downto 0);
signal b_out: std_logic_vector (31 downto 0);
signal sum: std_logic_vector (31 downto 0);
signal g_in: std_logic_vector (31 downto 0);
signal g_out: std_logic_vector (31 downto 0);
signal w_adr, r_adr: std_logic_vector (6 downto 0);
signal r_add: std_logic_vector (6 downto 0) := "0000000";
signal instructions: std_logic_vector (31 downto 0);
signal overflow, EN_A, EN_B, EN_G, w_e: std_logic := '0';
constant k: integer := 7;

begin

TRI_STATE_A: tri_buff port map (data_bus, EN_A, tri_out_a);
TRI_STATE_B: tri_buff port map (data_bus, EN_B, tri_out_b);

REG_A: register32 port map (clk, "001", tri_out_a, a_out);
REG_B: register32 port map (clk, "001", tri_out_b, b_out);

OPERATIONAL_ALU: ALU32 port map ('0', a_out, b_out, sum, overflow);

REG_G: register32 port map (clk, "001", sum, g_in);
TRI_STATE_G: tri_buff port map (g_in, EN_G, g_out);

INSTRUCTION_SRAM: SRAM_INST port map (clk, r_add, instructions);
DATA_SRAM: SRAM_DATA port map (clk, w_e, w_adr, r_adr, g_out, data_bus);

process(EN_A, EN_B, EN_G, w_e, r_add)
 begin

r_add <= conv_std_logic_vector(0,7);							--step 1 of processor

EN_A <= '1';
EN_B <= '0';
w_e <= '0' after 19.99 ns;   								--step 2 of processor


r_adr	<= instructions(31 downto 25)		after 20 ns;			--step 3 of processor

EN_A <= '0';
EN_B <= '0' after 20 ns;  											--step 4 of processor

r_adr <= instructions(24 downto 18)		 after 20 ns;		--step 5 of processor

EN_A <= '0';
EN_B <= '1' after 20 ns;  											--step 6 of processor

EN_G <= '1' after 20 ns;  											--step 7 of processor

w_adr <= instructions(17 downto 11) after 20 ns;			--step 8 of processor

W_e <= '1' after 20 ns;   											--step 9 of processor

EN_G <= '0' after 20 ns;  											--step 10 of processor


fib_out <= g_out;
r_adr <= choose_register;
end process;
end innards;