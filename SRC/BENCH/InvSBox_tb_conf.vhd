-- Simon VADIER
-- InvSBox_tb_conf.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;

library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvSBox_tb_conf of InvSBox_tb is
	for InvSBox_tb_arch
		for DUT : InvSBox
			use entity LIB_RTL.InvSBox(InvSBox_arch);
		end for;
	end for;
end configuration InvSBox_tb_conf;
