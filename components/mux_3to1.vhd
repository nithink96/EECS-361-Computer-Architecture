library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.mux;

entity mux_3to1 is
  port (
	sel0	  : in	std_logic;
	sel1	  : in	std_logic;
	src0  :	in	std_logic;
	src1  :	in	std_logic;
	src2  :	in	std_logic;
	z	  : out std_logic
  );
end entity mux_3to1;

architecture structural of mux_3to1 is

signal z0: std_logic;

begin
  mux0: mux
   port map (
     sel => sel0,
     src0 => src0,
     src1 => src1,
     z => z0);
  
  mux1: mux
   port map (
     sel => sel1,
     src0 => z0,
     src1 => src2,
     z => z);
     
end architecture structural;