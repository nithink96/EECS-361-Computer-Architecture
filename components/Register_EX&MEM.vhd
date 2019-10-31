library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity Register_EX_MEM is
port(
clk : in std_logic;
ALU_result : in std_logic_vector (31 downto 0);
Write_data : in std_logic_vector (31 downto 0);
Write_register: in std_logic_vector(4 downto 0);
MemToReg : in  STD_LOGIC;
RegWrite : in  STD_LOGIC;
MemRead : in  STD_LOGIC;
MemWrite : in  STD_LOGIC;


OUT_ALU_result : OUT std_logic_vector (31 downto 0);
OUT_Write_data : OUT std_logic_vector (31 downto 0);
OUT_Write_register: OUT std_logic_vector(4 downto 0);
OUT_MemToReg : out  STD_LOGIC;
OUT_RegWrite : out  STD_LOGIC;
OUT_MemRead : out  STD_LOGIC;
OUT_MemWrite : out  STD_LOGIC
);
end Register_EX_MEM;

architecture structural of Register_EX_MEM is

component register_1_bit is
port (clk, we, din: in std_logic;
dout  : out std_logic);
end component;

component Reg_32_bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (31 downto 0);
dout  : out std_logic_vector (31 downto 0));
end component;

component Reg_5_bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (4 downto 0);
dout  : out std_logic_vector (4 downto 0));
end component;

component not_gate is
port ( x : in std_logic;
z : out std_logic);
end component;

begin
q0: Reg_32_bit port map (clk,'1',ALU_result,OUT_ALU_result);
q1: Reg_32_bit port map (clk,'1',Write_data,OUT_Write_data);
q2: Reg_5_bit  port map (clk,'1',Write_register,OUT_Write_register);
q3 : register_1_bit port map (clk,'1',MemToReg,OUT_MemToReg);
q4 : register_1_bit port map (clk,'1',RegWrite,OUT_RegWrite);
q5 : register_1_bit port map (clk,'1',MemRead,OUT_MemRead);
q6 : register_1_bit port map (clk,'1',MemWrite,OUT_MemWrite);

end structural;






