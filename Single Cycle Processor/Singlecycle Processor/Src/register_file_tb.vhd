library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;

entity register_file_tb is
end register_file_tb;

architecture behave of register_file_tb is
component register_file is
     port(
	 clk: in std_logic;
	 reset: in std_logic;
	 write_enable: in std_logic;
	 Ra : in std_logic_vector(4 downto 0);
	 Rb : in std_logic_vector(4 downto 0);
	 Rw : in std_logic_vector(4 downto 0);
         data_in: in std_logic_vector(31 downto 0);
         outA: out std_logic_vector(31 downto 0);
	 outB: out std_logic_vector(31 downto 0));
end component;

signal clk: std_logic;
signal reset: std_logic;
signal write_enable: std_logic;
signal Ra : std_logic_vector(4 downto 0);
signal Rb : std_logic_vector(4 downto 0);
signal Rw : std_logic_vector(4 downto 0);
signal data_in: std_logic_vector(31 downto 0);
signal outputA: std_logic_vector(31 downto 0);
signal outputB: std_logic_vector(31 downto 0);

begin
portmap: register_file port map(clk,reset,write_enable,Ra,Rb,Rw,data_in,outputA,outputB);
simulate:process
begin
clk<='0';
reset<='1';
write_enable<='0';
Ra<="00000";
Rb<="00000";
Rw<="00000";
data_in<=x"00000000";
wait for 10 ns;

clk<='1';
reset<='0';
write_enable<='1';
Rw<="00001";
data_in<=x"00000011";
wait for 10 ns;

clk<='0';


wait for 10 ns; --write in reg1


Ra<="00000";
Rb<="00000";

wait for 10 ns; --read reg1

clk<='1';

Rb<="00111";
Rw<="00111";
wait for 10ns;

clk<='0';

wait for 10ns; --write in reg3

clk<='0';

write_enable<='0';

Rb<="00011";--read reg3

wait for 10 ns;

write_enable<='1';
Ra<= "00000";
Rb<= "00000";
Rw<= "00101";
clk<= '1';
data_in<=(others=>'0');
wait for 10 ns;
clk<='0';
wait for 10 ns;

wait ;

end process simulate;
end behave;

