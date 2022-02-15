-- Simon VADIER
-- InvSubBytes.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvSubBytes is
  port( data_i : in type_state;
		data_o : out type_state);
end entity InvSubBytes;

architecture InvSubBytes_arch of InvSubBytes is

	component InvSBox_c
		port(	data_i : in bit8;
				data_o : out bit8);
	end component;
	
	begin
		
		ligne : for i in 0 to 3 generate 
			colonne : for j in 0 to 3 generate
	-- On passe chaque bit par la table de subtitution
				InvSBox1 : InvSBox_c port map (				
					data_i => data_i(i)(j),
					data_o => data_o(i)(j)
				);
			end generate;
		end generate;
	
end architecture InvSubBytes_arch;
