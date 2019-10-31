library ieee;
use ieee.std_logic_1164.all;
library work;
use work.all;

entity datapath_tb_sort_correct_branch is
end entity;

architecture behavioral of datapath_tb_sort_correct_branch is

signal clk, reset, hold: std_logic; 

component datapath is
generic(mem_file: string);
port(
		clk: in std_logic;
		reset: in std_logic
		);
end component datapath;

begin
	DP: datapath generic map(mem_file=>"bills_branch.dat") 
                     port map (clk=>clk, reset=>reset);

	test:process is
	begin
		reset<='0';
		hold <='0';
					clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;
	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;	clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

			clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;

clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;


clk<='1';
			wait for 10 ns;
			clk<= '0';
			wait for 10 ns;
wait;

	end process test;


end architecture behavioral;
