library ieee;
use ieee.std_logic_1164.all;

entity four_in_and_gate is

  port (
    w   : in  std_logic;
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end four_in_and_gate;

architecture structural of four_in_and_gate is
component and_gate is 
     port (
       x   : in  std_logic;
       y   : in  std_logic;
       z   : out std_logic
);
end component;
signal wandx:std_logic;
signal yandz:std_logic;
begin

l1: and_gate port map(w,x,wandx);
l2: and_gate port map(y,z,yandz);
l3: and_gate port map(wandx,yandz,f);

end architecture structural;