-- Simon VADIER
-- InvAESRound_conf.vhd
-- creation : 07/02/2022
-- modification : 09/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
use LIB_RTL.utility_package.all;
library LIB_AES;
use LIB_AES.state_definition_package.all;

configuration InvAESRound_conf of InvAESRound is
  for InvAESRound_arch
    for ISR : InvShiftRows_comp
      use entity LIB_RTL.InvShiftRows(InvShiftRows_arch);
    end for;
    for ISB : InvSubBytes_comp
      use configuration LIB_RTL.InvSubBytes_conf;
    end for;
    for ADK : AddRoundKey_comp
      use entity LIB_RTL.AddRoundKey(AddRoundKey_arch);
    end for;
    for IMC : InvMixColumns_comp
      use configuration LIB_RTL.InvMixColumns_conf;
    end for;
	for M0 : Multiplexeur_comp
      use entity LIB_RTL.Multiplexeur(Multiplexeur_arch);
    end for;
	for M1 : Multiplexeur_comp
      use entity LIB_RTL.Multiplexeur(Multiplexeur_arch);
    end for;
	for M2 : Multiplexeur_comp
      use entity LIB_RTL.Multiplexeur(Multiplexeur_arch);
    end for;
	for R0 : Registre_comp
      use entity LIB_RTL.Registre(Registre_arch);
    end for;
  end for;
end configuration InvAESRound_conf;
