-- Simon VADIER
-- InvShiftRows_tb_conf.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;

library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvShiftRows_tb_conf of InvShiftRows_tb is
	for InvShiftRows_tb_arch
		for DUT : InvShiftRows
			use entity LIB_RTL.InvShiftRows(InvShiftRows_arch);
		end for;
	end for;
end configuration InvShiftRows_tb_conf;
