-- Simon VADIER
-- InvAES_conf.vhd
-- creation : 07/02/2022
-- modification : 10/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvAES_conf of InvAES is
	for InvAES_arch
		for FSM : FSM_invAES_comp
		  use entity LIB_RTL.FSM_invAES(FSM_invAES_arch_Moore);
		end for;
		for IAR : InvAESRound_comp
		  use configuration LIB_RTL.InvAESRound_conf;
		end for;
		for CTR : Counter_comp
		  use entity LIB_RTL.Counter(Counter_arch);
		end for;
		for KET : KeyExpansion_table_comp
		  use entity LIB_RTL.KeyExpansion_table(KeyExpansion_table_arch);
		end for;
	end for;
end configuration InvAES_conf;
