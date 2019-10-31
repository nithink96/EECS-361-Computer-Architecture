library ieee;
use ieee.std_logic_1164.all;

entity dffr32 is
  port (
	clk	: in  std_logic;
	d	: in  std_logic_vector(31 downto 0);
	q	: out std_logic_vector(31 downto 0):=X"00400020"
  );
end dffr32;

architecture behavioral of dffr32 is
begin
  proc : process (clk)
  begin
	if rising_edge(clk) then
	  q <= d;
	end if;
  end process;
end behavioral;
