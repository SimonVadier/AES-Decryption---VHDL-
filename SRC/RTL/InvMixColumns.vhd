-- Simon VADIER
-- InvMixColumns.vhd
-- creation : 05/01/2021
-- modification : 07/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvMixColumns is
  port( data_i : in type_state;
		data_o : out type_state);
end entity InvMixColumns;

architecture InvMixColumns_arch of InvMixColumns is

	component InvMixTable_c
		port(	column_i : in column_state;
				column_o : out column_state);
	end component;
	
	begin
		-- On passe chaque colonnes a InvMixTable
        -- qui multiplie bit a bit en utilisant une table de substitution
		colonne : for j in 0 to 3 generate 
			InvMixTable1 : InvMixTable_c 
			port map (				
				column_i(0) => data_i(0)(j),
				column_i(1) => data_i(1)(j),
				column_i(2) => data_i(2)(j),
				column_i(3) => data_i(3)(j),
				
				column_o(0) => data_o(0)(j),
				column_o(1) => data_o(1)(j),
				column_o(2) => data_o(2)(j),
				column_o(3) => data_o(3)(j)
			);
		end generate;
end architecture InvMixColumns_arch;
