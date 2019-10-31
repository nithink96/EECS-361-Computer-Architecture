library ieee;
use ieee.std_logic_1164.all;
use work.eecs361_gates.all;


entity ALU_control is
port (
	opcode: in std_logic_vector(5 downto 0);
    func : in  std_logic_vector(5 downto 0);
    ALUop: in std_logic_vector(2 downto 0);
    ALUctr: out std_logic_vector(2 downto 0)
  ); 
end ALU_control;

architecture structural of ALU_control is
--declare all components
component five_in_and_gate is

  port (
    v   : in  std_logic;
    w   : in std_logic;
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end component;

component four_in_and_gate is

  port (
    w   : in  std_logic;
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end component;

component three_in_and_gate is

  port (
    x   : in  std_logic;
    y   : in  std_logic;
    z   : in std_logic;
    f : out std_logic
  );
end component;

 component and_gate is
    port (
      x : in std_logic;
      y : in std_logic;
      z : out std_logic
    );
  end component;


component not_gate is
    port (
      x : in std_logic;
      z : out std_logic
    );
  end component;

component or_gate is
    port (
      x : in std_logic;
      y : in std_logic;
      z : out std_logic
    );
  end component;
signal inv_func: std_logic_vector(5 downto 0);
signal inv_ALUop: std_logic_vector(2 downto 0);
signal temp_signals: std_logic_vector(7 downto 0);
signal alsotemp: std_logic_vector(5 downto 0);
signal temp_ALUctr: std_logic_vector(2 downto 0);

begin
ALUctr<= "100" when (( opcode = "000000") and (func = "000000" ))else 
		 "010" when  (opcode = "001000") else 
		 "010" when ( (opcode = "000000") and (func = "100000" )) 
		 else temp_ALUctr;

--find inverted values of all signals
l1: not_gate port map(func(5),inv_func(5));
l2: not_gate port map(func(4),inv_func(4));
l3: not_gate port map(func(3),inv_func(3));
l4: not_gate port map(func(2),inv_func(2));
l5: not_gate port map(func(1),inv_func(1));
l6: not_gate port map(func(0),inv_func(0));
l7: not_gate port map(ALUop(2),inv_ALUop(2));
l8: not_gate port map(ALUop(1),inv_ALUop(1));
l9: not_gate port map(ALUop(0),inv_ALUop(0));
--finding bit 2 of ALUctr

a21: three_in_and_gate port map(inv_ALUop(2),inv_ALUop(1),ALUop(0),temp_signals(0));
a22: four_in_and_gate port map(ALUop(2),inv_func(2),func(1),inv_func(0),temp_signals(1));
a23: or_gate port map(temp_signals(0),temp_signals(1),alsotemp(0));
a25: five_in_and_gate port map(ALUop(2),func(3),inv_func(2),inv_func(1),func(0),alsotemp(1));
a26: or_gate port map(alsotemp(0),alsotemp(1),temp_ALUctr(2));

-- Finding bit1 of ALUctr

a11: and_gate port map(inv_ALUop(2),inv_ALUop(1),temp_signals(2));
a12: three_in_and_gate port map(ALUop(2),inv_func(2),inv_func(0),temp_signals(3));
a13: or_gate port map(temp_signals(2),temp_signals(3),alsotemp(2));
a14: five_in_and_gate port map(ALUop(2),inv_func(3),func(2),func(1),inv_func(0),alsotemp(3));
a15: or_gate port map(alsotemp(2),alsotemp(3),temp_ALUctr(1));


-- Finding bit0 of ALUctr

a01: and_gate port map(inv_ALUop(2),ALUop(1),temp_signals(4));
a02: five_in_and_gate port map(ALUop(2),inv_func(3),func(2),inv_func(1),func(0),temp_signals(5));
a03: five_in_and_gate port map(ALUop(2),func(3),inv_func(2),func(1),inv_func(0),temp_signals(6));
a04: or_gate port map(temp_signals(5),temp_signals(4),temp_signals(7));
a05: or_gate port map(temp_signals(6),temp_signals(7),alsotemp(4));
a06: five_in_and_gate port map(ALUop(2),inv_func(3),func(2),func(1),inv_func(0),alsotemp(5));
a07: or_gate port map(alsotemp(4),alsotemp(5),temp_ALUctr(0));

end architecture structural;
