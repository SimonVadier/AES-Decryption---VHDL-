-- Simon VADIER
-- InvSubBytes_conf.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvSubBytes_conf of InvSubBytes is
	for InvSubBytes_arch
		for ligne
			for colonne
				for all : InvSBox_c
					use entity LIB_RTL.InvSBox(InvSBox_arch);
				end for;
			end for;
		end for;
	end for;
end configuration InvSubBytes_conf;
