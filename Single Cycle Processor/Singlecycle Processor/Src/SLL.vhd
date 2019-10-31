library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;

entity SLLmod is 
port(
	A: in std_logic_vector (31 downto 0);
	B: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
	);
end entity SLLmod;

architecture structural of SLLmod is
	component shifterLevel is
		port(
			A: in std_logic_vector(31 downto 0);
			B: in std_logic_vector(31 downto 0);
			sel: in std_logic;
			result: out std_logic_vector(31 downto 0)
		);
	end component shifterLevel;
	signal level1:std_logic_vector (31 downto 0); --store results from each level of the shifter
	signal level2:std_logic_vector (31 downto 0);
	signal level3:std_logic_vector (31 downto 0);
	signal level4:std_logic_vector (31 downto 0);

	signal s0, s1,s2,s3,s4:std_logic;


begin

	s0<= B(0);
	s1<= B(1);
	s2<= B(2);
	s3<= B(3);
	s4<= B(4);
	--The B inputs for each shifterLevel is determined by what level it is currently on
	--The B input is shifted to the left (1 on the first level, 2 on the second level, 4 on the third level
	--8 on the fourth, and 16 on the fifth)

	--Shift level 1 
	shift1: shifterLevel port map(A=>A, B(31 downto 1) => A(30 downto 0), B(0)=>'0',  sel=>B(0), result =>level1 );

	--Shift level 2
	shift2: shifterLevel port map(A=> level1,  B(31 downto 2) => level1(29 downto 0),  B(1 downto 0 )=>(others=>'0'), sel=>B(1), result=>level2);

	--Shift Level 3
	shift3: shifterLevel port map(A=> level2, B(31 downto 4) => level2(27 downto 0), B(3 downto 0 )=>(others=>'0'),  sel=>B(2), result=>level3);
	
	--Shift Level 4
	shift4: shifterLevel port map(A=> level3, B(31 downto 8) => level3(23 downto 0), B(7 downto 0 )=>(others=>'0'),  sel=>B(3), result=>level4);
	
	--Shift Level 5
	shift5: shifterLevel port map(A=> level4, B(31 downto 16) => level4(15 downto 0), B(15 downto 0 )=>(others=>'0'),  sel=>B(4), result=>result);
end architecture structural;


library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;

entity shifterLevel is
port(
	A: in std_logic_vector(31 downto 0);
	B: in std_logic_vector(31 downto 0);
	sel: in std_logic;
	result: out std_logic_vector(31 downto 0)
	);
end entity shifterLevel;



--shifterLevel is for each level of the shifting
--its 32 multiplexers which will select between inputs based on the "sel" input of the entity
architecture structural of shifterLevel is
	component mux is 
		port (
		sel	  : in	std_logic;
		src0  :	in	std_logic;
		src1  :	in	std_logic;
		z	  : out std_logic
	  		);
	end component mux;
	signal tempresult: std_logic_vector(31 downto 0);
begin

	result<= tempresult;
	m0: mux  port map(sel, A(0), B(0),tempresult(0));
	m1: mux  port map(sel, A(1), B(1),tempresult(1));
	m2: mux  port map(sel, A(2), B(2),tempresult(2));
	m3: mux  port map(sel, A(3), B(3),tempresult(3));
	m4: mux  port map(sel, A(4), B(4),tempresult(4));
	m5: mux  port map(sel, A(5), B(5),tempresult(5));
	m6: mux  port map(sel, A(6), B(6),tempresult(6));
	m7: mux  port map(sel, A(7), B(7),tempresult(7));
	m8: mux  port map(sel, A(8), B(8),tempresult(8));
	m9: mux  port map(sel, A(9), B(9),tempresult(9));
	m10: mux  port map(sel, A(10), B(10),tempresult(10));
	m11: mux  port map(sel, A(11), B(11),tempresult(11));
	m12: mux  port map(sel, A(12), B(12),tempresult(12));
	m13: mux  port map(sel, A(13), B(13),tempresult(13));
	m14: mux  port map(sel, A(14), B(14),tempresult(14));
	m15: mux  port map(sel, A(15), B(15),tempresult(15));
	m16: mux  port map(sel, A(16), B(16),tempresult(16));
	m17: mux  port map(sel, A(17), B(17),tempresult(17));
	m18: mux  port map(sel, A(18), B(18),tempresult(18));
	m19: mux  port map(sel, A(19), B(19),tempresult(19));
	m20: mux  port map(sel, A(20), B(20),tempresult(20));
	m21: mux port map(sel, A(21), B(21),tempresult(21));
	m22: mux  port map(sel, A(22), B(22),tempresult(22));
	m23: mux  port map(sel, A(23), B(23),tempresult(23));
	m24: mux  port map(sel, A(24), B(24),tempresult(24));
	m25: mux  port map(sel, A(25), B(25),tempresult(25));
	m26: mux  port map(sel, A(26), B(26),tempresult(26));
	m27: mux  port map(sel, A(27), B(27),tempresult(27));
	m28: mux  port map(sel, A(28), B(28),tempresult(28));
	m29: mux  port map(sel, A(29), B(29),tempresult(29));
	m30: mux  port map(sel, A(30), B(30),tempresult(30));
	m31: mux  port map(sel, A(31), B(31),tempresult(31));
end architecture structural;




--library ieee;
--use ieee.std_logic_1164.all;
--use work.eecs361.mux_n;

--entity mux is
--  port (
--	sel	  : in	std_logic;
--	src0  :	in	std_logic;
--	src1  :	in	std_logic;
--	z	  : out std_logic
--  );
--end mux;

--architecture structural of mux is
--begin
--  mux_map: mux_n
--	generic map (n => 1)
--	port map (
--	  sel => sel,
--	  src0(0) => src0,
--	  src1(0) => src1,
--	  z(0) => z);
--end structural;

