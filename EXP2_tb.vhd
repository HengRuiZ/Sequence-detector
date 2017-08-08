library ieee;
use ieee.std_logic_1164.all;
entity EXP2_tb is
end EXP2_tb;
architecture arch_tb of EXP2_tb is
	component EXP2 is
	port(
		  clk  :in std_logic;
		  a    :in std_logic;
		  reset:in std_logic;
		  out1 :out std_logic
	);
	end component;
	signal clkin_n:std_logic;
	signal select_n:std_logic:='0';
	signal reset_n:std_logic:='1';
	signal out1_n:std_logic:='0';
begin
	u0:EXP2 port map(clkin_n,select_n,reset_n,out1_n);
	process
	begin
		clkin_n<='0';
		wait for 10 ns;
		clkin_n<='1';
		wait for 10 ns;
	end process;
end arch_tb;
