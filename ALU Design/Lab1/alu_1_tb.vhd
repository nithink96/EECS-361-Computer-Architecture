library ieee;
use ieee.std_logic_1164.all;

entity alu_1_tb is

end alu_1_tb;

architecture testbench of alu_1_tb is
    
signal OpA    : std_logic;
signal OpB     : std_logic;
signal carryin :std_logic;
signal opsel       : std_logic_vector(3  downto 0);
signal carryout : std_logic;
signal overflow : std_logic;
signal result  : std_logic;

component ALU_1
    port(
        OpA      : in std_logic;
        OpB      : in std_logic;
	carryin : in std_logic;
        op_sel       : in std_logic_vector(3  downto 0);
        carryout : out std_logic;
        overflow : out std_logic;
    --    zero     : out std_logic;
        result   : out std_logic
    );
end component;



begin
    
    a: ALU_1 port map (OpA, OpB,carryin, opsel, carryout, overflow, result);
    
testbench: process    
    begin
        --Add
        OpA <= '1';
        OpB <= '0';
	carryin<='1';
        opsel  <= "0000";
        wait for 10 ns;
        
        OpA <= '1';
        OpB <= '1';
	carryin<='0';
        opsel  <= "0000";
        wait for 10 ns;
        
        OpA <= '0';
        OpB <= '1';
	carryin<='1';
        opsel  <= "0000";
        wait for 10 ns;
        
   
        --Sub
        OpA <= '1';
        OpB <= '0';
	carryin<='0';
        opsel  <= "0001";
        wait for 10 ns;
       
        OpA <= '1';
        OpB <= '1';
	carryin<='1';
        opsel  <= "0001";
        wait for 10 ns;
        
        
        OpA <= '0';
        OpB <= '1';
	carryin<='0';
        opsel  <= "0001";
        wait for 10 ns;
        
        --And
        OpA <= '1';
        OpB <= '1';
	carryin<='0';
        opsel  <= "0101";
        wait for 10 ns;
        
        --Or
        OpA <= '1';
        OpB <= '0';
	carryin<='0';
        opsel  <= "0100";
        wait for 10 ns;
        
        --Xor
        OpA <= '1';
        OpB <= '1';
	carryin<='0';
        opsel  <= "0110";
        wait for 10 ns;
wait;
        
    end process;
    
end testbench;