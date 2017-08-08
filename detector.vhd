library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity detector is
	port(
		  clk : in std_logic;
		  reset : in std_logic;
		  in1: in std_logic;
		  out1 : out std_logic);
end entity;

architecture arch_detector of detector is
	type my_states_1 is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9);
	signal my_st_1 : my_states_1;
	
begin
	process(clk,reset,in1)
	begin
		if(reset = '0')then
			my_st_1 <= s0;
		elsif(clk'Event and clk = '1')then
			case my_st_1 is
				when s0 =>
					if(in1 = '0')then
						my_st_1 <= s0;
					else
						my_st_1 <= s1;
					end if;
				when s1 =>
					if(in1 = '0')then
						my_st_1 <= s0;
					else
						my_st_1 <= s2;
					end if;
				when s2 =>
					if(in1 = '0')then
						my_st_1 <= s0;
					else
						my_st_1 <= s3;
					end if;
				when s3 =>
					if(in1 = '0')then
						my_st_1 <= s4;
					else
						my_st_1 <= s3;
					end if;
				when s4 =>
					if(in1 = '0')then
						my_st_1 <= s0;
					else
						my_st_1 <= s5;
					end if;
				when s5 =>
					if(in1 = '0')then
						my_st_1 <= s6;
					else
						my_st_1 <= s1;
					end if;
				when s6 =>
					if(in1 = '0')then
						my_st_1 <= s7;
					else
						my_st_1 <= s1;
					end if;
				when s7 =>
					if(in1 = '0')then
						my_st_1 <= s0;
					else
						my_st_1 <= s8;
					end if;
				when s8 =>
					if(in1 = '0')then
						my_st_1 <= s0;
					else
						my_st_1 <= s9;
					end if;
				when s9 =>
					if(in1 = '0')then
						my_st_1 <= s0;
					else
						my_st_1 <= s1;
					end if;
			end case;
		end if;
	
	end process;
	out1 <= '0' when my_st_1=s0 else
					 '0' when my_st_1=s1 else
					 '0' when my_st_1=s2 else
					 '0' when my_st_1=s3 else
					 '0' when my_st_1=s4 else
					 '0' when my_st_1=s5 else
				    '0' when my_st_1=s6 else
					 '0' when my_st_1=s7 else
				    '0' when my_st_1=s8 else
				    '1';
end arch_detector;
