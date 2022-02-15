-- Simon VADIER
-- InvAES_tb_conf.vhd
-- creation : 07/02/2022
-- modification : 10/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
use LIB_RTL.utility_package.all;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvAES_tb_conf of InvAES_tb is
	for InvAES_tb_arch
		for DUT : InvAES
			use configuration LIB_RTL.InvAES_conf;
		end for;
	end for;
end configuration InvAES_tb_conf;
