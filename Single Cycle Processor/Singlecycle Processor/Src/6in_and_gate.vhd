library ieee;
use ieee.std_logic_1164.all;

entity six_in_and_gate is

  port (
    u   : in  std_logic;
    v   : in  std_logic;
    w   : in  std_logic;
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end six_in_and_gate;

architecture structural of six_in_and_gate is
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
signal uvandw,xyandz: std_logic;
begin

l0: three_in_and_gate port map(u,v,w,uvandw);
l1: three_in_and_gate port map(x,y,z,xyandz);
l2: and_gate port map(uvandw,xyandz,f);

end structural;