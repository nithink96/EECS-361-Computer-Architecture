library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity Register_ID_EX is
port(
clk : in std_logic;

ALUOp : in  STD_LOGIC_VECTOR (2 downto 0);
RegDst : in  STD_LOGIC;
ALUSrc : in  STD_LOGIC;
MemToReg : in  STD_LOGIC;
RegWrite : in  STD_LOGIC;
MemRead : in  STD_LOGIC;
MemWrite : in  STD_LOGIC;
BranchNE : in  STD_LOGIC;
Branch : in  STD_LOGIC;
BranchTZ : in  STD_LOGIC;
ExtOP: in  STD_LOGIC;
shamt: in std_logic_vector(4 downto 0);
PC_plus4 : in STD_LOGIC_VECTOR (31 downto 0);
RA : in STD_LOGIC_VECTOR (31 downto 0);
RB : in STD_LOGIC_VECTOR (31 downto 0);
imm : in STD_LOGIC_VECTOR (15 downto 0);   --instruction (15:0)
RT : in STD_LOGIC_VECTOR  (4 downto 0);    --instruction (20:16)
RD : in STD_LOGIC_VECTOR  (4 downto 0);    --instruction (15:11)
ALUctr: in STD_LOGIC_VECTOR  (2 downto 0);

OUT_ALUOp : OUT  STD_LOGIC_VECTOR (2 downto 0);
OUT_RegDst : out  STD_LOGIC;
OUT_ALUSrc : out  STD_LOGIC;
OUT_MemToReg : out  STD_LOGIC;
OUT_RegWrite : out  STD_LOGIC;
OUT_MemRead : out  STD_LOGIC;
OUT_MemWrite : out  STD_LOGIC;
OUT_BranchNE : out  STD_LOGIC;
OUT_Branch : out  STD_LOGIC;
OUT_BranchTZ : out  STD_LOGIC;
OUT_ExtOP: out  STD_LOGIC;
OUT_shamt: out std_logic_vector(4 downto 0);
OUT_PC_plus4 : out STD_LOGIC_VECTOR (31 downto 0);
OUT_RA : out STD_LOGIC_VECTOR (31 downto 0);
OUT_RB : out STD_LOGIC_VECTOR (31 downto 0);
OUT_imm : out STD_LOGIC_VECTOR (15 downto 0);  --instruction (15:0)
OUT_RT : out STD_LOGIC_VECTOR  (4 downto 0);   --instruction (20:16)
OUT_RD : out STD_LOGIC_VECTOR  (4 downto 0);    --instruction (15:11)
OUT_ALUctr: out STD_LOGIC_VECTOR  (2 downto 0)
);
end Register_ID_EX;

architecture structural of Register_ID_EX is
component register_1_bit is
port (clk, we, din: in std_logic;
dout  : out std_logic);
end component;

component Reg_3_bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (2 downto 0);
dout  : out std_logic_vector (2 downto 0));
end component;

component Reg_5_bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (4 downto 0);
dout  : out std_logic_vector (4 downto 0));
end component;

component Reg_16_bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (15 downto 0);
dout  : out std_logic_vector (15 downto 0));
end component;

component Reg_32_bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (31 downto 0);
dout  : out std_logic_vector (31 downto 0));
end component;


component not_gate is
port ( x : in std_logic;
z : out std_logic);
end component;

begin
q1 : Reg_3_bit port map (clk,'1',ALUOp,OUT_ALUOp);
q2 : register_1_bit port map (clk,'1',RegDst,OUT_RegDst);
q3 : register_1_bit port map (clk,'1',ALUSrc,OUT_ALUSrc);
q4 : register_1_bit port map (clk,'1',MemToReg,OUT_MemToReg);
q5 : register_1_bit port map (clk,'1',RegWrite,OUT_RegWrite);
q6 : register_1_bit port map (clk,'1',MemRead,OUT_MemRead);
q7 : register_1_bit port map (clk,'1',MemWrite,OUT_MemWrite);
q8 : register_1_bit port map (clk,'1',BranchNE,OUT_BranchNE);
q9 : register_1_bit port map (clk,'1',Branch,OUT_Branch);
q10 : register_1_bit port map (clk,'1',BranchTZ,OUT_BranchTZ);
q11 : register_1_bit port map (clk,'1',ExtOP,OUT_ExtOP);
q12 : Reg_32_bit port map (clk,'1',PC_plus4,OUT_PC_plus4);
q13 : Reg_32_bit port map (clk,'1',RA,OUT_RA);
q14 : Reg_32_bit port map (clk,'1',RB,OUT_RB);
q15 : Reg_16_bit port map (clk,'1',imm,OUT_imm);
q16 : Reg_5_bit port map (clk,'1',RT,OUT_RT);
q17 : Reg_5_bit port map (clk,'1',RD,OUT_RD);
q18 : Reg_5_bit port map (clk,'1',shamt,OUT_shamt);
q19 : Reg_3_bit port map (clk,'1',ALUctr,OUT_ALUctr);
end structural;

