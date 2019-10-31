
library ieee;
use ieee.std_logic_1164.all;

entity slt is
    port(
        a          : in  std_logic_vector (31 downto 0);
        b          : in  std_logic_vector (31 downto 0);
        result     : out std_logic_vector (31 downto 0);
        overflow   : out std_logic;
	setlessbit : out std_logic
      );
end entity;

architecture structure of slt is
signal res_temp : std_logic_vector(31 downto 0);
signal carry : std_logic;
--signal slb: std_logic;
   component sub_32
       port (
         a          : in  std_logic_vector (31 downto 0);
         b          : in  std_logic_vector (31 downto 0);
         carryin    : in  std_logic;
         result     : out std_logic_vector (31 downto 0);
         carryout   : out std_logic;
         overflow   : out std_logic
       );
   end component;

   begin
	
   	l1:sub_32 port map(a,b,'0',res_temp,carry,overflow);
	setlessbit<=res_temp(31);
	
	result<=res_temp;

   	end architecture structure;