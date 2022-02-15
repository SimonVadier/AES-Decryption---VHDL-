-- Simon VADIER
-- Multiplexeur.vhd
-- creation : 07/02/2022
-- modification : 09/02/2022

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity Multiplexeur is
port(
	I0_i			: in type_state;
	I1_i			: in type_state;
	getciphertext_i : in std_logic;
	data_o 			: out type_state);

end Multiplexeur;

architecture Multiplexeur_arch of Multiplexeur is
begin
	data_o <= I0_i when getciphertext_i = '0' else I1_i;
end architecture Multiplexeur_arch;
