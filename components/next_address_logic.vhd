Library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;

entity next_address_logic is
port (
		clk, branch, zero, rst,start : in std_logic; 
		instruction : in std_logic_vector(15 downto 0);
		addr : out std_logic_vector(31 downto 0)
		);
end next_address_logic;

architecture struct of next_address_logic is

component adder_32 is
port (
		a, b : in std_logic_vector(31 downto 0);
		z : out std_logic_vector(31 downto 0)
		);
end component adder_32;

component pc is
port (
		clk : in std_logic; 
		rst : in std_logic;
		start: in std_logic;
		input : in std_logic_vector(31 downto 0); 
		output : out std_logic_vector(31 downto 0)
		);
end component pc;

component mux_32 is
port (
		sel   : in  std_logic;
		src0  : in  std_logic_vector(31 downto 0);
		src1  : in  std_logic_vector(31 downto 0);
		z	   : out std_logic_vector(31 downto 0)
		);
end component mux_32;

component sign_ext is
port (
		imm16 : in std_logic_vector(15 downto 0);
		output : out std_logic_vector(31 downto 0)
		);
end component sign_ext;

signal pc_out, adder_out1, adder_out2,adder_out3, mux_out, sign_out, zero1: std_logic_vector(31 downto 0); 
signal ctrl_out: std_logic;
signal shift_sign: std_logic_vector(31 downto 0);

begin
zero1 <="00000000000000000000000000000000";
pc_unit: pc port map(clk=>clk,start=>start, input=>mux_out, output=>pc_out, rst=>rst);
sign_unit: sign_ext port map(imm16=>instruction, output=>sign_out);
--adder1: adder_30 port map(a=>pc_out, b=>"000000000000000000000000000001", z=>adder_out1);
adder1: adder_32 port map(a=>pc_out, b=>"00000000000000000000000000000100", z=>adder_out1);
--adder2: adder_32 port map(a=>adder_out1, b=>sign_out, z=>adder_out2);
shift_sign (31 downto 2)<= sign_out(29 downto 0);
shift_sign (1 downto 0)<="00";
adder2: adder_32 port map(a=>adder_out1, b=>shift_sign, z=>adder_out2);
--adder3: adder_32 port map(a=>adder_out2, b=>X"FFFFFFFC", z=>adder_out3);
mux_unit: mux_32 port map(sel=>ctrl_out, src0=>adder_out1, src1=>adder_out2, z=>mux_out);
ctrl_unit: and_gate port map(x=>branch, y=>zero, z=>ctrl_out);
addr<= pc_out;

end architecture struct;
		