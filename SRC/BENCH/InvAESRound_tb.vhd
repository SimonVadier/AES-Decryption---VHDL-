-- Simon VADIER
-- InvAESRound_tb.vhd
-- creation : 07/02/2022
-- modification : 09/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;
library LIB_RTL;
use LIB_RTL.utility_package.all;

entity InvAESRound_tb is
end entity InvAESRound_tb;

architecture InvAESRound_tb_arch of InvAESRound_tb is

  component InvAESRound
	  port( currenttext_i 			: in bit128;
			currentkey_i 			: in bit128;
			clock_i 				: in std_logic;
			enableInvMixColumns_i 	: in std_logic;
			enableRoundComputing_i 	: in std_logic;
			resetb_i 				: in std_logic;
	
			data_o 					: out bit128);
  end component;
  
  signal currenttext_s			: bit128;
  signal currentkey_s 			: bit128;
  signal clock_s 				: std_logic := '1';
  signal enableInvMixColumns_s 	: std_logic;
  signal enableRoundComputing_s : std_logic;
  signal resetb_s 				: std_logic := '0';
  signal data_s					: bit128;
  
begin
  DUT : InvAESRound
    port map (
		currenttext_i => currenttext_s,
		currentkey_i => currentkey_s,
		clock_i => clock_s,
		enableInvMixColumns_i => enableInvMixColumns_s,
		enableRoundComputing_i => enableRoundComputing_s,
		resetb_i => resetb_s,
		data_o => data_s
	  );

	P0 : process
		begin
			for i in 0 to 25 loop
				clock_s <= not(clock_s);
				wait for 10 ns; 
			end loop;
	end process P0;

	-- On teste le premier round, puis on reset et on teste la boucle
	enableRoundComputing_s <= '0', '1' after 10 ns, '0' after 40 ns;
	enableInvMixColumns_s <= '0', '1' after 40 ns, '0' after 220 ns;
	currenttext_s <= X"8c11354406ad4488decaec83aa034306";
	
	-- test reset
	resetb_s <= '1', '0' after 10 ns;
	
	currentkey_s <= X"e705100b8e80427e784d9b0e711ae165" after 20 ns,
					X"0bb8154b69855275f6cdd97009577a6b" after 40 ns,
					X"27c95136623d473e9f488b05ff9aa31b" after 60 ns,
					X"d827b8a645f41608fd75cc3b60d2281e" after 80 ns,
					X"11897ad39dd3aeaeb881da339da7e425" after 100 ns,
					X"125885118c5ad47d2552749d25263e16" after 120 ns,
					X"c8044b439e02516ca908a0e000744a8b" after 140 ns,
					X"c1bf4ef456061a2f370af18ca97cea6b" after 160 ns,
					X"cafbfe2b97b954db610ceba39e761be7" after 180 ns,
					X"75ec78565d42aaf0f6b5bf78ff7af044" after 200 ns,
					X"2b7e151628aed2a6abf7158809cf4f3c" after 220 ns;

end architecture InvAESRound_tb_arch;
