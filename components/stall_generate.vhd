library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.dffr_a;

entity stall_generate is
port(
clk : in std_logic;
reset : in std_logic;
opcode : in std_logic_vector(5 downto 0):=(others=>'0');
stall_signal : out std_logic
);
end stall_generate;

architecture structural of stall_generate is
component and_6To1 is
port(x : in std_logic_vector(5 downto 0);
     z :out std_logic);
end component;

component and_gate is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;

component or_gate is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;

component not_gate is
  port (
    x   : in  std_logic;
    z   : out std_logic
  );
end component;

component single_register is
     port(
     clk: in std_logic;
     reset: in std_logic;
     write_enable: in std_logic;
     data_in: in std_logic_vector(31 downto 0):= (others=>'0');
     data_out: out std_logic_vector(31 downto 0)
     );
end component;


signal LW,BEQ,BNE,BGTZ :std_logic;
signal in1 :std_logic_vector(5 downto 0);
signal LWOP,BEQOP,BNEOP,BGTZOP :std_logic_vector(5 downto 0);
signal s1,s2,s3,s4,s5,nclk :std_logic;
signal t1,t2,t3 :std_logic_vector(31 downto 0);

begin
t1(0)<=s3;
p1: for I in 1 to 31 generate
t1(I)<='0';
end generate p1;
s4<=t3(0);
p2: for I in 1 to 31 generate
t3(I)<='0';
end generate p2;

q1: not_gate port map(opcode(0),in1(0));
q2: not_gate port map(opcode(1),in1(1));
q3: not_gate port map(opcode(2),in1(2));
q4: not_gate port map(opcode(3),in1(3));
q5: not_gate port map(opcode(4),in1(4));
q6: not_gate port map(opcode(5),in1(5));

--LW 100011
LWOP(5)<=opcode(5);
LWOP(4)<=in1(4);
LWOP(3)<=in1(3);
LWOP(2)<=in1(2);
LWOP(1)<=opcode(1);
LWOP(0)<=opcode(0);
q7: and_6To1 port map(LWOP,LW);

--beq 000100
BEQOP(5)<=in1(5);
BEQOP(4)<=in1(4);
BEQOP(3)<=in1(3);
BEQOP(2)<=opcode(2);
BEQOP(1)<=in1(1);
BEQOP(0)<=in1(0);
q8: and_6To1 port map(BEQOP,BEQ);

--bne 000101
BNEOP(5)<=in1(5);
BNEOP(4)<=in1(4);
BNEOP(3)<=in1(3);
BNEOP(2)<=opcode(2);
BNEOP(1)<=in1(1);
BNEOP(0)<=opcode(0);
q9: and_6To1 port map(BNEOP,BNE);

--bgtz 000111
BGTZOP(5)<=in1(5);
BGTZOP(4)<=in1(4);
BGTZOP(3)<=in1(3);
BGTZOP(2)<=opcode(2);
BGTZOP(1)<=opcode(1);
BGTZOP(0)<=opcode(0);
q10: and_6To1 port map(BGTZOP,BGTZ);


q11: or_gate port map (LW,BEQ,s1);
q12: or_gate port map (BNE,BGTZ,s2);
q13: or_gate port map (s1,s2,s3);
q14: not_gate port map (clk,nclk); --inverse clock
q15: single_register port map(clk,reset,'1',t1,t2);
q16: single_register port map(clk,reset,'1',t2,t3);
--use 2 register to delay the stall signal to let it stall in next cycle


q17: not_gate port map(s4,stall_signal);


end structural;





