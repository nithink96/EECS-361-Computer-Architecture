library ieee;
use ieee.std_logic_1164.all;
use work.dffr_a;

entity single_register is
     port(
     clk: in std_logic;
     reset: in std_logic;
     write_enable: in std_logic;
     data_in: in std_logic_vector(31 downto 0):= (others=>'0');
     data_out: out std_logic_vector(31 downto 0)
     );
end single_register;

architecture structural of single_register is
signal temp_data_out: std_logic_vector (31 downto 0);

signal neg_clk: std_logic;

component dffr_a
   port (
    clk	   : in  std_logic;
    arst   : in  std_logic;
    aload  : in  std_logic;
    adata  : in  std_logic;
	d	   : in  std_logic;
    enable : in  std_logic;
	q	   : out std_logic
  );
end component dffr_a;


begin
neg_clk<= not(clk);
Reg32bit: for I in 0 to 31 generate
  r_I: dffr_a port map(
       clk => neg_clk,
       arst => reset,
       aload => '0',
       adata => '0',
       d => data_in(I),
       enable => write_enable,
       q => temp_data_out(I)
       );
end generate Reg32bit;
data_out<=  temp_data_out ;
end structural;
