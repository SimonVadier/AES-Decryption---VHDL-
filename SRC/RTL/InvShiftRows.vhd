-- Simon VADIER
-- InvShiftRows.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvShiftRows is
	port( data_i : in type_state;
		  data_o : out type_state);
end entity InvShiftRows;

architecture InvShiftRows_arch of InvShiftRows is

    begin 
    
    ligne : for i in 0 to 3 generate
        colonne : for j in 0 to 3 generate
            -- On change l'ordre par ligne 
            data_o(i)(j) <= data_i(i)((j+4-i)mod 4);
            
        end generate;
    end generate;
	
end architecture InvShiftRows_arch;
	
	
