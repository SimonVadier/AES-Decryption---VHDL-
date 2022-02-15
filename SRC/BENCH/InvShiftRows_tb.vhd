-- Simon VADIER
-- InvShiftRows_tb.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

library LIB_RTL;

entity InvShiftRows_tb is
end entity InvShiftRows_tb;

architecture InvShiftRows_tb_arch of InvShiftRows_tb is

  component InvShiftRows
    port(data_i  : in  type_state;
         data_o : out  type_state);
  end component;
  
  signal data_i_s  : type_state;
  signal data_o_s : type_state;

begin

  DUT : InvShiftRows port map (
      data_i  => data_i_s,
      data_o => data_o_s
	);
      
    data_i_s <= ((x"6b",x"88",x"a6",x"db"),
                (x"14",x"2d",x"87",x"19"),
                (x"25",x"06",x"77",x"a2"),
                (x"4f",x"f6",x"8d",x"63"));

end architecture InvShiftRows_tb_arch;
