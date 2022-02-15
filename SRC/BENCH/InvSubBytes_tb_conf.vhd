-- Simon VADIER
-- InvSubBytes_tb_conf.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvSubBytes_tb_conf of InvSubBytes_tb is
	for InvSubBytes_tb_arch
		for DUT : InvSubBytes
			use configuration LIB_RTL.InvSubBytes_conf;
		end for;
	end for;
end configuration InvSubBytes_tb_conf;
