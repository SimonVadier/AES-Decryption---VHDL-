-- Simon VADIER
-- InvMixTable_tb_conf.vhd
-- creation : 05/01/2021
-- modification : 07/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;

library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvMixTable_tb_conf of InvMixTable_tb is
	for InvMixTable_tb_arch
		for DUT : InvMixTable
			use entity LIB_RTL.InvMixTable(InvMixTable_arch);
		end for;
	end for;
end configuration InvMixTable_tb_conf;
