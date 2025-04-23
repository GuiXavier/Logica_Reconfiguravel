-- Desenvolva um testbench em VHDL, sem instância de entidades, com o objetivo de contar quantas 
-- posições de um vetor constante do tipo std_logic_vector(9 downto 0) contêm o valor lógico '1'.
-- A contagem deve ser realizada dentro de um bloco process, e o resultado armazenado em um sinal 
-- do tipo integer.
-- Certifique-se de finalizar o processo com um comando wait, a fim de interromper a execução da 
-- simulação adequadamente.
library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture cont of testbench is
    constant vetor : std_logic_vector(9 downto 0) := "0101100111";
    signal j : integer := 0;
begin
    process
    begin
        report "Start!";

        j <= 0;  -- zera antes de começar

        for i in vetor'range loop
            if vetor(i) = '1' then
                j <= j + 1;  -- agendado para atualizar
            end if;
            wait for 10 ns;  -- permite tempo para o j atualizar a cada iteração
        end loop;

        wait for 10 ns; -- mais um tempo para garantir atualização final
        report "O vetor possui = " & integer'image(j);
        report "Ateh!";
        wait;
    end process;
end architecture;
