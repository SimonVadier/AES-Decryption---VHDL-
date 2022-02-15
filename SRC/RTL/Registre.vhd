-- Simon VADIER
-- Registre.vhd
-- creation : 07/02/2022
-- modification : 09/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity Registre is
port(
	data_i 			: in bit128;
	enableOutput_i	: in std_logic;
	clock_i			: in std_logic;
	resetb_i		: in std_logic;
	
	data_o 			: out bit128);

end Registre;

architecture Registre_arch of Registre is

	signal data_s : bit128;

begin
-- Processus donné en cours modifie
	Reg0: process(clock_i, resetb_i)
	begin
		if(resetb_i = '1') then 
			data_s <= X"00000000000000000000000000000000";
		elsif (clock_i'event and clock_i = '1') then 
			data_s <= data_i;
		end if;
	end	process Reg0;
	
	data_o <= data_s;
end architecture Registre_arch;
