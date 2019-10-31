--data memory
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.eecs361_gates.all;
use work.sram;

library work;
use work.all;

entity data_memory is
generic (data_mem_file: string );
port(
      data_in   : in std_logic_vector(31 downto 0);
	  addr      : in std_logic_vector(31 downto 0):= X"00400020";
	  we        : in std_logic;
	  data_out  : out std_logic_vector(31 downto 0):=(others=>'0')
      
);
end data_memory;

architecture structural of data_memory is
--signal clk_n : std_logic;
signal temp_data_out: std_logic_vector (31 downto 0);

component sram
generic (
	mem_file : string
  );
  port (
	cs	  : in	std_logic; --chip inactive when set to 0 
	oe	  :	in	std_logic; --output enable
	we	  :	in	std_logic; --write enable
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
	dout  :	out std_logic_vector(31 downto 0)
  );
end component;

component not_gate is
port(x : in std_logic;
     z :out std_logic);
end component; 

begin
--clk_inv : not_gate port map(x => clk, z => clk_n);
sram_map: sram 
generic map(mem_file => data_mem_file)
port map(
		  cs => '1',
		  oe => '1',
		  we => we,
		  addr => addr,
		  din => data_in,
		  dout => temp_data_out);

data_out<=temp_data_out;
		  
end structural;
		  
