library ieee;
use ieee.std_logic_1164.all;
entity add is
     port (
       a          : in  std_logic;
       b          : in  std_logic;
       carryin    : in  std_logic;
       result     : out std_logic;
       carryout   : out std_logic;
       overflow   : out std_logic
     );
   end entity;

   architecture structure of add is

   signal axorb : std_logic;
   signal aandb : std_logic;
   signal aandcin : std_logic;
   signal bandcin : std_logic;
   signal partial_cout : std_logic;

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
	--sum
	l1:xor_gate port map(a,b,axorb);
	sum: xor_gate port map(axorb,carryin,result);
	--carry
	l2:and_gate port map(a,b,aandb);
	l3:and_gate port map(axorb,carryin,partial_cout);
	l4: or_gate port map(aandb,partial_cout,carryout);
end architecture structure;