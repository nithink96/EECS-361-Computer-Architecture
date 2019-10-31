library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.dffr_a;

entity stall_generate_TB is
end stall_generate_TB;

architecture behave of stall_generate_TB is
component stall_generate is
port(
clk : in std_logic;
reset : in std_logic;
opcode : in std_logic_vector(5 downto 0);
stall_signal : out std_logic
);
end component;

signal clk,reset,stall :std_logic;
signal opcode :std_logic_vector(5 downto 0);
begin
q1: stall_generate port map (clk,reset,opcode,stall);
simulate: process
begin
clk<='0';
reset<='1';
opcode<="000000";

wait for 10ns;
clk<='1';
reset<='0';
opcode<="100011";

wait for 10ns;
clk<='0';
opcode<="100011";

wait for 10ns;
clk<='1';
opcode<="000000";

wait for 10ns;
clk<='0';
opcode<="000000";

wait for 10ns;
clk<='1';
opcode<="000000";

wait for 10ns;
clk<='0';
opcode<="000000";

wait for 10ns;
clk<='1';
opcode<="000100";

wait for 10ns;
clk<='0';
opcode<="000100";

wait for 10ns;
clk<='1';
opcode<="000000";

wait for 10ns;
clk<='0';
opcode<="000000";

wait for 10ns;
wait;
end process simulate;
end behave;
