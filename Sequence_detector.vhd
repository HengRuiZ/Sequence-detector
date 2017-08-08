library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity EXP2 is
	port(
		  clk  :in std_logic;
		  a    :in std_logic;
		  reset:in std_logic;
		  out1 :out std_logic
		  );
end EXP2;

architecture arch_EXP2 of EXP2 is
	component divider is
		port(
		clkin:in std_logic;
		clkout:out std_logic
		);
	end component;
	component detector is
	port(
		  clk : in std_logic;
		  reset : in std_logic;
		  in1: in std_logic;
		  out1 : out std_logic
		  );
	end component;
	component generator is
	port(
		  clk : in std_logic;
		  reset : in std_logic;
		  my_out_1 : out std_logic;
		  my_out_2 : out std_logic
		  );
	end component;
	signal clkout,sig1,sig2,sig3:std_logic;
	begin
		u0:divider port map(clk,clkout);
		u1:generator port map(clkout,reset,sig1,sig2);
		u2:detector port map(clkout,reset,sig3,out1);
		process(a,sig1,sig2)
		begin
		if(a='0') then sig3<=sig1;
		else sig3<=sig2;
		end if;
		end process;
end arch_EXP2;
