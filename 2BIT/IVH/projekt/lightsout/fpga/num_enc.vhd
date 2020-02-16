library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity num_enc is
	Generic (
		SIZE : integer := 4
	);
	Port (
		ADDRESS : in std_logic_vector(SIZE-1 downto 0);
		ROW : in std_logic_vector(3 downto 0);
		COL : in std_logic_vector(2 downto 0);
		DATA : out std_logic
	);
end num_enc;

architecture behavioral of num_enc is
	type char_mem is array (0 to (2**SIZE)-1) of std_logic_vector(0 to 127);
	constant mem_idx : char_mem :=(
		 0 => "00000000000000000000000000000000000000000001110000100010001000100010001000100010001000100001110000000000000000000000000000000000", 
		 1 => "00000000000000000000000000000000000000000011111000001000000010000000100000001000000010000000110000000000000000000000000000000000", 
		 2 => "00000000000000000000000000000000000000000011111000000010000001000000100000010000001000100001110000000000000000000000000000000000", 
		 3 => "00000000000000000000000000000000000000000001110000100010001000000001100000100000001000100001110000000000000000000000000000000000",
		 4 => "00000000000000000000000000000000000000000011100000010000001111100001001000010100000110000001000000000000000000000000000000000000", 
		 5 => "00000000000000000000000000000000000000000001110000100010001000000001110000000100000001000011110000000000000000000000000000000000",
		 6 => "00000000000000000000000000000000000000000001110000100010001000100001111000000010000001000011100000000000000000000000000000000000", 
		 7 => "00000000000000000000000000000000000000000000100000001000000100000001000000100000001000100011111000000000000000000000000000000000", 
		 8 => "00000000000000000000000000000000000000000001110000100010001000100001110000100010001000100001110000000000000000000000000000000000", 
		 9 => "00000000000000000000000000000000000000000000111000010000001000000011110000100010001000100001110000000000000000000000000000000000",					 
		 others => (others=>'-')
		); 
	
begin
	get_val: process (ADDRESS, ROW, COL) is 
   	variable data_out : std_logic_vector(127 downto 0);
	begin
		data_out := mem_idx(conv_integer(ADDRESS));
      data <= data_out(conv_integer(ROW & COL));
		
	end process get_val;
 
end behavioral;
