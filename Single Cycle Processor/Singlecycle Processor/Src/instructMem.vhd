library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity instructMem is
generic (
		mem_file : string
	  );
port(
		address: in std_logic_vector(31 downto 0):= X"00400020";
		instruction: out std_logic_vector(31 downto 0)
	);
end instructMem;


architecture structural of instructMem is
	component sram is
	  generic (
		mem_file : string
	  );
	  port (
		cs	  : in	std_logic;
		oe	  :	in	std_logic;
		we	  :	in	std_logic;
		addr  : in	std_logic_vector(31 downto 0);
		din	  :	in	std_logic_vector(31 downto 0);
		dout  :	out std_logic_vector(31 downto 0)
	  );
	end component sram;
begin
	romMem: sram generic map(mem_file=>mem_file)
		port map(
			cs=>'1',
			oe=>'1',
			we=> '0',
			addr=> address,
			din=>(others=>'0'),
			dout=>instruction
			);

end structural;
