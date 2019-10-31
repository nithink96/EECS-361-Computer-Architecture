library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;

entity sub32 is 
port(
	A: in std_logic_vector (31 downto 0);
	B: in std_logic_vector(31 downto 0);
	carryOut: out std_logic;
	overFlow: out std_logic;
	result: out std_logic_vector(31 downto 0)
	);
end entity sub32;

architecture structural of sub32 is
	signal notB: std_logic_vector(31 downto 0);
	signal notA1: std_logic;
	signal notB1: std_logic;
	signal notR1: std_logic;

	signal o1: std_logic;
	signal o2: std_logic;
	signal o3: std_logic;
	signal o4: std_logic;
	signal o5: std_logic;

	signal temp_result: std_logic_vector(31 downto 0);
	signal overFlowCase1: std_logic;
	signal overFlowCase2: std_logic;
begin

	result<=temp_result;

	not1: not_gate_32 port map(B, notB);
	not2: not_gate port map(A(31), notA1);
	not3: not_gate port map(B(31), notB1);
	not4: not_gate port map(temp_result(31), notR1);

	and1: and_gate port map(notA1, B(31), o1);
	and2: and_gate port map(o1, temp_result(31), o2);

	and3: and_gate port map(A(31), notB1, o3);
	and4: and_gate port map(o3, notR1, o4);

	or1: or_gate port map( o2, o4, overFlow);

	--setting the overflow for the subtraction cases
	--overFlowCase1 <= not(A(31)) and B(31) and temp_result(31);
	--overFlowCase2 <= A(31) and not(B(31)) and not(temp_result(31));
	--overFlow <=overFlowCase1 or overFlowCase2; 

	--Subtraction is done by taking the inverted B signal and using a 1 as the Cin input
	--of the first adder
	usingAdder: adder32 port map(A=>A, B=>notB, carryIn=> '1', carryOut=>carryOut, overFlow=>overFlow,  result=>temp_result);	
end architecture structural;
