library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity generator is
	port(
		  clk : in std_logic;
		  reset : in std_logic;
		  my_out_1 : out std_logic;
		  my_out_2 : out std_logic
		  );
end generator;

architecture arch_generator of generator is
	type my_states is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9);
	signal my_st : my_states;
begin
		
	process(clk,reset)
	begin
		if(reset = '0')then
			my_st <= s0;
		elsif(clk'Event and clk = '1')then
			case my_st is
				when s0 =>
					my_st <= s1;
				when s1 =>
					my_st <= s2;
				when s2 =>
					my_st <= s3;
				when s3 =>
					my_st <= s4;
				when s4 =>
					my_st <= s5;
				when s5 =>
					my_st <= s6;
				when s6 =>
					my_st <= s7;
				when s7 =>
					my_st <= s8;
				when s8 =>
					my_st <= s9;
				when s9 =>
					my_st <= s0;
			end case;
		end if;
	end process;
		my_out_1 <= '1' when my_st=s0 else
					 '1' when my_st=s1 else
					 '1' when my_st=s2 else
					 '0' when my_st=s3 else
					 '1' when my_st=s4 else
					 '0' when my_st=s5 else
				    '0' when my_st=s6 else
					 '1' when my_st=s7 else
				    '1' when my_st=s8 else
				    '1';
		my_out_2 <= '1' when my_st=s0 else
					 '1' when my_st=s1 else
					 '0' when my_st=s2 else
					 '0' when my_st=s3 else
					 '1' when my_st=s4 else
					 '0' when my_st=s5 else
				    '0' when my_st=s6 else
					 '0' when my_st=s7 else
				    '1' when my_st=s8 else
				    '1';
end arch_generator;
