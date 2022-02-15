-- Simon VADIER
-- InvAESRound.vhd
-- creation : 07/02/2022
-- modification : 09/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
use LIB_RTL.utility_package.all;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvAESRound is
port(
	currenttext_i 			: in bit128;
	currentkey_i 			: in bit128;
	clock_i 				: in std_logic;
	enableInvMixColumns_i 	: in std_logic;
	enableRoundComputing_i 	: in std_logic;
	resetb_i 				: in std_logic;
	
	data_o 					: out bit128);

end InvAESRound;

architecture InvAESRound_arch of InvAESRound is
	component AddRoundKey_comp
		port(	
			data_i : in type_state;
			round_key_i : in type_state;
			data_o : out type_state);
	end component;
	
	component InvShiftRows_comp
		port(	
			data_i : in type_state;
			data_o : out type_state);
	end component;
	
	component InvSubBytes_comp
		port(	
			data_i : in type_state;
			data_o : out type_state);
	end component;
	
	component InvMixColumns_comp
		port (
			data_i : in type_state;
			data_o : out type_state);
	end component;
	
	component Registre_comp
		port (
		data_i 			: in bit128;
		enableOutput_i	: in std_logic;
		clock_i			: in std_logic;
		resetb_i		: in std_logic;
		data_o 			: out bit128);
	end component;
	
	component Multiplexeur_comp
		port (
			I0_i			: in type_state;
			I1_i			: in type_state;
			getciphertext_i : in std_logic;
			data_o 			: out type_state);
	end component;
	
	signal currenttext_s : type_state;
	signal currentkey_i_s : type_state;
	signal data_s : bit128;
	
	signal AddRoundKey_i_s : type_state;
	signal ShiftRows_i_s : type_state;
	signal SubBytes_i_s : type_state;
	signal MixColumns_i_s : type_state;
	signal Registre_i_s: type_state;
	
	signal AddRoundKey_o_s : type_state;
	signal ShiftRows_o_s : type_state;
	signal SubBytes_o_s : type_state;
	signal MixColumns_o_s : type_state;
	signal Registre_o_s: type_state;
	
begin
	 --conversion du bits128 en type state
	currentkey_i_s <= vector_to_type_state(currentkey_i);
	M0: Multiplexeur_comp port map(
		I0_i 			=> vector_to_type_state(data_s),
		I1_i 			=> vector_to_type_state(currenttext_i),
		getciphertext_i => enableRoundComputing_i,
		data_o 			=> ShiftRows_i_s
	);
	
	-- Port map de tous les blocs 
	ISR : InvShiftRows_comp port map (
        data_i => ShiftRows_i_s,
        data_o => ShiftRows_o_s
	);
	
	-- On echaine toujours ShiftRows et SubBytes
	SubBytes_i_s <= ShiftRows_o_s; 
	
    ISB : InvSubBytes_comp port map (
        data_i => SubBytes_i_s,
        data_o => SubBytes_o_s
	);
	
	-- On verifie si on est dans la première bloucle
	M1: Multiplexeur_comp port map(
		I0_i 			=> SubBytes_o_s,
		I1_i 			=> ShiftRows_i_s, -- Texte en entrée de InvAESRound
		getciphertext_i => enableRoundComputing_i,
		data_o 			=> AddRoundKey_i_s
	);

	ADK : AddRoundKey_comp port map (
        data_i      => AddRoundKey_i_s,
        data_o      => AddRoundKey_o_s,
        round_key_i => currentkey_i_s
	);
		
	MixColumns_i_s <= AddRoundKey_o_s;
	
	IMC : InvMixColumns_comp
      port map (
        data_i   => MixColumns_i_s,
        data_o   => MixColumns_o_s);
	
	-- On vérifie si on effectue ou non MixColumns
	M2: Multiplexeur_comp port map(
		I0_i 			=> AddRoundKey_o_s,
		I1_i 			=> MixColumns_o_s,
		getciphertext_i => enableInvMixColumns_i,
		data_o 			=> currenttext_s
	);
	
	R0 : Registre_comp port map (
		data_i 			=> type_state_to_vector(currenttext_s),
		enableOutput_i	=> '1',
		clock_i			=> clock_i,
		resetb_i		=> resetb_i,
		data_o 			=> data_s
	);
	
	data_o <= data_s;
	
end architecture InvAESRound_arch;
	
