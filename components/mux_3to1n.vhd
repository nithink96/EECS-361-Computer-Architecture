library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.mux_n;

entity mux_3to1_n is
  generic (
	n	: integer
  );
  port (
	sel0	  : in	std_logic;
	sel1	  : in	std_logic;
	src0  :	in	std_logic_vector(n-1 downto 0);
	src1  :	in	std_logic_vector(n-1 downto 0);
	src2  :	in	std_logic_vector(n-1 downto 0);
	z	  : out std_logic_vector(n-1 downto 0)
  );
end entity mux_3to1_n;

architecture structural of mux_3to1_n is

signal z0: std_logic_vector(n-1 downto 0);

begin
  mux0: mux_n
   generic map (n => n)
   port map (
     sel => sel0,
     src0 => src0,
     src1 => src1,
     z => z0);
  
  mux1: mux_n
   generic map (n => n)
   port map (
     sel => sel1,
     src0 => z0,
     src1 => src2,
     z => z);
     
end architecture structural;