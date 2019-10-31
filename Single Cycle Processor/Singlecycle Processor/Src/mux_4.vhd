library ieee;
use work.gatesAndConst.all;
use ieee.std_logic_1164.all;


entity mux_4 is
generic( n: integer );

port(
	
	sel: in std_logic_vector(2 downto 0);
	addOp: in std_logic_vector(n-1 downto 0);
	subOp: in std_logic_vector(n-1  downto 0);
	andOp: in std_logic_vector(n-1  downto 0);
	orOp: in std_logic_vector(n-1  downto 0);
	sllOp: in std_logic_vector(n-1  downto 0);
	sltOp: in std_logic_vector(n-1  downto 0);
	sltuOp: in std_logic_vector(n-1  downto 0);

	Result: out std_logic_vector(n-1  downto 0)
	);
end entity mux_4;

architecture structural of mux_4 is
	signal  Sig1: std_logic_vector(n-1 downto 0);
	signal  Sig2: std_logic_vector(n-1 downto 0);
	signal  Sig3: std_logic_vector(n-1 downto 0);
	signal  Sig4: std_logic_vector(n-1 downto 0);

	signal  Sig5: std_logic_vector(n-1 downto 0);
	signal  Sig6: std_logic_vector(n-1 downto 0);
	signal  Sig7: std_logic_vector(n-1 downto 0);
	signal zeros: std_logic_vector(n-1 downto 0);

begin

mux0: mux_n generic map(n=> n) port map(sel(0), andOp, orOp,  Sig1);
mux1: mux_n generic map (n=>n) port map(sel(0), addOp, sltuOp, Sig2);
mux2: mux_n generic map (n=>n) port map(sel(0), subOp, sltOp, Sig3);

mux3: mux_n generic map(n=>n) port map(sel(1), Sig1, Sig2, Sig4);
mux4: mux_n generic map(n=>n) port map(sel(1), sllOp, Sig3, sig5);

mux5: mux_n generic map(n=>n) port map(sel(2), Sig4, Sig5, Result);

end architecture structural;

