-- Simon VADIER
-- AddRoundKey_tb.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity AddRoundKey_tb is
end entity AddRoundKey_tb;

architecture AddRoundKey_tb_arch of AddRoundKey_tb is

  component AddRoundKey
	port(	data_i : in type_state;
			data_o : out type_state;
			round_key_i : in type_state);
  end component;
  
  signal data_i_s  : type_state;
  signal data_o_s : type_state;
  signal round_key_s  : type_state;
  
begin
  DUT : AddRoundKey
    port map (
      data_i  => data_i_s,
      data_o => data_o_s,
      round_key_i => round_key_s);

	data_i_s <= 	((x"04",x"e0",x"48",x"28"),
				 (x"66",x"cb",x"f8",x"06"),
				 (x"81",x"19",x"d3",x"26"),
				 (x"e5",x"9a",x"7a",x"4c"));
				
	round_key_s <= ((x"a0",x"88",x"23",x"2a"),
				   (x"fa",x"54",x"a3",x"6c"),
				   (x"fe",x"2c",x"39",x"76"),
				   (x"17",x"b1",x"39",x"05"));

end architecture AddRoundKey_tb_arch;
