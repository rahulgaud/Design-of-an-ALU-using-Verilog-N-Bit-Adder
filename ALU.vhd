library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ALU is
port (
A: in std_logic_vector(5 downto 0); -- A data input of the 16-bit ALU
B: in std_logic_vector(5 downto 0); -- B data input of the 16-bit ALU
ctrl: in std_logic_vector(3 downto 0); -- ALUctrl control input of the 16-bit ALU
y: out std_logic_vector(5 downto 0) -- 6-bit data output of the 16-bit ALU
);
end ALU;
architecture Behavioral of ALU is
-- N-bit Adder in Verilog
component N_bit_adder is
generic (
N: integer:=32
);
port( i1: in std_logic_vector(N-1 downto 0);
i2: in std_logic_vector(N-1 downto 0);
y: out std_logic_vector(N-1 downto 0)
);
end component N_bit_adder;
signal BB: std_logic_vector(6-1 downto 0);
signal out1: std_logic_vector(6-1 downto 0);
signal out2: std_logic_vector(6-1 downto 0);
signal tmp: std_logic_vector(6-1 downto 0);
begin
u1_N_bit_adder: N_bit_adder generic map ( N => 6)
port map( i1 => A, i2 => B,y => out1 );
u2_N_bit_adder: N_bit_adder generic map ( N => 6)
port map( i1 => A, i2 => BB,y => out2 );
u3_N_bit_adder: N_bit_adder generic map ( N => 6)
port map( i1 => out2, i2 => b"000001",y => tmp );
BB <= not B;
process(ctrl,A,B,out1,tmp)
begin
case(ctrl) is
when "0000" => y <= out1; -- ADD
when "0001" => y <= tmp ;-- SUB
when "0010" => y <= A and B; -- AND
when "0011" => y <= A or B; -- OR
when "0100" => y <= A xor B; -- XOR
when "0101" => y <= not A; -- NOT A
when "0110" => y <= A; -- MOVE
when "0111" => y <= not B; -- NOT B
when others => y <= out1;
end case;
end process;
end Behavioral;