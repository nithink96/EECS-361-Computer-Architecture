library ieee;
use ieee.std_logic_1164.all;

entity nl_mux_32 is
port(
		
		res1 : in std_logic_vector(31 downto 0);
		res2 : in std_logic_vector(31 downto 0);
		res3 : in std_logic_vector(31 downto 0);
		res4 : in std_logic_vector(31 downto 0);
		res5 : in std_logic_vector(31 downto 0);
		res6 : in std_logic_vector(31 downto 0);
		res7 : in std_logic_vector(31 downto 0);
		res8 : in std_logic_vector(31 downto 0);
		op_sel : in std_logic_vector(3 downto 0);
		res_o : out std_logic_vector(31 downto 0) 
	);
	end entity nl_mux_32;

	architecture structural of nl_mux_32 is

	signal mux11 : std_logic_vector(31 downto 0);
	signal mux12 : std_logic_vector(31 downto 0);
	signal mux13 : std_logic_vector(31 downto 0);
	signal mux14 : std_logic_vector(31 downto 0);
	signal mux21 : std_logic_vector(31 downto 0);
	signal mux22 : std_logic_vector(31 downto 0);
	signal mux31 : std_logic_vector(31 downto 0);

	component mux_32 is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic_vector(31 downto 0);
	src1  : in  std_logic_vector(31 downto 0);
	z : out std_logic_vector(31 downto 0)
  );
end component mux_32;

begin
	mux_call1: mux_32 port map(op_sel(0),res1,res5,mux11);
	mux_call2: mux_32 port map(op_sel(0),res2,res6,mux12);
	mux_call3: mux_32 port map(op_sel(0),res3,res7,mux13);
	mux_call4: mux_32 port map(op_sel(0),res4,res8,mux14);
	mux_call5: mux_32 port map(op_sel(1),mux11,mux13,mux21);
	mux_call6: mux_32 port map(op_sel(1),mux12,mux14,mux22);
	mux_call7: mux_32 port map(op_sel(2),mux21,mux22,mux31);
	res_o <=mux31;
end architecture structural;
