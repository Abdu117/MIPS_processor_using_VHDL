library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  

entity Instruction_Memory_VHDL is
port (
 inst_add: in std_logic_vector(3 downto 0);
 instruction: out  std_logic_vector(15 downto 0)
);
end Instruction_Memory_VHDL;

architecture Behavioral of Instruction_Memory_VHDL is
signal rom_addr: std_logic_vector(3 downto 0);
 type ROM_type is array (0 to 15 ) of std_logic_vector(15 downto 0);
 constant rom_data: ROM_type:=(
 --addition,subtraction
   "0111000100001110", --li 14 in 4 
	"0001100101001001", --14-12  
   "0001001110001010",  -- 2*3 
   "0010001001000001",  --6+1
	"0001011010011000", --add total_sum(0) , nth odd
	"0011001001000001",-- counter--	
	"0010010010000010",-- nth odd +2 
   "1010000001001111", --bre 
	"1111000000000100", --jump
     
   
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000"
	
  );
begin

 rom_addr <= inst_add;
  instruction <= rom_data(to_integer(unsigned(rom_addr)));

end Behavioral;