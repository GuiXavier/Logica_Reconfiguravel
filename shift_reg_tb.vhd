library ieee;
use ieee.std_logic_1164.all;

entity shift_reg_tb is
end entity;
   
architecture sim of shift_reg_tb is

constant dado : std_logic_vector := "1010";

signal sys_clk      :   std_logic   := '0';
signal sys_rst      :   std_logic   := '0';
signal dado_entrada :   std_logic;
signal dado_saida   :   std_logic;

begin

    u1  :   entity work.a008f_generic_shift_reg(rtl)
        port map {
            sys_clk     =>  sys_clk,
            sys_rst     =>  sys_rst,
            dado_entrada    =>  dado_entrada,
            dado_saida      =>  dado_saida
        };

    process(sys_clk)
    begin
        wait for 10 ns;
        sys_clk <= not sys_clk;
    end process;

    process
    begin
        wait for 100 ns;
        sys_rst <= '1';
        wait;
    end process;

    process
    begin
        wait for 20 ns;
        for i in 0 to 3 loop
            dado_entrada <= dado(1);
            wait for 10 ns;

        end loop; 
        
        
    wait for 20 ns;
        for i in 0 to 3 loop
            dado_entrada <= dado(1);
            wait for 10 ns;

        end loop;
    end process


end architecture;
