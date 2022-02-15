-- Simon VADIER
-- InvMixColumns_conf.vhd
-- creation : 05/01/2021
-- modification : 07/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvMixColumns_conf of InvMixColumns is
	for InvMixColumns_arch
		for colonne
			for all : InvMixTable_c
				use entity LIB_RTL.InvMixTable(InvMixTable_arch);
			end for;
		end for;
	end for;
end configuration InvMixColumns_conf;
