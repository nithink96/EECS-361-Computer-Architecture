library IEEE;
use IEEE.std_logic_1164.all;
use work.gatesAndConst.all;
use ieee.numeric_std.all;

entity ALU_tb is
end entity ALU_tb;

architecture behavioral of ALU_tb is

component ALU is 
port(
	A: in std_logic_vector (31 downto 0);
	B: in std_logic_vector(31 downto 0);
	ctrl: in std_logic_vector(2 downto 0);
	carryOut: out std_logic;
	overFlow: out std_logic;
	zero: out std_logic;
	result: out std_logic_vector(31 downto 0)
	);
end component ALU;


signal A_tb: std_logic_vector(31 downto 0);
signal B_tb: std_logic_vector(31 downto 0);
signal ctrl_tb: std_logic_vector(2 downto 0);
signal carryOut_tb: std_logic;
signal overFlow_tb: std_logic;
signal zero_tb: std_logic;
signal result_tb: std_logic_vector(31 downto 0);

begin

alu0: ALU port map( 
	A => A_tb,
	B=>B_tb,
	ctrl =>ctrl_tb,
	carryOut =>carryOut_tb,
	overFlow =>overFlow_tb,
	zero => zero_tb,
	result => result_tb);

	test: process is
	begin

		A_tb <= (31=>'0',others => '1');
		B_tb <= (2 downto 0 => '1',others => '0');
		ctrl_tb <= SLL_OP;
		wait for 5 ns;
		A_tb <= (others => '1');
		A_tb(0)<='0';
		B_tb <= (others => '0');
		B_tb(4 downto 0)<="11111";
		wait for 5 ns;

		A_tb <= (others => '0');
		A_tb(4)<='1';
		B_tb <= (others => '0');
		B_tb(7)<='1';
		wait for 5 ns;

		A_tb <= (31=>'0', others => '1');
		B_tb <= (31=>'0', others => '1');
		wait for 5 ns;
		A_tb <= (others => '0');
		A_tb(0)<='1';
		B_tb <= (others => '0');
		B_tb(1)<='1';
		wait for 5 ns;

		A_tb <= (others => '0');
		A_tb(4)<='1';
		B_tb <= (others => '0');
		B_tb(7)<='1';
		wait for 5 ns;

		wait;

	end process;


end architecture behavioral;

