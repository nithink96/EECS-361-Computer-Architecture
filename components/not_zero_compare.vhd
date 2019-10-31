library ieee;
use ieee.std_logic_1164.all;
--use work.eecs361.all;
--use work.eecs361_gates.all;
use work.all;

entity not_zero_compare is
	port (a: in std_logic_vector( 4 downto 0);
	      b: out std_logic
	);
end entity not_zero_compare;


architecture structural of not_zero_compare is
signal t0,t1,t2,t3,t4:std_logic;

component not_gate is
  port (
    x   : in  std_logic;
    z   : out std_logic
  );
end component;
component or_gate is
  port (
    x   : in  std_logic;
    y : in std_logic;
    z   : out std_logic
  );
end component;

begin
	o1: or_gate port map(a(0), a(1), t0);
	o2: or_gate port map(a(2), t0, t1);
	o3: or_gate port map(a(3), t1, t2 );
	o4: or_gate port map(a(4), t2, b);


end structural;