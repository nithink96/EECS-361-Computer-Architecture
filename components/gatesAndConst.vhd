library IEEE;
use IEEE.std_logic_1164.all;
--Additional standard or custom libraries go here if needed
package gatesAndConst is

component mux_4 is
generic( n: integer );
port(
	sel: in std_logic_vector(2 downto 0);
	addOp: in std_logic_vector(n-1 downto 0);
	subOp: in std_logic_vector(n-1  downto 0);
	andOp: in std_logic_vector(n-1  downto 0);
	orOp: in std_logic_vector(n-1  downto 0);
	sllOp: in std_logic_vector(n-1  downto 0);
	sltOp: in std_logic_vector(n-1  downto 0);
	sltuOp: in std_logic_vector(n-1  downto 0);
	Result: out std_logic_vector(n-1  downto 0)
	);
end component mux_4;
  
component adder32 is
port(
	A: in std_logic_vector (31 downto 0);
	B: in std_logic_vector(31 downto 0);
	carryIn: in std_logic;
	carryOut: out std_logic;
	overFlow: out std_logic;

	result: out std_logic_vector(31 downto 0)
	);

end component adder32;

component sub32 is
port(
	A: in std_logic_vector (31 downto 0);
	B: in std_logic_vector(31 downto 0);
	carryOut: out std_logic;
	overFlow: out std_logic;
	result: out std_logic_vector(31 downto 0)
	);
end component sub32;

component SLLmod is 
port(
	A: in std_logic_vector (31 downto 0);
	B: in std_logic_vector(31 downto 0);
	result: out std_logic_vector(31 downto 0)
	);
end component SLLmod;

component mux is
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic;
	src1  :	in	std_logic;
	z	  : out std_logic
  );
end component mux;

component mux_n is
  generic (
	n	: integer
  );
  port (
	sel	  : in	std_logic;
	src0  :	in	std_logic_vector(n-1 downto 0);
	src1  :	in	std_logic_vector(n-1 downto 0);
	z	  : out std_logic_vector(n-1 downto 0)
  );
end component mux_n;

component zeroDetector is
	port( a: in std_logic_vector (31 downto 0);
  		b: out std_logic);
end component zeroDetector;

constant AND_OP : std_logic_vector :=  "000";
constant OR_OP : std_logic_vector :=   "001";
constant ADD_OP : std_logic_vector :=  "010";
constant SLTU_OP : std_logic_vector := "011";
constant SLL_OP : std_logic_vector :=  "100";
constant SUB_OP : std_logic_vector :=  "110";
constant SLT_OP : std_logic_vector :=  "111";

--constant XOR_OP : std_logic_vector := "0011";

end package gatesAndConst;
package body gatesAndConst is
end package body gatesAndConst;