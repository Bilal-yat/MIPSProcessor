-- 32 x 32 register file
-- two read ports, one write port with write enable

library IEEE;

use IEEE.std_logic_1164.all;

use IEEE.std_logic_unsigned.all;



entity regfile is

port( din	: in std_logic_vector(31 downto 0); -- input data

      reset	: in std_logic; -- clears all registers

      clk	: in std_logic; -- indicates clock rising or falling edge

      write	: in std_logic; -- set to 1 to start writing data to register

      read_a	: in std_logic_vector(4 downto 0); -- address of out_a register

      read_b	: in std_logic_vector(4 downto 0); -- address of out_b register

      write_address : in std_logic_vector(4 downto 0); -- address of register to be written to

      out_a	: out std_logic_vector(31 downto 0);

      out_b	: out std_logic_vector(31 downto 0));

end regfile;



architecture register_arch of regfile is



-- Declaring the internal signals

type Registers is array(0 to 31) of std_logic_vector(31 downto 0);

signal Reg: Registers;



begin

	out_a <= Reg(conv_integer(read_a));

	out_b <= Reg(conv_integer(read_b));



	process(din, reset, clk, write, write_address)

	begin

		if (reset = '1') then

			for i in Reg'range loop

				Reg(i) <= (others=> '0'); -- Clearing registers

			end loop;



		elsif (rising_edge(clk)) then 

			if (write = '1') then

				Reg(conv_integer(write_address)) <= din; -- write din data to the write_address when clk is on rising edge and write is set to 1

			end if;

		end if;

	end process;

end register_arch;
