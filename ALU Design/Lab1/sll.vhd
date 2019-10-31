library ieee;
use ieee.std_logic_1164.all;

entity shiftleftl is
    port(
        a      : in std_logic_vector(31 downto 0);
        b      : in natural;
        result : out std_logic_vector(31 downto 0)
    );
end shiftleftl;

architecture structure of shiftleftl is
--signal s:in std_logic_vector(31 downto 0);
constant shifts:natural:=b;
    subtype datawidth is std_logic_vector(31 downto 0);
type  data is array (shifts downto 0) of datawidth;
signal res_temp: data;

begin
	res_temp(0) <= a(30 downto 0) & '0';
	l1:for i in 1 to shifts GENERATE
	res_temp(i)<=res_temp(i-1)(31 downto 1)&'0';
	end GENERATE;
result<=res_temp(shifts);
end architecture structure;

