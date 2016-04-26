library IEEE;
use IEEE.std_logic_1164.all;
--use
-- op>> 1 will let the counter increment with whatever is chosen as a clock
--      0 will clear the counter
--sw>> 0 will load the 32bits from the control units
--     1 will let it count with the attached ALU32
entity test_prog is
	port(the_count:std_logic_vector(31 downto 0); --treat this as the 32 bits coming from the program counter
			clk, op, sw:in std_logic;
			not_used:out std_logic); --this is the overflow from the ALU, not needed
end entity;
architecture WOO of test_prog is
	signal add2mux:std_logic_vector(31 downto 0);
	signal mux2prog:std_logic_vector(31 downto 0);
	signal prog2add:std_logic_vector(31 downto 0);
	component ALU32 is
		port (op: in std_logic;
				a, b: in std_logic_vector (31 downto 0);
				s:out std_logic_vector (31 downto 0);
				overflow:out std_logic);
	end component;
	component prog_count is
		port (i:in std_logic_vector(31 downto 0);
				clk: in std_logic;
				op:in std_logic;--op is increment(01) and clear(00) 
				o:inout std_logic_vector(31 downto 0));
	end component;
	component parallel_mux2_1 is
	port (a, b:in std_logic_vector (31 downto 0);
			s:in std_logic;
			o:out std_logic_vector (31 downto 0));
	end component;
	begin
	adder: ALU32 port map ('0', prog2add(31 downto 0), "00000000000000000000000000001010", add2mux(31 downto 0), not_used);
	pc: prog_count port map (mux2prog(31 downto 0), clk, op, prog2add(31 downto 0));
	muxmux: parallel_mux2_1 port map (the_count(31 downto 0), add2mux(31 downto 0), sw, mux2prog(31 downto 0));
end WOO;