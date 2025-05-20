library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity leds_top is
	port(
		MAX10_CLK1_50	:	in		std_logic;
		LEDR				:	out	std_logic_vector(9 downto 0);
		SW					:	in		unsigned(9 downto 0)
	);

end entity;

architecture estrutural of leds_top is

	constant sysfreq	:	integer	:=	50e6;

begin

	disp_blink: entity work.blink(comportamental)
		generic map(
			sysfreq	=>	sysfreq,
			ledfreq	=>	2
		)
		port map(
			clk		=> MAX10_CLK1_50,
			led		=>	LEDR(0)
		);
		
	disp_pwm: entity work.pwm(comportamental)
		generic map(
			sysfreq	=>	sysfreq,
			pwmfreq	=>	1000
		)
		port map(
			clk		=>	MAX10_CLK1_50,
			led		=>	LEDR(1),
			SW		=>	SW(3 downto 0)
		);
		
		--disp_blink2:	entity work.blink(comportamental)
			--generic map(sysfreq, 1)
			--port map(MAX10_CLK1_50, LEDR(2));
			
		
end architecture;