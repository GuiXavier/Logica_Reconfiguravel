-- Este testbench VHDL imprime a sequência de Fibonacci.
-- O loop é interrompido se o próximo valor da sequência for igual ou superior à constante pré-definida 'FIB_LIMIT'.
-- Esta abordagem demonstra como controlar a execução de loops usando condições de saída.

entity a003e_while_loop_tb is
end entity;

architecture sim of a003e_while_loop_tb is
    constant FIB_LIMIT      : integer := 101; -- Limite da sequência
begin

    -- Thread
    process is
        variable primeirotermo : integer := 0; -- Primeiro termo da sequência de Fibonacci
        variable segundotermo  : integer := 1; -- Segundo termo da sequência
        variable proximotermo  : integer := 0; -- Próximo termo a ser calculado
    begin
        report "Start!";

        report "i = " & integer'image(primeirotermo);
        report "i = " & integer'image(segundotermo);

        while proximotermo < FIB_LIMIT loop
            proximotermo := primeirotermo + segundotermo;
            
            exit when proximotermo >= FIB_LIMIT;

            report "i = " & integer'image(proximotermo);

            primeirotermo := segundotermo;
            segundotermo  := proximotermo;
        end loop;

        report "Ateh!";
        wait;
    end process;

end architecture;
