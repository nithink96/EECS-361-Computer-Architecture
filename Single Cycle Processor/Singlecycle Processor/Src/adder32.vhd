library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;
use work.eecs361_gates.all;

entity adder32 is 
port(
	A: in std_logic_vector (31 downto 0);
	B: in std_logic_vector(31 downto 0);
	carryIn: in std_logic;
	carryOut: out std_logic;
	overFlow: out std_logic;
	result: out std_logic_vector(31 downto 0)
	);

end entity adder32;

architecture structural of adder32 is
	--Using adders for each bit of the operation
	component fullAdder is
		port(
		a: in std_logic;
		b: in std_logic;
		cin: in std_logic;
		sum: out std_logic;
		carry: out std_logic
		);
	end component fullAdder;


	signal temp_cout: std_logic_vector(30 downto 0);
	signal temp_result: std_logic_vector(31 downto 0);
	signal overFlowCase1: std_logic;
	signal overFlowCase2: std_logic;

	signal t:std_logic;
	signal s:std_logic;
	signal x:std_logic;
	signal y:std_logic;
	signal notA:std_logic;
	signal notB: std_logic;
	signal notC:std_logic;
begin
	result<=temp_result;
  	no1: not_gate port map(A(31), notA);
  	no2: not_gate port map(B(31), notB);
  	no3: not_gate port map(temp_result(31), notC);

  	case1: and_gate port map(notA, notB, t);
  	case2: and_gate port map(t, temp_result(31), overFlowCase1);

  	case3: and_gate port map(A(31), B(31), x);
  	case4: and_gate port map(x, notC, overFlowCase2);

  	case5: or_gate port map(overFlowCase1, overFlowCase2, overFlow);
	--calculating the overflow cases of addition
	
	--overFlowCase1 <= not(A(31)) and not(B(31)) and temp_result(31);
	--overFlowCase2 <= A(31) and B(31) and not(temp_result(31));
	--overFlow<= overFlowCase1 or overFlowCase2;

	--putting the bits through the adders
	add0:  fullAdder port map(A(0), B(0), carryIn, temp_result(0), temp_cout(0));
	add1:  fullAdder port map(A(1), B(1), temp_cout(0) , temp_result(1), temp_cout(1));
	add2:  fullAdder port map(A(2), B(2), temp_cout(1) , temp_result(2), temp_cout(2));
	add3:  fullAdder port map(A(3), B(3), temp_cout(2) , temp_result(3), temp_cout(3));
	add4:  fullAdder port map(A(4), B(4), temp_cout(3) , temp_result(4), temp_cout(4));
	add5:  fullAdder port map(A(5), B(5), temp_cout(4) , temp_result(5), temp_cout(5));
	add6:  fullAdder port map(A(6), B(6), temp_cout(5) , temp_result(6), temp_cout(6));
	add7:  fullAdder port map(A(7), B(7), temp_cout(6) , temp_result(7), temp_cout(7));
	add8:  fullAdder port map(A(8), B(8), temp_cout(7) , temp_result(8), temp_cout(8));
	add9:  fullAdder port map(A(9), B(9), temp_cout(8) , temp_result(9), temp_cout(9));
	add10: fullAdder port map(A(10), B(10), temp_cout(9) , temp_result(10), temp_cout(10));
	add11: fullAdder port map(A(11), B(11), temp_cout(10) , temp_result(11), temp_cout(11));
	add12: fullAdder port map(A(12), B(12), temp_cout(11) , temp_result(12), temp_cout(12));
	add13: fullAdder port map(A(13), B(13), temp_cout(12) , temp_result(13), temp_cout(13));
	add14: fullAdder port map(A(14), B(14), temp_cout(13) , temp_result(14), temp_cout(14));
	add15: fullAdder port map(A(15), B(15), temp_cout(14) , temp_result(15), temp_cout(15));
	add16: fullAdder port map(A(16), B(16), temp_cout(15) , temp_result(16), temp_cout(16));
	add17: fullAdder port map(A(17), B(17), temp_cout(16) , temp_result(17), temp_cout(17));
	add18: fullAdder port map(A(18), B(18), temp_cout(17) , temp_result(18), temp_cout(18));
	add19: fullAdder port map(A(19), B(19), temp_cout(18) , temp_result(19), temp_cout(19));
	add20: fullAdder port map(A(20), B(20), temp_cout(19) , temp_result(20), temp_cout(20));
	add21: fullAdder port map(A(21), B(21), temp_cout(20) , temp_result(21), temp_cout(21));
	add22: fullAdder port map(A(22), B(22), temp_cout(21) , temp_result(22), temp_cout(22));
	add23: fullAdder port map(A(23), B(23), temp_cout(22) , temp_result(23), temp_cout(23));
	add24: fullAdder port map(A(24), B(24), temp_cout(23) , temp_result(24), temp_cout(24));
	add25: fullAdder port map(A(25), B(25), temp_cout(24) , temp_result(25), temp_cout(25));
	add26: fullAdder port map(A(26), B(26), temp_cout(25) , temp_result(26), temp_cout(26));
	add27: fullAdder port map(A(27), B(27), temp_cout(26) , temp_result(27), temp_cout(27));
	add28: fullAdder port map(A(28), B(28), temp_cout(27) , temp_result(28), temp_cout(28));
	add29: fullAdder port map(A(29), B(29), temp_cout(28) , temp_result(29), temp_cout(29));
	add30: fullAdder port map(A(30), B(30), temp_cout(29) , temp_result(30), temp_cout(30));
	add31: fullAdder port map(A(31), B(31), temp_cout(30) , temp_result(31), carryOut);
end architecture structural;


library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;

entity fullAdder is
port(
	a: in std_logic;
	b: in std_logic;
	cin: in std_logic;
	sum: out std_logic;
	carry: out std_logic
	);
end entity fullAdder;

architecture structural of fullAdder is

signal bAndCin: std_logic;
signal aAndCin: std_logic;
signal aAndB: std_logic;
signal bCinOraCin: std_logic;
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

	signal notA:std_logic;
	signal notB: std_logic;
	signal notC: std_logic;
	signal aAndnotB: std_logic;
	signal aAndnotBandnotC: std_logic;

	signal notAandB:std_logic;
	signal notAandBandNotC: std_logic;

	signal notAandNotB: std_logic;
	signal notAandNotBandC: std_logic;

	signal AandBandC: std_logic;

	signal or1:std_logic;
	signal or2: std_logic;
	signal or3: std_logic;


begin
	a1: and_gate port map(b, cin, bAndCin);
	a2: and_gate port map(a, cin, aAndCin);
	a3: and_gate port map(a, b, aAndB);
	o1: or_gate port map(bAndCin, aAndCin, bCinOraCin);
	o2: or_gate port map(bCinOraCin, aAndB, carry);

	--carry<= (b and cin) or ( a and cin) or (a and b);
	


	n1: not_gate port map(b, notB);
	n2: not_gate port map(a, notA);
	n3: not_gate port map(cin, notC);

	a4: and_gate port map(a, notB, aAndnotB);
	a5: and_gate port map(aAndnotB, notC, aAndnotBandnotC);

	a6: and_gate port map(notA, b,  notAandB);
	a7: and_gate port map(notAandB, notC, notAandBandNotC);

	a8: and_gate port map(notA, notB, notAandNotB);
	a9: and_gate port map(notAandNotB, cin,  notAandNotBandC);

	a11: and_gate port map(AandB, cin, AandBandC);

	o3: or_gate port map(aAndnotBandnotC,notAandBandNotC, or1 );
	o4: or_gate port map(or1,notAandNotBandC, or2  );
	o5: or_gate port map(or2, AandBandC, sum);


	--sum <= (a and not(b) and not(cin)) or (not(a) and b and not(cin)) or (not(a) and not(b) and cin) or (a and b and cin);

end architecture structural;

