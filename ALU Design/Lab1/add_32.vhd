
library ieee;
use ieee.std_logic_1164.all;

entity add_32 is
  port (
    a          : in  std_logic_vector (31 downto 0);
    b          : in  std_logic_vector (31 downto 0);
    carryin    : in  std_logic;
    result     : out std_logic_vector (31 downto 0);
    carryout   : out std_logic;
    overflow   : out std_logic
  );
end add_32;
architecture structure of add_32 is
signal cin_temp : std_logic_vector(31 downto 0);
component add 
  port (
    a          : in  std_logic;
    b          : in  std_logic;
    carryin    : in  std_logic;
    result     : out std_logic;
    carryout   : out std_logic;
overflow: out std_logic
  );
  end component; 
  component xor_gate
      port (
        x   : in  std_logic;
        y   : in  std_logic;
        z   : out std_logic
      );
    end component;
begin
	
	--cin_temp(0) <= carryin;
	l0: add port map(a(0),b(0),carryin,result(0),cin_temp(0));
	addn:for i in 1 to 31 GENERATE
	l1:add port map(a(i),b(i),cin_temp(i-1),result(i),cin_temp(i));
	end GENERATE;
	ovrflw : xor_gate port map(cin_temp(29),cin_temp(30),overflow);
	carryout<= cin_temp(31);
end architecture structure;