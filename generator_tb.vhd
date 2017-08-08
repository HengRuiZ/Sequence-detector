library ieee;
use ieee.std_logic_1164.all;
entity generator_tb is
end generator_tb;
architecture arch_tb of generator_tb is
	component generator is
	port(
		  clk : in std_logic;
		  reset : in std_logic;
		  my_out_1 : out std_logic;
		  my_out_2 : out std_logic
		  );
	end component;
	component detector is
	port(
		  clk : in std_logic;
		  reset : in std_logic;
		  in1: in std_logic;
		  out1 : out std_logic);
	end component;
	signal clkin_n:std_logic;
	signal reset_n:std_logic:='1';
	signal out1:std_logic:='0';
	signal out2:std_logic:='0';
	signal out3:std_logic:='0';
begin
	u0:generator port map(clkin_n,reset_n,out1,out2);
	u1:detector port map(clkin_n,reset_n,out2,out3);
	process
	begin
		clkin_n<='0';
		wait for 10 ns;
		clkin_n<='1';
		wait for 10 ns;
	end process;
end arch_tb;
