library ieee;
use ieee.std_logic_1164.all;

entity Reg_16_bit_TB is
end Reg_16_bit_TB;

architecture structural of Reg_16_bit_TB is
component Reg_16_bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (15 downto 0);
dout  : out std_logic_vector (15 downto 0));
end component;

signal we_tb, clk_tb : std_logic;
signal din_tb, dout_tb :std_logic_vector(15 downto 0);

begin
dut: Reg_16_bit 
port map(clk_tb, we_tb, din_tb, dout_tb);

testbench: process
begin 

clk_tb <= '0';
we_tb <= '1';
din_tb <= x"0011";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <= '0';
we_tb <= '1';
din_tb <=x"0111";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;

clk_tb <= '0';
we_tb <= '0';
din_tb <= x"0001";
wait for 1 ns;
clk_tb <= '1';
wait for 1 ns;
wait;

end process;
end structural;
