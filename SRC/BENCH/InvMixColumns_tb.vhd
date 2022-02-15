-- Simon VADIER
-- InvMixColumns_tb.vhd
-- creation : 05/01/2021
-- modification : 05/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvMixColumns_tb is
end entity InvMixColumns_tb;

architecture InvMixColumns_tb_arch of InvMixColumns_tb is

  component InvMixColumns
	  port( data_i : in type_state;
			data_o : out type_state);
  end component;
  
  signal data_i_s	:	type_state;
  signal data_o_s	:	type_state;
  
begin
  DUT : InvMixColumns
    port map (
      data_i => data_i_s,
      data_o => data_o_s);

	data_i_s <= ((x"20",x"2e",x"ce",x"f8"),
                 (x"d0",x"01",x"10",x"58"),
                 (x"8a",x"4d",x"ae",x"5a"),
                 (x"b4",x"bc",x"29",x"a0"));

end architecture InvMixColumns_tb_arch;

