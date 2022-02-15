-- Simon VADIER
-- InvMixColumns_tb_conf.vhd
-- creation : 05/01/2021
-- modification : 05/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvMixColumns_tb_conf of InvMixColumns_tb is
	for InvMixColumns_tb_arch
		for DUT : InvMixColumns
			use configuration LIB_RTL.InvMixColumns_conf;
		end for;
	end for;
end configuration InvMixColumns_tb_conf;
