library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;

entity register_file is
     port(
	 clk: in std_logic;
	 reset: in std_logic;
	 write_enable: in std_logic;
	 Ra : in std_logic_vector(4 downto 0);
	 Rb : in std_logic_vector(4 downto 0);
	 Rw : in std_logic_vector(4 downto 0);
         data_in: in std_logic_vector(31 downto 0):=(others=>'0');
         outA: out std_logic_vector(31 downto 0);
	 outB: out std_logic_vector(31 downto 0));
end register_file;

architecture structural of register_file is
signal temp_outA: std_logic_vector(31 downto 0);
signal temp_outB, temp_temp_outB: std_logic_vector(31 downto 0);

component single_register is
     port(
     clk: in std_logic;
     reset: in std_logic;
     write_enable: in std_logic;
     data_in: in std_logic_vector(31 downto 0);
     data_out: out std_logic_vector(31 downto 0)
     );
end component;

component dec_n is
  generic (
    n	: integer
  );
  port (
    src	: in std_logic_vector(n-1 downto 0);
    z	: out std_logic_vector((2**n)-1 downto 0)
  );
end component;

component mux32_32 is
     port(
sel :  in std_logic_vector(4 downto 0);

reg0 : in std_logic_vector(31 downto 0);
reg1 : in std_logic_vector(31 downto 0);
reg2 : in std_logic_vector(31 downto 0);
reg3 : in std_logic_vector(31 downto 0);
reg4 : in std_logic_vector(31 downto 0);
reg5 : in std_logic_vector(31 downto 0);
reg6 : in std_logic_vector(31 downto 0);
reg7 : in std_logic_vector(31 downto 0);

reg8 : in std_logic_vector(31 downto 0);
reg9 : in std_logic_vector(31 downto 0);
reg10 : in std_logic_vector(31 downto 0);
reg11 : in std_logic_vector(31 downto 0);
reg12 : in std_logic_vector(31 downto 0);
reg13 : in std_logic_vector(31 downto 0);
reg14 : in std_logic_vector(31 downto 0);
reg15 : in std_logic_vector(31 downto 0);

reg16 : in std_logic_vector(31 downto 0);
reg17 : in std_logic_vector(31 downto 0);
reg18 : in std_logic_vector(31 downto 0);
reg19 : in std_logic_vector(31 downto 0);
reg20 : in std_logic_vector(31 downto 0);
reg21 : in std_logic_vector(31 downto 0);
reg22 : in std_logic_vector(31 downto 0);
reg23 : in std_logic_vector(31 downto 0);

reg24 : in std_logic_vector(31 downto 0);
reg25 : in std_logic_vector(31 downto 0);
reg26 : in std_logic_vector(31 downto 0);
reg27 : in std_logic_vector(31 downto 0);
reg28 : in std_logic_vector(31 downto 0);
reg29 : in std_logic_vector(31 downto 0);
reg30 : in std_logic_vector(31 downto 0);
reg31 : in std_logic_vector(31 downto 0);

output: out std_logic_vector(31 downto 0));
end component;

component dffr32_2 is
  port (
  clk : in  std_logic;
  d : in  std_logic_vector(31 downto 0);
  q : out std_logic_vector(31 downto 0)
  );
end component;


signal sig_dec : std_logic_vector(31 downto 0);
signal sig_enable : std_logic_vector(31 downto 0);

signal sig_data_out0 : std_logic_vector(31 downto 0);
signal sig_data_out1 : std_logic_vector(31 downto 0);
signal sig_data_out2 : std_logic_vector(31 downto 0);
signal sig_data_out3 : std_logic_vector(31 downto 0);
signal sig_data_out4 : std_logic_vector(31 downto 0);
signal sig_data_out5 : std_logic_vector(31 downto 0);
signal sig_data_out6 : std_logic_vector(31 downto 0);
signal sig_data_out7 : std_logic_vector(31 downto 0);

signal sig_data_out8 : std_logic_vector(31 downto 0);
signal sig_data_out9 : std_logic_vector(31 downto 0);
signal sig_data_out10 : std_logic_vector(31 downto 0);
signal sig_data_out11 : std_logic_vector(31 downto 0);
signal sig_data_out12 : std_logic_vector(31 downto 0);
signal sig_data_out13 : std_logic_vector(31 downto 0);
signal sig_data_out14 : std_logic_vector(31 downto 0);
signal sig_data_out15 : std_logic_vector(31 downto 0);

signal sig_data_out16 : std_logic_vector(31 downto 0);
signal sig_data_out17 : std_logic_vector(31 downto 0);
signal sig_data_out18 : std_logic_vector(31 downto 0);
signal sig_data_out19 : std_logic_vector(31 downto 0);
signal sig_data_out20 : std_logic_vector(31 downto 0);
signal sig_data_out21 : std_logic_vector(31 downto 0);
signal sig_data_out22 : std_logic_vector(31 downto 0);
signal sig_data_out23 : std_logic_vector(31 downto 0);

signal sig_data_out24 : std_logic_vector(31 downto 0);
signal sig_data_out25 : std_logic_vector(31 downto 0);
signal sig_data_out26 : std_logic_vector(31 downto 0);
signal sig_data_out27 : std_logic_vector(31 downto 0);
signal sig_data_out28 : std_logic_vector(31 downto 0);
signal sig_data_out29 : std_logic_vector(31 downto 0);
signal sig_data_out30 : std_logic_vector(31 downto 0);
signal sig_data_out31 : std_logic_vector(31 downto 0);

signal sig_clk : std_logic;

begin
dec_map: dec_n 
generic map (n => 5)
port map(src=>Rw,z=>sig_dec);--decode signal

--not_gate_map: not_gate port map(clk, sig_clk);--inverse the clk 
sig_clk<= clk;

and_gate_map0: and_gate port map(sig_dec(0),write_enable,sig_enable(0));
and_gate_map1: and_gate port map(sig_dec(1),write_enable,sig_enable(1));
and_gate_map2: and_gate port map(sig_dec(2),write_enable,sig_enable(2));
and_gate_map3: and_gate port map(sig_dec(3),write_enable,sig_enable(3));
and_gate_map4: and_gate port map(sig_dec(4),write_enable,sig_enable(4));
and_gate_map5: and_gate port map(sig_dec(5),write_enable,sig_enable(5));
and_gate_map6: and_gate port map(sig_dec(6),write_enable,sig_enable(6));
and_gate_map7: and_gate port map(sig_dec(7),write_enable,sig_enable(7));

and_gate_map8: and_gate port map(sig_dec(8),write_enable,sig_enable(8));
and_gate_map9: and_gate port map(sig_dec(9),write_enable,sig_enable(9));
and_gate_map10: and_gate port map(sig_dec(10),write_enable,sig_enable(10));
and_gate_map11: and_gate port map(sig_dec(11),write_enable,sig_enable(11));
and_gate_map12: and_gate port map(sig_dec(12),write_enable,sig_enable(12));
and_gate_map13: and_gate port map(sig_dec(13),write_enable,sig_enable(13));
and_gate_map14: and_gate port map(sig_dec(14),write_enable,sig_enable(14));
and_gate_map15: and_gate port map(sig_dec(15),write_enable,sig_enable(15));

and_gate_map16: and_gate port map(sig_dec(16),write_enable,sig_enable(16));
and_gate_map17: and_gate port map(sig_dec(17),write_enable,sig_enable(17));
and_gate_map18: and_gate port map(sig_dec(18),write_enable,sig_enable(18));
and_gate_map19: and_gate port map(sig_dec(19),write_enable,sig_enable(19));
and_gate_map20: and_gate port map(sig_dec(20),write_enable,sig_enable(20));
and_gate_map21: and_gate port map(sig_dec(21),write_enable,sig_enable(21));
and_gate_map22: and_gate port map(sig_dec(22),write_enable,sig_enable(22));
and_gate_map23: and_gate port map(sig_dec(23),write_enable,sig_enable(23));

and_gate_map24: and_gate port map(sig_dec(24),write_enable,sig_enable(24));
and_gate_map25: and_gate port map(sig_dec(25),write_enable,sig_enable(25));
and_gate_map26: and_gate port map(sig_dec(26),write_enable,sig_enable(26));
and_gate_map27: and_gate port map(sig_dec(27),write_enable,sig_enable(27));
and_gate_map28: and_gate port map(sig_dec(28),write_enable,sig_enable(28));
and_gate_map29: and_gate port map(sig_dec(29),write_enable,sig_enable(29));
and_gate_map30: and_gate port map(sig_dec(30),write_enable,sig_enable(30));
and_gate_map31: and_gate port map(sig_dec(31),write_enable,sig_enable(31));

register_map0: single_register port map(sig_clk,reset,sig_enable(0),data_in,sig_data_out0);
register_map1: single_register port map(sig_clk,reset,sig_enable(1),data_in,sig_data_out1);
register_map2: single_register port map(sig_clk,reset,sig_enable(2),data_in,sig_data_out2);
register_map3: single_register port map(sig_clk,reset,sig_enable(3),data_in,sig_data_out3);
register_map4: single_register port map(sig_clk,reset,sig_enable(4),data_in,sig_data_out4);
register_map5: single_register port map(sig_clk,reset,sig_enable(5),data_in,sig_data_out5);
register_map6: single_register port map(sig_clk,reset,sig_enable(6),data_in,sig_data_out6);
register_map7: single_register port map(sig_clk,reset,sig_enable(7),data_in,sig_data_out7);

register_map8: single_register port map(sig_clk,reset,sig_enable(8),data_in,sig_data_out8);
register_map9: single_register port map(sig_clk,reset,sig_enable(9),data_in,sig_data_out9);
register_map10: single_register port map(sig_clk,reset,sig_enable(10),data_in,sig_data_out10);
register_map11: single_register port map(sig_clk,reset,sig_enable(11),data_in,sig_data_out11);
register_map12: single_register port map(sig_clk,reset,sig_enable(12),data_in,sig_data_out12);
register_map13: single_register port map(sig_clk,reset,sig_enable(13),data_in,sig_data_out13);
register_map14: single_register port map(sig_clk,reset,sig_enable(14),data_in,sig_data_out14);
register_map15: single_register port map(sig_clk,reset,sig_enable(15),data_in,sig_data_out15);

register_map16: single_register port map(sig_clk,reset,sig_enable(16),data_in,sig_data_out16);
register_map17: single_register port map(sig_clk,reset,sig_enable(17),data_in,sig_data_out17);
register_map18: single_register port map(sig_clk,reset,sig_enable(18),data_in,sig_data_out18);
register_map19: single_register port map(sig_clk,reset,sig_enable(19),data_in,sig_data_out19);
register_map20: single_register port map(sig_clk,reset,sig_enable(20),data_in,sig_data_out20);
register_map21: single_register port map(sig_clk,reset,sig_enable(21),data_in,sig_data_out21);
register_map22: single_register port map(sig_clk,reset,sig_enable(22),data_in,sig_data_out22);
register_map23: single_register port map(sig_clk,reset,sig_enable(23),data_in,sig_data_out23);

register_map24: single_register port map(sig_clk,reset,sig_enable(24),data_in,sig_data_out24);
register_map25: single_register port map(sig_clk,reset,sig_enable(25),data_in,sig_data_out25);
register_map26: single_register port map(sig_clk,reset,sig_enable(26),data_in,sig_data_out26);
register_map27: single_register port map(sig_clk,reset,sig_enable(27),data_in,sig_data_out27);
register_map28: single_register port map(sig_clk,reset,sig_enable(28),data_in,sig_data_out28);
register_map29: single_register port map(sig_clk,reset,sig_enable(29),data_in,sig_data_out29);
register_map30: single_register port map(sig_clk,reset,sig_enable(30),data_in,sig_data_out30);
register_map31: single_register port map(sig_clk,reset,sig_enable(31),data_in,sig_data_out31);

mux_mapA: mux32_32 port map(Ra, 
X"00000000",sig_data_out1,sig_data_out2,sig_data_out3,sig_data_out4,sig_data_out5,sig_data_out6,sig_data_out7,
sig_data_out8,sig_data_out9,sig_data_out10,sig_data_out11,sig_data_out12,sig_data_out13,sig_data_out14,sig_data_out15,
sig_data_out16,sig_data_out17,sig_data_out18,sig_data_out19,sig_data_out20,sig_data_out21,sig_data_out22,sig_data_out23,
sig_data_out24,sig_data_out25,sig_data_out26,sig_data_out27,sig_data_out28,sig_data_out29,sig_data_out30,sig_data_out31,
outA);

mux_mapB: mux32_32 port map(Rb, 
X"00000000",sig_data_out1,sig_data_out2,sig_data_out3,sig_data_out4,sig_data_out5,sig_data_out6,sig_data_out7,
sig_data_out8,sig_data_out9,sig_data_out10,sig_data_out11,sig_data_out12,sig_data_out13,sig_data_out14,sig_data_out15,
sig_data_out16,sig_data_out17,sig_data_out18,sig_data_out19,sig_data_out20,sig_data_out21,sig_data_out22,sig_data_out23,
sig_data_out24,sig_data_out25,sig_data_out26,sig_data_out27,sig_data_out28,sig_data_out29,sig_data_out30,sig_data_out31,
outB);

--outAFF: dffr32_2 port map (clk, temp_outA, outA);
--outBFF: dffr32_2 port map (clk, temp_outB, temp_temp_outB);

--outB<= (others=>'0') when Rb = "00000" else temp_temp_outB;

end structural;