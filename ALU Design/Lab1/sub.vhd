library ieee;
use ieee.std_logic_1164.all;
entity sub is
port(
	a :in std_logic;
	b: in std_logic;
	result: out std_logic;
	overflow: out std_logic;
	carryin : in std_logic;
	carryout: out std_logic
	);
end entity sub;
architecture structure of sub is
signal oneC :std_logic;
   signal twoC :std_logic;
 signal carry : std_logic;
signal overflow1 : std_logic;
signal overflow2 : std_logic;
   signal partial_cout : std_logic;
	

component add is
     port (
       a          : in  std_logic;
       b          : in  std_logic;
       carryin    : in  std_logic;
       result     : out std_logic;
       carryout   : out std_logic;
       overflow   : out std_logic
     );
   end component;
component not_gate
  port (
    x   : in  std_logic;
    z   : out std_logic
  );
end component;

   
   component and_gate
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;

component or_gate
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;

component xor_gate
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;

begin
	l1: not_gate port map(b,oneC);
	l2: add port map(oneC,'1','0',twoC,carry,overflow1);
	l3 : add port map(a,twoC,carryin,result,carryout,overflow2);
	l4: or_gate port map(overflow1,overflow2,overflow);
end architecture structure;