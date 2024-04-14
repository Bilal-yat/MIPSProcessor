library IEEE;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_1164.all;

entity alu is
port(
-- two input operands
 x, y : in std_logic_vector(31 downto 0);

-- 0 = add , 1 = sub
 add_sub : in std_logic ;

 -- 00 = AND, 01 = OR , 10 = XOR , 11 = NOR
 logic_func : in std_logic_vector(1 downto 0 ) ;

-- 00 = lui, 01 = setless , 10 = arith , 11 = logic
 func : in std_logic_vector(1 downto 0 ) ;

 output : out std_logic_vector(31 downto 0) ;
 overflow : out std_logic ;
 zero : out std_logic
 );
end alu ;

architecture ALU_architecture of alu is


    signal addSub_answ: std_logic_vector(31 downto 0);
    signal lgc_func_answ: std_logic_vector(31 downto 0);
    signal check_overflw: std_logic_vector(2 downto 0); 

begin

    process(x, y, add_sub, logic_func, func, addSub_answ, lgc_func_answ, check_overflw)
        begin
            
            check_overflw <= x(x'high) & y(y'high) & addSub_answ(addSub_answ'high);

            case add_sub is
                when '0' => addSub_answ <= x+y;
                    if (check_overflw = "001") OR (check_overflw = "110") then
                        overflow <= '1';
                    else
                        overflow <= '0';
                    end if;
                
                when '1' => addSub_answ <= x-y;
                    if (check_overflw = "011") OR (check_overflw = "100") then
                        overflow <= '1';
                    else
                        overflow <= '0';
                    end if;

                when others =>
            end case;
       

            case logic_func is
                when "00" => lgc_func_answ <= x and y;
                when "01" => lgc_func_answ <= x or y;
                when "10" => lgc_func_answ <= x xor y;
                when "11" => lgc_func_answ <= x nor y;

                when others =>
            end case;

            case func is
                when "00" => output <= y;
                when "01" => output <= (31 downto 1 => '0') & addSub_answ(addSub_answ'high);
                when "10" => output <= addSub_answ;
                when "11" => output <= lgc_func_answ;

                when others =>
            end case;

            if addSub_answ = (addSub_answ'range => '0') then
                zero <= '1';
            else
                zero <= '0';
            end if;

    end process;
    
end ALU_architecture;
