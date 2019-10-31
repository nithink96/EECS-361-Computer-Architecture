library ieee;
use ieee.std_logic_1164.all;

entity sltu is
    port(
        a          : in  std_logic_vector (31 downto 0);
        b          : in  std_logic_vector (31 downto 0);
        result    : out std_logic_vector (31 downto 0);
        overflow   : out std_logic;
	setlessbit : out std_logic
      );
end entity;

architecture structure of sltu is
   
   signal res_temp : std_logic_vector (31 downto 0);
   signal a_temp   : std_logic_vector (31 downto 0);
   signal b_temp    : std_logic_vector (31 downto 0);
   signal Abar   : std_logic;
   signal AbarB  : std_logic;
   signal AxnorB : std_logic;
  -- signal bitset : std_logic;
   signal bab    : std_logic;
   signal cout   : std_logic;
   
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
   
   component xor_gate
       port (
         x   : in  std_logic;
         y   : in  std_logic;
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
   
   component not_gate
       port (
         x   : in  std_logic;
         z   : out std_logic
       );
   end component;
   
   component xnor_gate
     port (
       x   : in  std_logic;
       y   : in  std_logic;
       z   : out std_logic
     );
   end component;
   
begin
    --(31 downto 1) <= "0000000000000000000000000000000";
    a_temp(30 downto 0) <= a(30 downto 0);
    b_temp(30 downto 0) <= b(30 downto 0);
    l1 : xor_gate port map(a(31), b(31), a_temp(31));
    l2 : xor_gate port map(a(31), b(31), b_temp(31));
    l3 : sub_32 port map(a_temp, b_temp, '0', res_temp, cout, overflow);
    l4 : not_gate port map(a(31), Abar);
    l5 : and_gate port map(Abar, B(31), AbarB);
    l6: xnor_gate port map(a(31), b(31), AxnorB);
    l7 : and_gate port map(res_temp(31), AxnorB, bab);
    l8 : or_gate port map(bab, AbarB, setlessbit);
	result<=res_temp;
end structure;
