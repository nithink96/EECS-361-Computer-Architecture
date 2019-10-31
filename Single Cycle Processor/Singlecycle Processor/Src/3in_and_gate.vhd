library ieee;
use ieee.std_logic_1164.all;

entity three_in_and_gate is

  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end three_in_and_gate;

architecture structural of three_in_and_gate is
component and_gate is 
     port (
       x   : in  std_logic;
       y   : in  std_logic;
       z   : out std_logic
);
end component;
signal xandy:std_logic;
begin

l1: and_gate port map(x,y,xandy);
l2: and_gate port map(z,xandy,f);

end architecture structural;