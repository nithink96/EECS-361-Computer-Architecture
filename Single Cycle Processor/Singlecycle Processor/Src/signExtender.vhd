library IEEE;
use IEEE.std_logic_1164.all;
library work;
use work.all;

entity signExtender is
	port(
		A: in std_logic_vector(15 downto 0);
		B: out std_logic_vector(31 downto 0)
		);
end entity;

architecture structural of signExtender is
component and_gate is
	  port (
	    x   : in  std_logic;
	    y   : in  std_logic;
	    z   : out std_logic
	  );
	end component;

	component or_gate is
	  port (
	    x   : in  std_logic;
	    y   : in  std_logic;
	    z   : out std_logic
	  );
	end component;
	
begin
	gen15: for i in 0 to 15 generate
		andX: and_gate port map(A(i), '1',B(i) );
	end generate gen15;

	gen32: for i in 16 to 31 generate
		orX: or_gate port map(A(15), '0',B(i));
	end generate gen32;

end architecture structural;
