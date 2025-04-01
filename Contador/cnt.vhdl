library ieee;
use ieee.std_logic_1164.all;	--std_logic
use ieee.numeric_std.all;		-- unsigned

entity cnt is 

	port(
		clk	:	in		std_logic;
		rst_n	:	in		std_logic;
		Q		:	out	std_logic_vector(9 downto 0)
	);

end entity;

architecture	main of cnt is
begin

	process (clk, rst_n) is 
		variable i	:	unsigned(31 downto 0)	:= (others => '0');
	begin
		if rst_n = '0' then 
			i := (others => '0');
		elsif rising_edge(clk) then
			i := i + 1;
		end if;
		Q <= std_logic_vector(i(31 downto 22));
	end process;

end architecture;
