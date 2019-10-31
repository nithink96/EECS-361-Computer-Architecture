library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity DelayUnit is
  port (
	clk	      : in  std_logic;
   reset      : in  std_logic;
   delay_in	 : in  std_logic;
   delay_out	: out std_logic
  );
end entity;

architecture structural of DelayUnit is
    
    signal nclk, dffr_a_in, dffr_a_out, ndffr_a_out: std_logic;
    
    component dffr_a is
      port (
      	clk	   : in  std_logic;
       arst   : in  std_logic;
       aload  : in  std_logic;
       adata  : in  std_logic;
	    d	     : in  std_logic;
       enable : in  std_logic;
   	   q	     : out std_logic
      );
    end component;

begin
    
    not0: not_gate port map(clk, nclk);
    not1: not_gate port map(dffr_a_out, ndffr_a_out);
    
    and0: and_gate port map(delay_in, ndffr_a_out, dffr_a_in);
    
    dffr_a_0: dffr_a port map(nclk, reset, '0', '0', dffr_a_in, '1', dffr_a_out);
    
    delay_out <= dffr_a_out;
    
end structural;