-- Simon VADIER
-- InvAESRound_tb_conf.vhd
-- creation : 07/02/2022
-- modification : 09/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
use LIB_RTL.utility_package.all;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvAESRound_tb_conf of InvAESRound_tb is
	for InvAESRound_tb_arch
		for DUT : InvAESRound
			use configuration LIB_RTL.InvAESRound_conf;
		end for;
	end for;
end configuration InvAESRound_tb_conf;
