-- Este testbench VHDL imprime a sequência de Fibonacci.
-- O loop é interrompido se o próximo valor da sequência for igual ou superior à constante pré-definida 'FIB_LIMIT'.
-- Esta abordagem demonstra como controlar a execução de loops usando condições de saída.

entity primos is
end entity;

architecture sim of primos is
    constant PRIME_LIMIT    : integer := 101; -- Limite da sequência
begin

    -- Thread
    process is
        variable i : integer := 2;
        variable j  : integer := 3;
    begin
        report "Start!";

        while i < PRIME_LIMIT loop
            -- exit when i >= PRIME_LIMIT;

            j := i mod i;
            
            if j /= 0 then

                report "i = " & integer'image(i);
                
            end if;

            i := i + 1;
        end loop;

        report "Ateh!";
        wait;
    end process;

end architecture;
