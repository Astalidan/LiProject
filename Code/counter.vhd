library ieee;
use ieee.std_logic_1164.all;


entity fulladder is
  port( c_in:   in  std_logic;
        a, b:   in  std_logic; 
        c_out:  out std_logic; 
        sum:    out std_logic);
    end fulladder;
    
    architecture Behavioral of fulladder is
    begin
      sum  <= ((a xor b) xor c_in);
      c_out <= (((a xor b) and c_in) or (a and b));
    end Behavioral;
    
    LIBRARY ieee;
    USE ieee.std_logic_1164.all;
    
    ENTITY four_bit_adder IS
      PORT(
          C0, A1, B1, A2, B2, A3, B3, A4, B4: IN std_logic;
          C4, S0, S1, S2, S3: OUT std_logic);
        END four_bit_adder;
    ARCHITECTURE behavioral OF four_bit_adder IS
      signal C1, C2, C3:std_logic;
        Component full_adder
        port(
        a, b, c_in:in  std_logic; 
        sum, c_out:out std_logic);
      end component;
      
      BEGIN
      F1:full_adder port map(A1, B1, C0, S0, C1);
      F2:full_adder port map(A2, B2, C1, S1, C2);
      F3:full_adder port map(A3, B3, C2, S2, C3);
      F4:full_adder port map(A4, B4, C3, S3, C4); 
    end behavioral;
        
          
          
    
    
       
