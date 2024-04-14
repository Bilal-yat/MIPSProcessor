library IEEE; 

use IEEE.std_logic_1164.all; 
use IEEE.std_logic_unsigned.all; 
use ieee.numeric_std.ALL; 
 

entity next_address is 

 

port( 

-- inputs 

rt, rs : in std_logic_vector(31 downto 0);	 
pc : in std_logic_vector(31 downto 0); 
target_address : in std_logic_vector(25 downto 0); 
branch_type : in std_logic_vector(1 downto 0); 
pc_sel : in std_logic_vector(1 downto 0); 

-- outputs 

next_pc : out std_logic_vector(31 downto 0)); 
 
end next_address ; 

 

architecture nxt_address_arch of next_address is 

 

begin 

 

next_addr: process (pc, pc_sel, branch_type, rt, rs, target_address) 

variable unsigned_pc: unsigned(31 downto 0); 
variable sign_extend_offst: unsigned(31 downto 0); -- assumes 2's complement offset 

 
begin 

 

	unsigned_pc := unsigned(pc); 

 

	if (target_address(15) = '0') then 

	sign_extend_offst := unsigned((31 downto 16 => '0') & target_address(15 downto 0)); 

	else  

	sign_extend_offst := unsigned((31 downto 16 => '1') & target_address(15 downto 0)); 

	end if; 

 

	case pc_sel is 

	 
		when "00" => --no jump or branch 


		case branch_type is  


			when "00" => --no jump, next instruction: PC = PC + 1 
			next_pc <= std_logic_vector(unsigned_pc + 1); 

			 

			when "01" => --beq: PC = PC + 1 + sign_extend(target_address[15:0]) if rs=rt 

			if (rs = rt) then  
			next_pc <= std_logic_vector(unsigned_pc + 1 + sign_extend_offst); 

			else -- condition fails, just PC = PC + 1;				 
			next_pc <= std_logic_vector(unsigned_pc + 1);					 

			end if; 

			 

			when "10" => --bne: PC = PC + 1 + sign_extend(target_address[15:0]) if rs/=rt 

			if (rs /= rt) then  
			next_pc <= std_logic_vector(unsigned_pc + 1 + sign_extend_offst); 

			else -- condition fails, just PC = PC + 1;				 
			next_pc <= std_logic_vector(unsigned_pc + 1);					 

			end if; 

			 

			when "11" => --bltz: PC = PC + 1 + sign_extend(target_address[15:0]) if rs < 0 

			if (signed(rs) < 0) then  
			next_pc <= std_logic_vector(unsigned_pc + 1 + sign_extend_offst); 

			else -- condition fails, just PC = PC + 1;				 
			next_pc <= std_logic_vector(unsigned_pc + 1);							 

			end if; 

	 

			when others => -- shouldn't happen, PC = PC + 1 

			next_pc <= std_logic_vector(unsigned_pc + 1);		 

	 

			end case; 


	when "01" => -- pseudo-direct jump: PC = '000000' & target_address 
	next_pc <= ((31 downto 26 => '0') & target_address); 


	when "10" => -- jump register: PC = contents of register rs 
	next_pc <= rs; 

	 
	when others => -- shouldn't happen, PC = PC + 1 
	next_pc <= std_logic_vector(unsigned_pc + 1);	 

	 

	end case;			 


end process;	 


end nxt_address_arch; 
