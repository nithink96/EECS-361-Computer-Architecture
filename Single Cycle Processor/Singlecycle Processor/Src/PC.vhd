library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity PC is 
port(
	nextAddress: in std_logic_vector(31 downto 0):=X"00400020";
	currAddress: out std_logic_vector(31 downto 0):= X"00400020";
	clk: in std_logic
	);
end entity PC;
architecture structural of PC is 

component dffr32 is
  port (
	clk	: in  std_logic;
	d	: in  std_logic_vector(31 downto 0);
	q	: out std_logic_vector(31 downto 0)
  );
end component;

begin
flipFlop: dffr32 port map(clk=>clk, d=>nextAddress,q=>currAddress);


end architecture structural;
