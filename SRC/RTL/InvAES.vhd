-- Simon VADIER
-- InvAES.vhd
-- creation : 07/02/2022
-- modification : 10/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvAES is
port(
	clock_i		: in std_logic;
	resetb_i	: in std_logic;
	start_i		: in std_logic;
	data_i		: in bit128;
	
	data_o		: out bit128;
	aes_done_o	: out std_logic
	);

end InvAES;

architecture InvAES_arch of InvAES is
	component FSM_invAES_comp
		port(
			clock_i		: in std_logic;
			resetb_i	: in std_logic;
			start_i		: in std_logic;
			round_i		: in bit4;
			done_o					: out std_logic;
			enableCounter_o			: out std_logic;
			enableMixColumns_o		: out std_logic;
			enableOutput_o			: out std_logic;
			enableRoundcomputing_o	: out std_logic;
			getciphertext_o			: out std_logic;
			resetCounter_o			: out std_logic);
		end component;
		
	component InvAESRound_comp
		port(
			currenttext_i 			: in bit128;
			currentkey_i 			: in bit128;
			clock_i 				: in std_logic;
			enableInvMixColumns_i 	: in std_logic;
			enableRoundComputing_i 	: in std_logic;
			resetb_i 				: in std_logic;
			data_o 					: out bit128);
		end component;

	component Counter_comp
		port(reset_i  : in  std_logic;
		   enable_i : in  std_logic;
		   clock_i  : in  std_logic;
		   init_i	: in  std_logic;
		   count_o  : out bit4);
	end component;
	
	component KeyExpansion_table_comp
		port (
			round_i         : in  bit4;
			expansion_key_o : out bit128);
	end component;
	
	signal currentkey_s : bit128;
	signal data_s : bit128;
	signal data_output: bit128;
	signal enableInvMixColumns_s : std_logic;
	signal enableRoundComputing_s : std_logic;
	signal enableCounter_s : std_logic;
	signal enableOutput_s : std_logic;
	signal getciphertext_s : std_logic;
	signal resetCounter_s : std_logic;
	signal aes_done_s : std_logic;
	signal round_s : bit4;
begin

	FSM : FSM_invAES_comp port map (
		clock_i		=> clock_i,
		resetb_i	=> resetb_i,
		start_i		=> start_i,
		round_i		=> round_s,
		done_o					=> aes_done_s,
		enableCounter_o			=> enableCounter_s,
		enableMixColumns_o		=> enableInvMixColumns_s,
		enableOutput_o			=> enableOutput_s,
		enableRoundcomputing_o	=> enableRoundComputing_s,
		getciphertext_o			=> getciphertext_s,
		resetCounter_o			=> resetCounter_s
	);
	
	IAR : InvAESRound_comp port map (
		currenttext_i 			=> data_i,
		currentkey_i 			=> currentkey_s,
		clock_i 				=> clock_i,
		enableInvMixColumns_i 	=> enableInvMixColumns_s,
		enableRoundComputing_i 	=> enableRoundComputing_s,
		resetb_i 				=> resetb_i,
		data_o 					=> data_s
	);
		
	CTR : Counter_comp port map (
		reset_i  => resetb_i,
		enable_i => enableCounter_s,
		clock_i  => clock_i,
		init_i	 => resetCounter_s,
		count_o  => round_s
	);
	
	KET : KeyExpansion_table_comp port map (
		round_i         => round_s,
        expansion_key_o => currentkey_s
	);

	aes_done_o <= aes_done_s;

	-- Process pour garder le message décrypté en sortie
	P0: process(clock_i, aes_done_s, enableOutput_s)
	begin
		if (clock_i'event and clock_i = '1') then
			if(aes_done_s = '1') then 
				data_output <= data_s;
			end if;
			if(enableOutput_s = '1') then 
				data_o <= data_output;
			end if;
		end if;
	end	process P0;
end architecture InvAES_arch;
