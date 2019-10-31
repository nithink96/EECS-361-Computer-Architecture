library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;

entity single_register_tb is
end single_register_tb;

architecture behave of single_register_tb is
component single_register is
     port(
     clk: in std_logic;
     reset: in std_logic;
     write_enable: in std_logic;
     data_in: in std_logic_vector(31 downto 0):= (others=>'0');
     data_out: out std_logic_vector(31 downto 0)
     );
end component;

signal clk: std_logic;
signal reset: std_logic;
signal write_enable: std_logic;
signal data_in: std_logic_vector(31 downto 0);
signal data_out: std_logic_vector(31 downto 0);

begin
portmap: single_register port map(clk,reset,write_enable,data_in,data_out);
simulate:process
begin
clk<='0';
reset<='1';
write_enable<='0';
data_in<=x"00000000";
wait for 10 ns;

clk<='1';
reset<='0';
write_enable<='1';
data_in<=x"00000000";
wait for 10 ns;

clk<='0';
data_in<=x"00000011";

wait for 10 ns; 

clk<='1';


wait for 10 ns; 

clk<='0';


wait for 10 ns;

clk<='1';

wait for 10ns; 

clk<='0';
data_in<=x"00001111";


wait for 10 ns;
clk<='1';
data_in<=x"00001111";



wait for 10 ns;
clk<='0';
write_enable<='0';
data_in<=x"11111111";
wait for 10 ns;
clk<='1';
wait for 10ns;

wait ;

end process simulate;
end behave;

