-- Simon VADIER
-- AddRoundKey.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity AddRoundKey is
  port( data_i : in type_state;
		data_o : out type_state;
		round_key_i : in type_state);
end entity AddRoundKey;

architecture AddRoundKey_arch of AddRoundKey is

	begin
	ligne : for i in 0 to 3 generate 
		colonne : for j in 0 to 3 generate
			-- Additionne bit à bit data_in et la cle de ronde
			data_o(i)(j) <= data_i(i)(j) XOR round_key_i(i)(j);
		end generate;
	end generate;
end architecture AddRoundKey_arch;


