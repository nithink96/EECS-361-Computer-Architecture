library ieee;
use ieee.std_logic_1164.all;

entity sub_32 is
  port (
    a          : in  std_logic_vector (31 downto 0);
    b          : in  std_logic_vector (31 downto 0);
    carryin    : in  std_logic;
    result     : out std_logic_vector (31 downto 0);
    carryout   : out std_logic;
    overflow   : out std_logic
  );
end sub_32;

architecture structure of sub_32 is
signal oneC : std_logic_vector(31 downto 0);
signal twoC : std_logic_vector(31 downto 0);

signal carry : std_logic;
signal overflow1 : std_logic;
signal overflow2 : std_logic;


component add_32
   port (
     a          : in  std_logic_vector (31 downto 0);
     b          : in  std_logic_vector (31 downto 0);
     carryin    : in  std_logic;
     result     : out std_logic_vector (31 downto 0);
     carryout   : out std_logic;
     overflow   : out std_logic
   );
end component;

component not_gate_32
  port (
    x   : in  std_logic_vector(31 downto 0);
    z   : out std_logic_vector(31 downto 0)
  );
end component;

component or_gate
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;

begin
--temp <= '1';
l1:not_gate_32 port map(b,oneC);
l2:add_32 port map(oneC,"00000000000000000000000000000001",'0',twoC,carry,overflow1);
l3:add_32 port map(a,twoC,carryin,result,carryout,overflow2);
l4:or_gate port map(overflow1,overflow2,overflow);
end architecture structure;