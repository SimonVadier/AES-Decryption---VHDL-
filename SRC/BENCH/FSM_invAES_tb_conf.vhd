-- Simon VADIER
-- FSM_invAES_tb_conf.vhd
-- creation : 07/02/2022
-- modification : 10/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration FSM_invAES_tb_conf of FSM_invAES_tb is
	for FSM_invAES_tb_arch
		for DUT : FSM_invAES
			use entity LIB_RTL.FSM_invAES(FSM_invAES_arch_Moore);
		end for;
	end for;
end configuration FSM_invAES_tb_conf;
