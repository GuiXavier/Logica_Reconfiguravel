library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_testbench is
end entity;

architecture sim of uart_testbench is

    -- Constante de temporização
    constant t119200    : time := 1 sec / 115200;
    constant t9600      : time := 1 sec / 9600;

    -- Frame de envio
    constant uppercase_a_frame    :
        std_logic_vector(9 downto 0) := '1' & x"61" & '0'; 

    constant undercase_a_frame    :
        std_logic_vector(9 downto 0) := '1' & x"41" & '0';

    -- sinais para simular a transmissão UART    
    signal tx119200, tx9600 : std_logic := '0';
    signal  sync : std_logic := '0';

begin

    uppercase_a_send: process 
    begin
        wait until sync = '1';
        for i in uppercase_a_frame'reverse_range loop
            tx119200 <= uppercase_a_frame(i);
            wait for t119200;
        end loop;
    end process;

    undercase_a_send: process 
    begin
        wait until sync = '1';
        for i in undercase_a_frame'reverse_range loop
            tx9600 <= undercase_a_frame(i);
            wait for t9600;
        end loop; 
    end process;

    process
    begin
        sync <= '1';
        wait for 10 ns;
        sync <= '0';
        wait for 1 sec - 10 ns;
    end process;

end architecture;