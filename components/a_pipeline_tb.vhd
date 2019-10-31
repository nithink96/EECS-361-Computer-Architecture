library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity A_pipeline_tb is
end A_pipeline_tb;

architecture structural of A_pipeline_tb is

--constant mem_file: string:= "unsigned_sum.dat";
--constant mem_file: string:= "bills_branch.dat";
--constant mem_file: string:= "exe_forwarding.dat";
--constant mem_file: string:= "mem_forwarding.dat";
constant mem_file: string:= "sort_corrected_branch.dat";

component A_pipeline_datapath is
generic(mem_file:string);
port(
clk: in std_logic;
reset: in std_logic;
start: in std_logic
);
end component;


signal clk,reset, hold, start: std_logic;

constant clk_period:time := 2 ns;

begin
	PD: A_pipeline_datapath generic map( mem_file => mem_file ) port map(clk, reset,start);

	process is
	 begin
	 hold<='0';
	 reset<='1'; wait for clk_period; reset<='0';
 	 start<='1'; wait for 1 ns; start<='0';
		wait for 1000 ns;
		hold<= '1';
		wait;
	end process;

	process is
	begin
		if(hold = '1') then
			wait;
		else
			clk<= '0';
			wait for clk_period;
			clk<='1';
			wait for clk_period;
		end if;
	end process;
end architecture structural;
