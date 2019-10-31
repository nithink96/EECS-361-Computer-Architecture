library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity Register_IF_ID is 
port(
clk : in std_logic;
IF_ID_write_enable : in std_logic;
pc_plus4_in :in std_logic_vector(31 downto 0);
opcode,func :in std_logic_vector(5 downto 0);
Rs,Rt,Rd,shamt: in std_logic_vector(4 downto 0);
imm16: in std_logic_vector(15 downto 0);

pc_plus4_out :out std_logic_vector(31 downto 0);
opcode_out,func_out :out std_logic_vector(5 downto 0);
Rs_out,Rt_out,Rd_out,shamt_out: out std_logic_vector(4 downto 0);
imm16_out: out std_logic_vector(15 downto 0));
end entity;

architecture structural of Register_IF_ID is
component register_1_bit is
port (clk, we, din: in std_logic;
dout  : out std_logic);
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

signal inst_in, inst_out : std_logic_vector(31 downto 0);

begin
inst_in(31 downto 26)<=opcode;
inst_in(20 downto 16)<=Rt;
inst_in(25 downto 21)<=Rs;
inst_in(15 downto 11)<=Rd;
inst_in(10 downto 6)<=shamt;
inst_in(5 downto 0)<=func;
inst_in(15 downto 0)<=imm16;

opcode_out<=inst_out(31 downto 26);
Rt_out<=inst_out(20 downto 16);
Rs_out<=inst_out(25 downto 21);
Rd_out<=inst_out(15 downto 11);
shamt_out<=inst_out(10 downto 6);
func_out<=inst_out(5 downto 0);
imm16_out<=inst_out(15 downto 0);

store_PC:          Reg_32_bit port map (clk, IF_ID_write_enable, pc_plus4_in, pc_plus4_out);
store_instruction: Reg_32_bit port map (clk, IF_ID_write_enable, inst_in, inst_out);
--write enable port for stall



end structural;