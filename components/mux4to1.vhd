library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity mux4to1 is
port(
		sel: in std_logic_vector(1 downto 0);
		src_0: in std_logic_vector(31 downto 0);
		src_1: in std_logic_vector(31 downto 0);
		src_2: in std_logic_vector(31 downto 0);
		src_3: in std_logic_vector(31 downto 0);
		z: out std_logic_vector(31 downto 0)
		);
end entity;

architecture structural of mux4to1 is

signal temp1,temp2: std_logic_vector(31 downto 0);

component mux_32 is
		port(
			sel: in std_logic;
			src0: in std_logic_vector(31 downto 0);
			src1: in std_logic_vector(31 downto 0);
			z: out std_logic_vector(31 downto 0)
			);
end component;

begin

mux0: mux_32 port map(sel(0),src_0,src_1,temp1);
mux1: mux_32 port map(sel(0),src_2,src_3,temp2);
mux2: mux_32 port map(sel(1),temp1,temp2,z);

end architecture structural;
