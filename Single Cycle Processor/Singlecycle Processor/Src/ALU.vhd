library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;
entity ALU is 
port(
	A: in std_logic_vector (31 downto 0);
	B: in std_logic_vector(31 downto 0);
	ctrl: in std_logic_vector(2 downto 0);
	carryOut: out std_logic;
	overFlow: out std_logic;
	zero: out std_logic;
	result: out std_logic_vector(31 downto 0)
	);

end entity ALU;

architecture structural of ALU is

signal carryOutAdd: std_logic;
signal overflowAdd: std_logic;
signal resultAdd: std_logic_vector(31 downto 0);

signal carryOutSub: std_logic;
signal overflowSub: std_logic;
signal resultSub: std_logic_vector(31 downto 0);


signal resultAnd: std_logic_vector(31 downto 0);
signal resultXor: std_logic_vector(31 downto 0);
signal resultOr: std_logic_vector(31 downto 0);
signal resultSll: std_logic_vector(31 downto 0);
signal resultSlt: std_logic_vector(31 downto 0);
signal resultSltu: std_logic_vector(31 downto 0);
signal tempResult: std_logic_vector(31 downto 0);

signal addOrSub: std_logic;

signal o1, o2,o3,o4,o5,o6: std_logic;
signal notCarryOutSub: std_logic;

begin

--For choosing which overflow and carryOut signal to use
--The only two options for which operation it would come from
--is addition or subtraction.
--I check if its addition whose opcode is "010"
--Then I use that result as a selector for the muxes
--to choose whether to output the addOverflow and carryout or the subtraction ones
ctrl1: not_gate port map(ctrl(0), o1);
ctrl2: not_gate port map(ctrl(2), o2);
ctrl3: and_gate port map(o1, o2, o3);
ctrl4: and_gate port map(o3, ctrl(1), addOrSub);



result<= tempResult;

--Multiplexers to choose which operation should be outputed.
muxResult: mux_4 generic map(n => 32)
		port map(
			sel    => ctrl,
			addOp  => resultAdd,
			subOp  => resultSub,
			andOp  => resultAnd,
			orOp   => resultOr,
			sllOp  => resultSll,
			sltOp  => resultSlt,
			sltuOp => resultSltu,
			Result => tempResult
			);


muxCarryOut: mux 
		port map(
			sel    => addOrSub,
			src0  => carryOutSub,
			src1  => carryOutAdd,
			z => carryOut
			);

muxOverflow: mux
		port map(
			sel   => addOrSub,
			src0  => overflowSub,
			src1  => overflowAdd,
			z => overFlow
			);

--calculating the zero value from the result that will be outputed of the ALU
zeroPort: zeroDetector port map(tempResult, zero);



--Each operation has its own entity

andOperation: and_gate_32 port map(A, B, resultAnd);
orOperation: or_gate_32 port map(A,B, resultOr);



addEntity: adder32 port map(A=>A, B=>B, carryIn=> '0', carryOut=>carryOutAdd, overFlow=>overflowAdd,  result=>resultAdd);
subEntity: sub32 port map(A=>A, B=>B, carryOut=>carryOutSub, overFlow=>overflowSub,  result=>resultSub);
resultSlt<= (0=> resultSub(31), others=>'0');

notCarry: not_gate port map(carryOutSub, notCarryOutSub);
resultSltu<= (0=>notCarryOutSub, others=>'0');

sllEntity: SLLmod port map (A=>B, B=>A,  result=>resultSll);


end architecture structural;

