library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;

entity zeroDetector is
	port( a: in std_logic_vector (31 downto 0);
  		b: out std_logic);
end entity zeroDetector;

architecture structural of zeroDetector is
signal o1, o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,o22,o23,o24,o25,o26,o27,o28,o29,o30, o31: std_logic;

component or_gate is
	  port (
	    x   : in  std_logic;
	    y   : in  std_logic;
	    z   : out std_logic
	  );
	end component;

	component not_gate is
	  port (
	    x   : in  std_logic;
	    z   : out std_logic
	  );
	end component;
--Or every bit of the input togther and then not them
-- not( a(0) or a(1) or a(2) ..... a(31) )
begin
	or1: or_gate port map(a(0), a(1), o1);
	or2: or_gate port map(o1, a(2), o2);
	or3: or_gate port map(o2, a(3), o3);
	or4: or_gate port map(o3, a(4), o4);
	or5: or_gate port map(o4, a(5), o5);
	or6: or_gate port map(o5, a(6), o6);
	or7: or_gate port map(o6, a(7), o7);
	or8: or_gate port map(o7, a(8), o8);
	or9: or_gate port map(o8, a(9), o9);
	or10: or_gate port map(o9, a(10), o10);
	or11: or_gate port map(o10, a(11), o11);
	or12: or_gate port map(o11, a(12), o12);
	or13: or_gate port map(o12, a(13), o13);
	or14: or_gate port map(o13, a(14), o14);
	or15: or_gate port map(o14, a(15), o15);
	or16: or_gate port map(o15, a(16), o16);
	or17: or_gate port map(o16, a(17), o17);
	or18: or_gate port map(o17, a(18), o18);
	or19: or_gate port map(o18, a(19), o19);
	or20: or_gate port map(o19, a(20), o20);
	or21: or_gate port map(o20, a(21), o21);
	or22: or_gate port map(o21, a(22), o22);
	or23: or_gate port map(o22, a(23), o23);
	or24: or_gate port map(o23, a(24), o24);
	or25: or_gate port map(o24, a(25), o25);
	or26: or_gate port map(o25, a(26), o26);
	or27: or_gate port map(o26, a(27), o27);
	or28: or_gate port map(o27, a(28), o28);
	or29: or_gate port map(o28, a(29), o29);
	or30: or_gate port map(o29, a(30), o30);
	or31: or_gate port map(o30, a(31), o31);

	not1: not_gate port map(o31, b);


end architecture structural;
