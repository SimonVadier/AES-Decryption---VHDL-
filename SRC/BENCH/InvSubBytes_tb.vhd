-- Simon VADIER
-- InvSubBytes_tb.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvSubBytes_tb is
end entity InvSubBytes_tb;

architecture InvSubBytes_tb_arch of InvSubBytes_tb is

  component InvSubBytes
	port(	data_i : in type_state;
			data_o : out type_state);
  end component;
  
  signal data_i_s	:	type_state;
  signal data_o_s	:	type_state;
  
begin
  DUT : InvSubBytes port map (
      data_i  => data_i_s,
      data_o => data_o_s
	);

	data_i_s <= ((x"6b",x"88",x"a6",x"db"),
                 (x"19",x"14",x"2d",x"87"),
                 (x"77",x"a2",x"25",x"06"),
                 (x"f6",x"8d",x"63",x"4f"));

end architecture InvSubBytes_tb_arch;
