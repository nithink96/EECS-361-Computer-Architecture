library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity data_mem is 
generic (data_mem_file: string );
port(
clk, MemWr, output_en: in std_logic;
data_in, address: in std_logic_vector(31 downto 0);
data_out: out std_logic_vector(31 downto 0));
end data_mem;

architecture structural of data_mem is 
--component syncram is
--  generic (
--	mem_file : string
--  );
--  port (
--    clk   : in  std_logic;
--	cs	  : in	std_logic;
--	oe	  :	in	std_logic;
--	we	  :	in	std_logic;
--	addr  : in	std_logic_vector(31 downto 0);
--	din	  :	in	std_logic_vector(31 downto 0);
--	dout  :	out std_logic_vector(31 downto 0)
--  );
--end component;
component syncram is
  generic (
	mem_file : string
  );
  port (
    clk   : in  std_logic;
	cs	  : in	std_logic;
	oe	  :	in	std_logic;
	we	  :	in	std_logic;
	addr  : in	std_logic_vector(31 downto 0);
	din	  :	in	std_logic_vector(31 downto 0);
	dout  :	out std_logic_vector(31 downto 0)
  );
end component;


begin
	--mem: syncram generic map ("bills_branch.dat") port map (clk, '1', output_en, MemWr, address, data_in, data_out);
	--mem: syncram generic map ("unsigned_sum.dat") port map (clk,'1', output_en, MemWr, address, data_in, data_out);
	mem: syncram generic map(mem_file => data_mem_file) port map (clk,'1', output_en, MemWr, address, data_in, data_out);
end structural;