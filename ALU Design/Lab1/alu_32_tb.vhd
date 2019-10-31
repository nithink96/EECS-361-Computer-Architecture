library ieee;
use ieee.std_logic_1164.all;

entity alu_32_tb is

end alu_32_tb;

architecture testbench of alu_32_tb is
    
signal OpA     : std_logic_vector(31 downto 0);
signal OpB     : std_logic_vector(31 downto 0);
signal opsel     : std_logic_vector(3  downto 0);
signal carryin : std_logic;
signal carryout : std_logic;
signal overflow: std_logic;
signal result  : std_logic_vector(31 downto 0);
signal setlessbit :std_logic;
signal shifts : natural;

component ALU_32
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
end component; 



begin
    
    a: ALU_32 port map (OpA, OpB,shifts,carryin,setlessbit,opsel, carryout, overflow, result);
    
testbench: process    
    begin
        --Add
        OpA <= "01100011000011000010000000000101";
        OpB <= "00000000000000000000000000000011";
	carryin<='1';
       opsel  <= "0000";
        wait for 10 ns;
        
        OpA <= "11111111111111111111111111111111";
        OpB <= "00000000000000000000000000000001";
	carryin<='0';
        opsel  <= "0000";
        wait for 10 ns;
        
        OpA <= "01100011000011000010000000000101";
        OpB <= "10000000000000000000000000000011";
	carryin<='1';
        opsel  <= "0000";
        wait for 10 ns;
        
        OpA <= "11100011000011000010000000000101";
        OpB <= "10000000000000000000000000000011";
	carryin<='0';
        opsel  <= "0000";
        wait for 10 ns;
        
        --Sub
        OpA <= "01100011000011000010000000000101";
        OpB <= "00000000000000000000000000000011";
	carryin<='1';
        opsel  <= "0001";
        wait for 10 ns;
       
        OpA <= "10000000000000000000000000000011";
        OpB <= "10000000000000000000000000000011";
	carryin<='0';
        opsel  <= "0001";
        wait for 10 ns;
        
        
        OpA <= "00000000000000000000000000000011";
        OpB <= "10000000000000000000000000000011";
	carryin<='1';
        opsel  <= "0001";
        wait for 10 ns;
        
        OpA <= "10000000000000000000000000000011";
        OpB <= "00000000000000000000000000000011";
	carryin<='0';
        opsel  <= "0001";
        wait for 10 ns;
       
        --Sll
        OpA <= "11100011000011000010000000000101";
        shifts<=1;
        opsel  <= "0111";
	carryin<='0';
        wait for 10 ns;
	
	OpA <= "01100011000011000010000000000101";
        shifts<=3;
        opsel  <= "0111";
        wait for 10 ns;
        
        --Slt
        OpA <= "01000000000000000000000000000101";
        OpB <= "00000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0010";
        wait for 10 ns;
        
        OpA <= "10000000000000000000000000000101";
        OpB <= "00000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0010";
        wait for 10 ns;
        
        OpA <= "00000000000000000000000000000101";
        OpB <= "10000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0010";
        wait for 10 ns;
        
        OpA <= "10000000000000000000000000000101";
        OpB <= "10000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0010";
        wait for 10 ns;
        
        --Sltu
        OpA <= "00000000000000000000000000000101";
        OpB <= "00000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0011";
        wait for 10 ns;
        
        OpA <= "10000000000000000000000000000101";
        OpB <= "00000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0011";
        wait for 10 ns;
        
        OpA <= "00000000000000000000000000000101";
        OpB <= "10000000000000000000000110000011";
        opsel  <= "0011";
	carryin<='0';
        wait for 10 ns;
        
        OpA <= "10000000000000000000000000000101";
        OpB <= "10000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0011";
        wait for 10 ns;
        
        --And
        OpA <= "10000000000000000000000000000101";
        OpB <= "00000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0101";
        wait for 10 ns;
        
        --Or
        OpA <= "10000000000000000000000000000101";
        OpB <= "00000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0100";
        wait for 10 ns;
        
        --Xor
        OpA <= "10000000000000000000000000000101";
        OpB <= "00000000000000000000000110000011";
	carryin<='0';
        opsel  <= "0110";
        wait for 10 ns;
        wait;
    end process;
    
end testbench;