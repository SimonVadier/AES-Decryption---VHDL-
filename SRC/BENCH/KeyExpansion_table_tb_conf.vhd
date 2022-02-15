-- Simon VADIER
-- KeyExpansion_table_tb_conf.vhd
-- creation : 10/02/2022
-- modification : 10/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration KeyExpansion_table_tb_conf of KeyExpansion_table_tb is
	for KeyExpansion_table_tb_arch
		for DUT : KeyExpansion_table
			use entity LIB_RTL.KeyExpansion_table(KeyExpansion_table_arch);
		end for;
	end for;
end configuration KeyExpansion_table_tb_conf;
