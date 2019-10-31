library ieee;
use ieee.std_logic_1164.all;

entity five_in_and_gate is

  port (
    v   : in  std_logic;
    w   : in std_logic;
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end five_in_and_gate;

architecture structural of five_in_and_gate is
component and_gate is 
     port (
       x   : in  std_logic;
       y   : in  std_logic;
       z   : out std_logic
);
end component;
component three_in_and_gate is

  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end component;
signal vandw,xandy: std_logic;
begin

l0: and_gate port map(v,w,vandw);
l1: and_gate port map(x,y,xandy);
l2: three_in_and_gate port map(vandw,z,xandy,f);

end architecture structural;