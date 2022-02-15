-- Simon VADIER
-- InvSBox_tb.vhd
-- creation : 05/12/2021
-- modification : 05/12/2021

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity InvSBox_tb is
end entity InvSBox_tb;

architecture InvSBox_tb_arch of InvSBox_tb is

  component InvSBox
	port(	data_i : in bit8;
			data_o : out bit8);
  end component;
  
  signal data_i_s  : bit8;
  signal data_o_s : bit8;
  
begin
  DUT : InvSBox
    port map (
      data_i => data_i_s,
      data_o => data_o_s);

	P0 : process
		begin
			for i in 0 to 255 loop
				data_i_s <= std_logic_vector(to_unsigned(i,8) );
				wait for 10 ns; 
			end loop;
	end process P0;



end architecture InvSBox_tb_arch;
