-- Simon VADIER
-- Counter_tb_conf.vhd
-- creation : 10/02/2022
-- modification : 10/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration Counter_tb_conf of Counter_tb is
	for Counter_tb_arch
		for DUT : Counter
			use entity LIB_RTL.Counter(Counter_arch);
		end for;
	end for;
end configuration Counter_tb_conf;
