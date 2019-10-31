library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity main_control is
port (
    opcode : in  std_logic_vector(5 downto 0);
    RegDst  : out std_logic;
    ALUSrc : out std_logic;
    MemtoReg : out std_logic;
    RegWr: out std_logic;
    MemWr: out std_logic;
    Branch: out std_logic;
    Jump: out std_logic;
    ExtOp: out std_logic;
    ALUop: out std_logic_vector(2 downto 0)
  ); 
end main_control;

architecture structural of main_control is

component six_in_and_gate is
 port (
    u   : in  std_logic;
    v   : in  std_logic;
    w   : in  std_logic;
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end component;
component and_gate is
    port (
      x : in std_logic;
      y : in std_logic;
      z : out std_logic
    );
  end component;


component not_gate is
    port (
      x : in std_logic;
      z : out std_logic
    );
  end component;

component or_gate is
    port (
      x : in std_logic;
      y : in std_logic;
      z : out std_logic
    );
  end component;
  signal inst:std_logic_vector(8 downto 0);
  signal temp0:std_logic;
signal temp1, temp2, temp3:std_logic;
signal nop0,nop1,nop2,nop3,nop4,nop5:std_logic;

signal b1, b2, b3: std_logic;

 -- signal inv_opcode: std_logic_vector(5 downto 0);
begin

--Invert values of opcode

l1: not_gate port map(opcode(5),nop5);
l2: not_gate port map(opcode(4),nop4);
l3: not_gate port map(opcode(3),nop3);
l4: not_gate port map(opcode(2),nop2);
l5: not_gate port map(opcode(1),nop1);
l6: not_gate port map(opcode(0),nop0);

--Find Instruction Type based on Opcode

--Rtype
r1: six_in_and_gate port map(nop5,nop4,nop3,nop2,nop1,nop0,inst(0));

--SLL

--OR Immediate
or1: six_in_and_gate port map(nop5,nop4,opcode(3),opcode(2),nop1,opcode(0),inst(1));
--Load word
addi: six_in_and_gate port map(nop5, nop4, opcode(3), nop2, nop1, nop0, inst(8) );

lw1: six_in_and_gate port map(opcode(5),nop4,nop3,nop2,opcode(1),opcode(0),inst(2));

--Store Word

sw1: six_in_and_gate port map(opcode(5),nop4,opcode(3),nop2,opcode(1),opcode(0),inst(3));

-- Breanch Equal

beq1: six_in_and_gate port map(nop5,nop4,nop3,opcode(2),nop1,nop0,inst(4));
bne1: six_in_and_gate port map(nop5,nop4,nop3,opcode(2),nop1,opcode(0),inst(7));
bgtz1: six_in_and_gate port map(nop5,nop4,nop3,opcode(2),opcode(1),opcode(0),inst(6));

-- Jump

jmp1: six_in_and_gate port map(nop5,nop4,nop3,nop2,opcode(1),nop0,inst(5));

--RegWrite

regwr1: or_gate port map(inst(0),inst(1),temp0);
regwr2: or_gate port map(inst(2),temp0,temp3);
regwr3: or_gate port map(temp3, inst(8), RegWr);


--ALUSRC

alusrc1: or_gate port map(inst(1),inst(2),temp1);
alusrc2: or_gate port map(temp1,inst(3),temp2);
alusrc3: or_gate port map(temp2, inst(8), ALUSrc);
--RegDst

RegDst<=inst(0);

--MemtoReg

MemtoReg<=inst(2);

--MemWrite

MemWr<=inst(3);

--Branch
----BEQ  
--Branch(2)<=inst(4);
----BNE
--Branch(1)<=inst(7);
----BGTZ
--Branch(0)<=inst(6);

branchCheck1: or_gate port map (inst(4), inst(7), b1);
branchCheck2: or_gate port map(b1, inst(6), Branch);

--Jump
Jump<=inst(5);
--ExtOP

extop1: or_gate port map(inst(2),inst(3),ExtOp);

--ALUop

ALUop(2)<=inst(0);
ALUop(1)<=inst(1);
ALUop(0)<=inst(4);


end architecture structural;


