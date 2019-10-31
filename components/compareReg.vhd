library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity compareReg is
	port (
	x : in std_logic_vector(4 downto 0);
	y : in std_logic_vector(4 downto 0);
	z : out std_logic
	);
end entity;

architecture structural of compareReg is
   
   signal A, B, result: std_logic_vector(31 downto 0);
   signal borrow, overflow: std_logic;
   
   component SUB_32bit is
     port (
       x     : in std_logic_vector(31 downto 0);
       y     : in std_logic_vector(31 downto 0);
       cin   : in std_logic;
       z     : out std_logic_vector(31 downto 0);
       borrow  : out std_logic;
       ovf  : out std_logic
     );
   end component;
   
   component nor_32bit is
     port (
	   or_in  : in  std_logic_vector(31 downto 0);
	   nor_out	    : out std_logic
     );
   end component;
   
begin
	
	A(4 downto 0) <= x;
	B(4 downto 0) <= y;
	
	A(31 downto 5) <= "000000000000000000000000000";
	B(31 downto 5) <= "000000000000000000000000000";
	
	sub0: SUB_32bit port map(x=>A,y=>B,cin=>'0',z=>result, borrow=>borrow, ovf=>overflow);
   nor0: nor_32bit port map(or_in=>result,nor_out=>z);
	
end structural;