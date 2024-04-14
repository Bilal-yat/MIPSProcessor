library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity d_cache is
port(	
	input	 : in std_logic_vector(31 downto 0);	--32-bit data input
	reset	 : in std_logic;                        --asyncrhonous reset
      	clk	 : in std_logic;			--synchronize writes with clock
	addr	 : in std_logic_vector(4 downto 0);
        data_write : in std_logic;			--set to '1' to enable writing
      	output	 : out std_logic_vector(31 downto 0)	--32-bit data output port
);
end d_cache;

architecture dcache_arch of d_cache is

-- creating the array of 32 data cache locations (32-bit width each)
type Location is array(0 to 31) of std_logic_vector(31 downto 0);
signal L: Location;

begin
	--converting address to integer for indexing of Location array
	output <= L(conv_integer(addr));

	process(input, reset, clk, data_write, addr)
	begin
		--deleting content of Locations when reset is set to '1'
		if (reset = '1') then
			for i in L'range loop
				L(i) <= (others => '0');
			end loop;
		--writing to locations if clock is on rising edge and data_write is set to '1'
		elsif( rising_edge(clk) ) then
			if ( data_write = '1' ) then
				L(conv_integer(addr)) <= input;
			end if;
		end if;
	end process;
end dcache_arch;
