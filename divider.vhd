library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity divider is
 port(
	clkin:in std_logic;
	clkout:out std_logic
	);
end divider;

architecture arch_divider of divider is
	signal cnt:std_logic_vector(2 downto 0):="000";
	signal tmp_clk :std_logic:='0';
begin
	process
	begin
		wait until rising_edge(clkin);
		if(cnt="101")then
			cnt<="000";
			tmp_clk<=not tmp_clk;
		else
		 cnt<=cnt+1;
		end if;
	end process;
	clkout<=tmp_clk;
end arch_divider;
