library ieee;
use ieee.std_logic_1164.all;


entity Reg_16_bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (15 downto 0);
dout  : out std_logic_vector (15 downto 0));
end entity;



architecture structural of Reg_16_bit is
component register_1_bit is
port (clk, we, din : in std_logic;
dout  : out std_logic);
end component;


component mux_n is
  generic (
	n	: integer
  );
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic_vector(n-1 downto 0);
	src1  :	in	std_logic_vector(n-1 downto 0);
	z	  : out std_logic_vector(n-1 downto 0)
  );
end component;

signal mux_last, dff_in, dff_out : std_logic_vector (15 downto 0);

begin


C0: mux_n generic map (n=>16)  port map(we, mux_last, din, dff_in);

G0: for i in 0 to 15 generate begin
C1: register_1_bit port map(clk, we, dff_in(i), dff_out(i));
mux_last(i) <= dff_out(i);
dout(i) <= dff_out(i);
end generate G0;
end structural;
