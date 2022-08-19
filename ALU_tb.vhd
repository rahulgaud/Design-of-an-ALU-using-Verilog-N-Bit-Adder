library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_alu is
-- Port ( );
end tb_alu;
architecture Behavioral of tb_alu is
component ALU is
port (
A: in std_logic_vector(5 downto 0);
B: in std_logic_vector(5 downto 0);
ctrl: in std_logic_vector(3 downto 0);
y: out std_logic_vector(5 downto 0)
);
end component;
signal A : std_logic_vector(5 downto 0) := (others => '0');
signal B : std_logic_vector(5 downto 0) := (others => '0');
signal ctrl : std_logic_vector(3 downto 0) := (others => '0');
signal y : std_logic_vector(5 downto 0);
begin
uut: ALU PORT MAP ( A => A, B => B,ctrl => ctrl, y => y );
process
begin
A<="001100";
B<="010101";
ctrl<="0001" ;
wait for 10ns;
A<="111100";
B<="010111";
ctrl<="0010" ;
wait for 10ns;
A<="001100";
B<="010101";
ctrl<="0011" ;
wait for 10ns;
A<="001100";
B<="010101";
ctrl<="0100" ;
wait for 10ns;
A<="001100";
B<="010101";
ctrl<="0101" ;
wait for 10ns;
A<="001100";
B<="010101";
ctrl<="0110" ;
wait for 10ns;
A<="001100";
B<="010101";
ctrl<="0000" ;
wait for 10ns;
end process;
end Behavioral;