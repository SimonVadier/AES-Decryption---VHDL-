-- Simon VADIER
-- AddRoundKey_tb_conf.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;

library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration AddRoundKey_tb_conf of AddRoundKey_tb is
	for AddRoundKey_tb_arch
		for DUT : AddRoundKey
			use entity LIB_RTL.AddRoundKey(AddRoundKey_arch);
		end for;
	end for;
end configuration AddRoundKey_tb_conf;
