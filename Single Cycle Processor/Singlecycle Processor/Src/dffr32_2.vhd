library ieee;
use ieee.std_logic_1164.all;

entity dffr32_2 is
  port (
	clk	: in  std_logic;
	d	: in  std_logic_vector(31 downto 0):= (others=>'0');
	q	: out std_logic_vector(31 downto 0):= (others=>'0')
  );
end dffr32_2;

architecture behavioral of dffr32_2 is
begin
  proc : process (clk)
  begin
	if rising_edge(clk) then
	  q <= d;
	end if;
  end process;
end behavioral;
