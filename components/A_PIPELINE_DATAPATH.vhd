library ieee;
USE ieee.std_logic_1164.all;
use work.eecs361_gates.all;
use work.eecs361.all;

entity A_pipeline_datapath is
generic (mem_file: string);
port(
clk: in std_logic;
reset: in std_logic;
start: in std_logic
);
end A_pipeline_datapath;

architecture structural of A_pipeline_datapath is

component Register_IF_ID is 
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
end component;

component Register_ID_EX is
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
end component;

component Register_EX_MEM is
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
end component;



component Register_MEM_WB is
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
end component;

component full_adder_32bit is
  port (
    x     : in std_logic_vector(31 downto 0);
    y     : in std_logic_vector(31 downto 0);
    cin   : in std_logic;
    z     : out std_logic_vector(31 downto 0);
    cout  : out std_logic;
    ovf  : out std_logic
  );
end component;

component ALU is
  port (
	ctrl   : in  std_logic_vector(2 downto 0);
	A  : in  std_logic_vector(31 downto 0);
	B  : in  std_logic_vector(31 downto 0);
	shamt: in  std_logic_vector(4 downto 0);
	cout : out std_logic; -- '1' for carry out
	ovf : out std_logic; -- '1' for overflow
	ze : out std_logic; -- '1' is zero
	R  : out  std_logic_vector(31 downto 0)
  );
end component;

component adder_32 is
port (
		a, b : in std_logic_vector(31 downto 0);
		z : out std_logic_vector(31 downto 0)
		);
end component;


component ALUCU is
    Port ( ALUOp : in  STD_LOGIC_VECTOR (2 downto 0);
           func : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUCtr : out  STD_LOGIC_VECTOR (2 downto 0));
end component;

component ControlUnit is
    Port ( OPcode : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOp : out  STD_LOGIC_VECTOR (2 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
	   BranchNE : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
	   BranchTZ : out  STD_LOGIC;
	   ExtOP:out  STD_LOGIC 
);
end component;

component next_address_logic is
port (
		clk, branch, zero, rst,start: in std_logic; 
		instruction : in std_logic_vector(15 downto 0);
		addr : out std_logic_vector(31 downto 0)
		);
end component;


component Extender is
port (
		imm16_in_ex : in std_logic_vector(15 downto 0);
		imm16_out_ex : out std_logic_vector(31 downto 0)
		);
end component;

component mux4to1 is
port(
		sel: in std_logic_vector(1 downto 0);
		src_0: in std_logic_vector(31 downto 0);
		src_1: in std_logic_vector(31 downto 0);
		src_2: in std_logic_vector(31 downto 0);
		src_3: in std_logic_vector(31 downto 0);
		z: out std_logic_vector(31 downto 0)
		);
end component;

component data_mem is 
generic (data_mem_file: string );
port(
clk, MemWr, output_en: in std_logic;
data_in, address: in std_logic_vector(31 downto 0);
data_out: out std_logic_vector(31 downto 0));
end component;

component inst_mem is 
generic (
		mem_file : string
	  );
port(
Adr: in std_logic_vector(31 downto 0); 
opcode, func: out std_logic_vector(5 downto 0);
Rs, Rt, Rd, shamt: out std_logic_vector(4 downto 0);
imm16: out std_logic_vector(15 downto 0));
end component;

component pc is 
port (
		clk : in std_logic; 
		rst : in std_logic;
		start: in std_logic;
		input : in std_logic_vector(31 downto 0); 
		output : out std_logic_vector(31 downto 0)
		);
end component;

component mux_5 is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic_vector(4 downto 0);
	src1  : in  std_logic_vector(4 downto 0);
	z	    : out std_logic_vector(4 downto 0)
  );
end component;
component register_file is
     port(
	 clk: in std_logic;
	 reset: in std_logic;
	 write_enable: in std_logic;
	 Ra : in std_logic_vector(4 downto 0);
	 Rb : in std_logic_vector(4 downto 0);
	 Rw : in std_logic_vector(4 downto 0);
         data_in: in std_logic_vector(31 downto 0):=(others=>'0');
         outA: out std_logic_vector(31 downto 0);
	 outB: out std_logic_vector(31 downto 0));
end component;

component sign_ext is
port (
		imm16 : in std_logic_vector(15 downto 0);
		output : out std_logic_vector(31 downto 0)
		);
end component;

component mux is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic;
	src1  : in  std_logic;
	z	    : out std_logic
  );
end component;

component DelayUnit is
  port (
	clk	      : in  std_logic;
   reset      : in  std_logic;
   delay_in	 : in  std_logic;
   delay_out	: out std_logic
  );
end component;

component forwarding_unit is
	port (rs_ID_EX: in std_logic_vector (4 downto 0);
		  rt_ID_EX: in std_logic_vector (4 downto 0);
		  rd_EX_MEM: in std_logic_vector (4 downto 0);
		  rd_MEM_WB : in std_logic_vector (4 downto 0);
		  WriteEnable_EX_MEM, WriteEnable_MEM_WB , EXMEM_MemtoReg: in std_logic;
		  A, B : out std_logic_vector(1 downto 0);
		  stallF: out std_logic
	);
end component forwarding_unit;

component mux_3to1 is
  port (
	sel0	  : in	std_logic;
	sel1	  : in	std_logic;
	src0  :	in	std_logic;
	src1  :	in	std_logic;
	src2  :	in	std_logic;
	z	  : out std_logic
  );
end component mux_3to1;

component mux_3to1_n is
  generic (
	n	: integer
  );
  port (
	sel0	  : in	std_logic;
	sel1	  : in	std_logic;
	src0  :	in	std_logic_vector(n-1 downto 0);
	src1  :	in	std_logic_vector(n-1 downto 0);
	src2  :	in	std_logic_vector(n-1 downto 0);
	z	  : out std_logic_vector(n-1 downto 0)
  );
end component mux_3to1_n;

component mux_32 is
  port (
	sel   : in  std_logic;
	src0  : in  std_logic_vector(31 downto 0);
	src1  : in  std_logic_vector(31 downto 0);
	z	    : out std_logic_vector(31 downto 0)
  );
end component;

component stall_generate is
port(
clk : in std_logic;
reset : in std_logic;
opcode : in std_logic_vector(5 downto 0):=(others=>'0');
stall_signal : out std_logic
);
end component;

signal instAddress, pc_plus4,pc_plus4_out,nextAddress,branchaddress :std_logic_vector (31 downto 0);
signal opcode, func ,opcode_out, func_out:std_logic_vector (5 downto 0);
signal Rs, Rt, Rd, shamt,Rs_out,Rt_out,Rd_out,shamt_out:std_logic_vector (4 downto 0);
signal imm16,imm16_out :std_logic_vector (15 downto 0);
signal pcsel,FwdStall :std_logic:='0';
signal IF_ID_write_enable :std_logic; --used for stall
signal tempALUOp,tempALUctr: STD_LOGIC_VECTOR (2 downto 0);
signal tempRegDst,tempALUSrc,tempMemToReg,tempRegWrite,tempMemRead,tempMemWrite ,tempBranchNE ,tempBranch ,tempBranchTZ ,tempExtOP,Reg_clk :std_logic;
signal tempA,tempB : std_logic_vector(31 downto 0);
signal killctr: std_logic:='0';
signal Branch: std_logic;
--signal IDEX_pc,IDEX_pc_out, IDEX_result, IDEX_tempA, IDEX_tempB: std_logic_vector(31 downto 0);
--signal IDEX_imm16: std_logic_vector(15 downto 0);
--signal IDEX_Rs, IDEX_Rt, IDEX_Rd, IDEX_Rw, IDEX_shamt: std_logic_vector(4 downto 0);
--signal IDEX_ALUCtr,IDEX_ALUOp: std_logic_vector(2 downto 0);
--signal IDEX_ExtOp, IDEX_ALUSrc, IDEX_RegDst, IDEX_MemRead, IDEX_zero, IDEX_MemWrite, IDEX_BranchNE, IDEX_Branch, IDEX_BranchTZ, IDEX_MemToReg, IDEX_RegWr: std_logic;

signal EX_pc, EX_result, EX_tempA, EX_tempB,EX_eximm32,signEX_imm32, EX_imm32, MUX_EX_imm32, opA, opB: std_logic_vector(31 downto 0);
signal EX_imm16: std_logic_vector(15 downto 0);
signal EX_Rs, EX_Rt, EX_Rd, EX_Rw, EX_shamt: std_logic_vector(4 downto 0);
signal EX_ALUctr,EX_ALUOp: std_logic_vector(2 downto 0);
signal A,B: std_logic_vector(1 downto 0);
signal EX_ExtOp, EX_ALUSrc, EX_RegDst, EX_MemRead, EX_zero, EX_MemWr, EX_BranchNE, EX_Branch, EX_BranchTZ, EX_MemToReg, EX_RegWr, EX_carryout, EX_overflow, Nzero, EX_carryout_not, Branch_out, BTZ_out_1, BranchTZ_out, BranchNE_out, Btemp, EX_BranchTaken: std_logic;
signal MEM_PC, MEM_result, MEM_tempB, MEM_MemOut, MEM_Forward: std_logic_vector(31 downto 0):= (others=>'0');
signal MEM_Rw: std_logic_vector(4 downto 0);
signal MEM_MemRead,  MEM_MemWr, MEM_MemToReg, MEM_RegWr, Mem_MemRw, MEM_MemClk: std_logic;

--signal EXMEM_zero,EXMEM_MemRead,EXMEM_MemWrite,EXMEM_MemToReg,EXMEM_Branch,EXMEM_BranchNE,EXMEM_BranchTZ,EXMEM_RegWr:std_logic;
signal WB_MemOut, WB_result, WB_data_in: std_logic_vector(31 downto 0);
signal WB_Rw: std_logic_vector(4 downto 0);
signal WB_MemToReg, WB_RegWr: std_logic;
signal stallF: std_logic:='0';
signal adder_shift: std_logic_vector(31 downto 0);
signal stall_signal :std_logic;


begin
--IF STAGE
--w1: next_address_logic port map(clk,EX_BranchTaken,EX_BranchTaken,reset,start,imm16,instAddress);
w1:  mux_32 port map(EX_BranchTaken,pc_plus4,branchaddress,nextAddress);
w2:  pc port map(clk, reset, start, nextAddress, instAddress);
w3:  inst_mem generic map (mem_file=>mem_file)
             port map (instAddress, opcode, func, Rs, Rt, Rd, shamt, imm16);
w4:  full_adder_32bit port map (cin=>'0', x=>instAddress, y=>x"00000004", z=>pc_plus4);
w5:  stall_generate port map(clk,reset,opcode,stall_signal);
w6:  Register_IF_ID port map(clk,stall_signal,pc_plus4,opcode,func,Rs,Rt,Rd,shamt,imm16,
             pc_plus4_out, opcode_out, func_out,Rs_out,Rt_out,Rd_out,shamt_out,imm16_out);


--ID STAGE
w7:  ControlUnit port map(opcode_out,tempALUOp,tempRegDst,tempALUSrc,tempMemToReg,
     tempRegWrite,tempMemRead,tempMemWrite ,tempBranchNE ,tempBranch ,tempBranchTZ,
     tempExtOP);
w11: sign_ext port map(imm16_out, signEX_imm32);
w8:  register_file port map(clk,reset,tempRegWrite,Rs_out, Rt_out, WB_Rw, WB_data_in, tempA,tempB);
w9:  ALUCU port map(tempALUOp, func_out, tempALUctr);
w10: register_ID_EX port map(clk,tempALUOp,tempRegDst,tempALUSrc,tempMemToReg,tempRegWrite,
     tempMemRead,tempMemWrite,tempBranchNE,tempBranch,tempBranchTZ,tempExtOP,shamt_out,
     pc_plus4_out,tempA,tempB,imm16_out,Rt_out,Rd_out,tempALUctr,
     
     EX_ALUOp,EX_RegDst,EX_ALUSrc,EX_MemToReg,EX_RegWr,EX_MemRead,EX_MemWr,EX_BranchNE,
     EX_Branch,EX_BranchTZ,EX_ExtOP,EX_shamt,EX_pc,EX_tempA,EX_tempB,EX_imm16,EX_Rt,EX_Rd,
     EX_ALUctr);
w20: and_gate PORT MAP(tempBranchNE, Nzero, BranchNE_out);
w21: and_gate PORT MAP(tempBranch, EX_zero, Branch_out);
w22: and_gate PORT MAP(tempBranchTZ, EX_carryout_not, BTZ_out_1);
w23: and_gate PORT MAP(BTZ_out_1, Nzero, BranchTZ_out);
w24: or_gate PORT MAP(BranchNE_out, Branch_out, Btemp);
w25: or_gate PORT MAP(BranchTZ_out, Btemp, EX_BranchTaken); 
adder_shift(31 downto 2)<=signEX_imm32(29 downto 0);
adder_shift(1 downto 0)<="00";

w27: adder_32 port map(pc_plus4_out,adder_shift,branchaddress);


--EX STAGE
--w11: sign_ext port map(EX_imm16, signEX_imm32);
w12: Extender port map(EX_imm16,EX_eximm32);
w13: mux_32 port map(EX_ExtOp,EX_eximm32,signEX_imm32,MUX_EX_imm32);
w14: mux_32 port map(EX_ALUSrc,EX_tempB,MUX_EX_imm32,EX_imm32);
w15: mux4to1 port map(A,EX_tempA,WB_data_in,MEM_Forward,
     "00000000000000000000000000000000",opA);
w16: mux4to1 port map(B,EX_imm32,WB_data_in,MEM_Forward,
     "00000000000000000000000000000000",opB);
w17: ALU port map(EX_ALUctr,opA,opB,EX_shamt,EX_carryout,EX_overflow,EX_zero,EX_result);
w18: not_gate port map(EX_zero,Nzero);
w19: not_gate port map(x=>EX_carryout,z=>EX_carryout_not);
--w20: and_gate PORT MAP(EX_BranchNE, Nzero, BranchNE_out);
--w21: and_gate PORT MAP(EX_Branch, EX_zero, Branch_out);
--w22: and_gate PORT MAP(EX_BranchTZ, EX_carryout_not, BTZ_out_1);
--w23: and_gate PORT MAP(BTZ_out_1, Nzero, BranchTZ_out);
--w24: or_gate PORT MAP(BranchNE_out, Branch_out, Btemp);
--w25: or_gate PORT MAP(BranchTZ_out, Btemp, EX_BranchTaken); 
w26: mux_5 port map(EX_RegDst, EX_Rt, EX_Rd, EX_Rw);

adder_shift(31 downto 2)<=signEX_imm32(29 downto 0);
adder_shift(1 downto 0)<="00";

--w27: adder_32 port map(EX_pc,adder_shift,branchaddress1);
--w28: and_gate port map(EX_BranchTaken,EX_Branch,Branch);
--branchaddress<=branchaddress1;
--Branch<=EX_BranchTaken;
--w111: mux_32 port map(EX_BranchTaken,"00000000000000000000000000000000",branchaddress1,branchaddress);
w29: Register_EX_MEM port map(clk,EX_result,EX_tempB,EX_Rw,EX_MemToReg,EX_RegWr,
     EX_MemRead,EX_MemWr,

     MEM_result,MEM_tempB,MEM_Rw,MEM_MemToReg,MEM_RegWr,MEM_MemRead,MEM_MemWr);



--MEM STAGE
w30: or_gate port map(MEM_MemWr,MEM_MemRead,MEM_MemRw);
w31: and_gate port map(clk,MEM_MemRw,MEM_MemClk);
w32: data_mem generic map(data_mem_file=>mem_file) 
              port map(MEM_MemClk, MEM_MemRead, MEM_MemWr, MEM_result, MEM_tempB, MEM_MemOut);
w33: mux_32 port map(MEM_MemToReg, MEM_result, MEM_MemOut, MEM_Forward);
w34: Register_MEM_WB port map(clk,MEM_result,MEM_MemOut,MEM_Rw,MEM_MemToReg,MEM_RegWr, 
     WB_result,WB_MemOut,WB_Rw,WB_MemToReg,WB_RegWr);




--WB STAGE
w35: mux_32 port map(WB_MemToReg, WB_result, WB_MemOut, WB_data_in);

Forwarding: forwarding_unit port map(EX_Rs, EX_Rt, MEM_Rw, WB_Rw, MEM_RegWr, WB_RegWr, MEM_MemToReg, A, B, stallF);

end architecture structural;




