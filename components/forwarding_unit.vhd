library ieee;
use ieee.std_logic_1164.all;
--use work.eecs361.all;
--use work.eecs361_gates.all;
use work.all;

entity forwarding_unit is
	port (rs_ID_EX: in std_logic_vector (4 downto 0);
		  rt_ID_EX: in std_logic_vector (4 downto 0);
		  rd_EX_MEM: in std_logic_vector (4 downto 0);
		  rd_MEM_WB : in std_logic_vector (4 downto 0);
		  WriteEnable_EX_MEM, WriteEnable_MEM_WB, EXMEM_MemToReg: in std_logic;
		  A, B : out std_logic_vector(1 downto 0);
		  stallF : out std_logic
	);
end entity forwarding_unit;


architecture structural of forwarding_unit is

component not_zero_compare is
	port (a: in std_logic_vector( 4 downto 0);
		  b: out std_logic
	);
end component;

component equality_checker is
	port (a,b: in std_logic_vector( 4 downto 0);
		  c: out std_logic
	);
end component equality_checker;

component and_gate is
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

component or_gate is
  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : out std_logic
  );
end component;




 
signal a0, a1,a2,a3: std_logic;
signal b0, b1, b2, b3, b4, b5: std_logic;

signal c0, c1,c2,c3,c4,c5,c6: std_logic;

signal d0,d1,d2,d3,d4,d5:std_logic;
signal stall_1,stall_0,stall: std_logic;
begin

-- forward A



	nz0: not_zero_compare port map(rd_EX_MEM, a0);
	ec0: equality_checker port map(rd_EX_MEM, rs_ID_EX, a1);
	and0: and_gate port map(a0, a1, a2);
	and1: and_gate port map(WriteEnable_EX_MEM, a2, a3); -- a4 means ex hazard FA=10


	n0: not_gate port map(a3,b0); -- not a ex  hazard
	nz1: not_zero_compare port map(rd_EX_MEM, b1);
	ec3: equality_checker port map(rd_MEM_WB, rs_ID_EX, b2);

	and4: and_gate port map(WriteEnable_MEM_WB, b1, b3);
	and5: and_gate port map(b3, b0, b4);
	and6: and_gate port map(b4, b2, b5); --b9 means mem hazard FA=01

	--A(1)<= a3;
	
	A(0)<= b5;
	A(1)<= a3;
	
		
	--	-- second alu register
	nz2: not_zero_compare port map(rd_EX_MEM, c0);
	ec4: equality_checker port map(rd_EX_MEM, rt_ID_EX, c1);
	and7: and_gate port map(WriteEnable_EX_MEM, c0, c2);
	and8: and_gate port map(c2, c1, c3);


	n1: not_gate port map (c3, d0);
	nz3: not_zero_compare port map (rd_MEM_WB, d1);
	ec5: equality_checker port map(rd_MEM_WB, rt_ID_EX, d2);
	and9: and_gate port map(d0, d1, d4);
	and10: and_gate port map(d4,d2, d5);

	B(1) <= c3;
	B(0)<=d5;

	

stall0 : and_gate port map(a3, EXMEM_MemToReg, stall_0);
	stall1 : and_gate port map(c3, EXMEM_MemToReg, stall_1);
	stall2 : or_gate port map(stall_0, stall_1, stall);
	stallF<=stall;

end structural;