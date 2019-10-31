library ieee;
use ieee.std_logic_1164.all;
--use work.eecs361.all;
--use work.eecs361_gates.all;
use work.all;

entity equality_checker is
	port (a,b: in std_logic_vector( 4 downto 0);
		  c: out std_logic
	);
end entity equality_checker;

architecture structural of equality_checker is

signal s0,s1,s2:std_logic;
signal t0,t1,t2,t3,t4:std_logic;

component xnor_gate is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;

component and_gate is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;



begin
	x0: xnor_gate port map(a(0), b(0), t0);
	x1: xnor_gate port map(a(1), b(1), t1);
	x2: xnor_gate port map(a(2), b(2), t2);
	x3: xnor_gate port map(a(3), b(3), t3);
	x4: xnor_gate port map(a(4), b(4), t4);

	a0: and_gate port map(t0,t1,s0);
	a1: and_gate port map(t2, s0, s1);
	a2: and_gate port map(t3, s1, s2);
	a3: and_gate port map(t4, s2, c);
end architecture structural;