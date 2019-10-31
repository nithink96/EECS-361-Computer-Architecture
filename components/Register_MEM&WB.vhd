library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity Register_MEM_WB is
port(
clk : in std_logic;

ALU_result : in std_logic_vector (31 downto 0);
data_out : in std_logic_vector (31 downto 0);
Write_register: in std_logic_vector(4 downto 0);
MemToReg : in  STD_LOGIC;
RegWrite : in  STD_LOGIC;


OUT_ALU_result : OUT std_logic_vector (31 downto 0);
OUT_data_out  : OUT std_logic_vector (31 downto 0);
OUT_Write_register: OUT std_logic_vector(4 downto 0);
OUT_MemToReg : out  STD_LOGIC;
OUT_RegWrite : out  STD_LOGIC
);
end Register_MEM_WB;

architecture structural of Register_MEM_WB is

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
q1: Reg_32_bit port map (clk,'1',data_out,OUT_data_out);
q2: Reg_5_bit  port map (clk,'1',Write_register,OUT_Write_register);
q3 : register_1_bit port map (clk,'1',MemToReg,OUT_MemToReg);
q4 : register_1_bit port map (clk,'1',RegWrite,OUT_RegWrite);
end structural;
