library ieee;
use ieee.std_logic_1164.all;

entity ALU_1 is
    port(
        opA      : in std_logic;
        opB      : in std_logic;
       -- shifts : in natural ;
        carryin : in std_logic;
        --setlessbit : out std_logic;
        op_sel       : in std_logic_vector(3  downto 0);
        carryout : out std_logic;
        overflow : out std_logic;
        result   : out std_logic
        );
end entity; 

architecture structure of ALU_1 is


   signal result_add    : std_logic;
   signal carryout_add  : std_logic;
   signal overflow_add  : std_logic;
   
   signal result_sub    : std_logic;
   signal carryout_sub  : std_logic;
   signal overflow_sub  : std_logic;
   
   signal result_and    : std_logic;
   signal result_xor    : std_logic;
   signal result_or     : std_logic;
   
 
    
   signal result_slt    : std_logic;
   signal overflow_slt  : std_logic;
   signal result_sltu   : std_logic;
   signal overflow_sltu : std_logic;
   
   --signal result_s      : std_logic_vector(31 downto 0);
component add
     port (
       a          : in  std_logic;
       b          : in  std_logic;
       carryin    : in  std_logic;
       result     : out std_logic;
       carryout   : out std_logic;
       overflow   : out std_logic
     );
   end component;
   
   component sub
     port (
       a          : in  std_logic;
       b          : in  std_logic;
       carryin    : in  std_logic;
       result     : out std_logic;
       carryout   : out std_logic;
       overflow   : out std_logic
     );
   end component;
   
   component and_gate
     port (
       x   : in  std_logic;
       y   : in  std_logic;
       z   : out std_logic
     );
   end component;
   
   component xor_gate
       port (
         x   : in  std_logic;
         y   : in  std_logic;
         z   : out std_logic
       );
   end component;
   
   component or_gate
       port (
         x   : in  std_logic;
         y   : in  std_logic;
         z   : out std_logic
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

   

   begin
 
   		 add1: add port map(opA,opB,carryin,result_add,carryout_add,overflow_add);
   		 sub2: sub port map(opA,opB,carryin,result_sub,carryout_sub,overflow_sub);
   		 and1: and_gate port map(opA,opB,result_and);
   		 xor1: xor_gate port map(opA,opB,result_xor);
   	   or1: or_gate port map(opA,opB,result_or);
   		--sll32: shiftleftl port map(opA,shifts,result_sll);
					
   		--slt: slt1 port map(opA,opB,result_slt,overflow_slt,setlessbit);
   							
		-- sltu1: sltu port map(opA,opB,result_sltu,overflow_sltu);
      final_res : nl_mux_1 port map(result_add,result_sub,'0','0',result_or,result_and,result_xor,'0',op_sel,result);
     final_overflow: nl_mux_1 port map(overflow_add,overflow_sub,'0','0','0','0','0','0',op_sel,overflow);
	final_carry : nl_mux_1 port map(carryout_add,carryout_sub,'0','0','0','0','0','0',op_sel,carryout);
end architecture structure;