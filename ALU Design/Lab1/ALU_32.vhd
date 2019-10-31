library ieee;
use ieee.std_logic_1164.all;

entity ALU_32 is
    port(
        opA      : in std_logic_vector(31 downto 0);
        opB      : in std_logic_vector(31 downto 0);
        shifts : in natural ;
        carryin : in std_logic;
        setlessbit : out std_logic;
        op_sel       : in std_logic_vector(3  downto 0);
        carryout : out std_logic;
        overflow : out std_logic;
        result   : out std_logic_vector(31 downto 0)
        );
end entity; 
architecture structure of ALU_32 is

   signal result_add    : std_logic_vector(31 downto 0);
   signal carryout_add  : std_logic;
   signal overflow_add  : std_logic;
   
   signal result_sub    : std_logic_vector(31 downto 0);
   signal carryout_sub  : std_logic;
   signal overflow_sub  : std_logic;
   
   signal result_and    : std_logic_vector(31 downto 0);
   signal result_xor    : std_logic_vector(31 downto 0);
   signal result_or     : std_logic_vector(31 downto 0);
   
   signal result_sll    : std_logic_vector(31 downto 0);
   signal overflow_sll  : std_logic;
    
   signal result_slt    : std_logic_vector(31 downto 0);
   signal overflow_slt  : std_logic;
   signal result_sltu   : std_logic_vector(31 downto 0);
   signal overflow_sltu : std_logic;
   signal setlessbit1 : std_logic;
   signal setlessbit2 : std_logic;
   
   --signal result_s      : std_logic_vector(31 downto 0);
component add_32
     port (
       a          : in  std_logic_vector (31 downto 0);
       b          : in  std_logic_vector (31 downto 0);
       carryin    : in  std_logic;
       result     : out std_logic_vector (31 downto 0);
       carryout   : out std_logic;
       overflow   : out std_logic
     );
   end component;
   
   component sub_32
     port (
       a          : in  std_logic_vector (31 downto 0);
       b          : in  std_logic_vector (31 downto 0);
       carryin    : in  std_logic;
       result     : out std_logic_vector (31 downto 0);
       carryout   : out std_logic;
       overflow   : out std_logic
     );
   end component;
   
   component and_gate_32
     port (
       x   : in  std_logic_vector(31 downto 0);
       y   : in  std_logic_vector(31 downto 0);
       z   : out std_logic_vector(31 downto 0)
     );
   end component;
   
   component xor_gate_32
       port (
         x   : in  std_logic_vector(31 downto 0);
         y   : in  std_logic_vector(31 downto 0);
         z   : out std_logic_vector(31 downto 0)
       );
   end component;
   
   component or_gate_32
       port (
         x   : in  std_logic_vector(31 downto 0);
         y   : in  std_logic_vector(31 downto 0);
         z   : out std_logic_vector(31 downto 0)
       );
   end component;
   
   
   component shiftleftl
       port(
           a      : in std_logic_vector(31 downto 0);
           b      :  in natural;
           result : out std_logic_vector(31 downto 0)
       );
   end component;
   
   component slt
       port(
           a          : in  std_logic_vector (31 downto 0);
           b          : in  std_logic_vector (31 downto 0);
           result   : out std_logic_vector (31 downto 0);
           overflow   : out std_logic;
	  setlessbit : out std_logic
         );
   end component;
   
   component sltu
       port(
           a          : in  std_logic_vector (31 downto 0);
           b          : in  std_logic_vector (31 downto 0);
           result    : out std_logic_vector (31 downto 0);
           overflow   : out std_logic;
		setlessbit: out std_logic
         );
   end component;
	component nl_mux_1 is
port(
		
		res1 : in std_logic;
		res2 : in std_logic;
		res3 : in std_logic;
		res4 : in std_logic;
		res5 : in std_logic;
		res6 : in std_logic;
		res7 : in std_logic;
		res8 : in std_logic;
		op_sel : in std_logic_vector(3 downto 0);
		res_o : out std_logic 
	);
	end component nl_mux_1;
component nl_mux_32 is
port(
		
		res1 : in std_logic_vector(31 downto 0);
		res2 : in std_logic_vector(31 downto 0);
		res3 : in std_logic_vector(31 downto 0);
		res4 : in std_logic_vector(31 downto 0);
		res5 : in std_logic_vector(31 downto 0);
		res6 : in std_logic_vector(31 downto 0);
		res7 : in std_logic_vector(31 downto 0);
		res8 : in std_logic_vector(31 downto 0);
		op_sel : in std_logic_vector(3 downto 0);
		res_o : out std_logic_vector(31 downto 0) 
	);
	end component nl_mux_32;

   

   begin
  -- case op_sel is
   		 add: add_32 port map(opA,opB,carryin,result_add,carryout_add,overflow_add);
   		 sub: sub_32 port map(opA,opB,carryin,result_sub,carryout_sub,overflow_sub);
   		 and32: and_gate_32 port map(opA,opB,result_and);
   		 xor32: xor_gate_32 port map(opA,opB,result_xor);
   	   or32: or_gate_32 port map(opA,opB,result_or);
   		sll32: shiftleftl port map(opA,shifts,result_sll);
					
   		slt1: slt port map(opA,opB,result_slt,overflow_slt,setlessbit1);
   							
		 sltu1: sltu port map(opA,opB,result_sltu,overflow_sltu,setlessbit2);
     final_res : nl_mux_32 port map(result_add,result_sub,result_slt,result_sltu,result_or,result_and,result_xor,result_sll,op_sel,result);
     final_overflow: nl_mux_1 port map(overflow_add,overflow_sub,overflow_slt,overflow_sltu,'0','0','0','0',op_sel,overflow);
	final_carry : nl_mux_1 port map(carryout_add,carryout_sub,'0','0','0','0','0','0',op_sel,carryout);
	setlessbit<=setlessbit1 when op_sel<="0010" else
		setlessbit2 when op_sel<="0011" ;
end architecture structure;
