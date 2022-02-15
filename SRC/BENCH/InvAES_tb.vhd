-- Simon VADIER
-- InvAES_tb.vhd
-- creation : 07/02/2022
-- modification : 10/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;
library LIB_RTL;
use LIB_RTL.utility_package.all;

entity InvAES_tb is
end entity InvAES_tb;

architecture InvAES_tb_arch of InvAES_tb is

  component InvAES
	  port( clock_i		: in std_logic;
			resetb_i	: in std_logic;
			start_i		: in std_logic;
			data_i		: in bit128;
			
			data_o		: out bit128;
			aes_done_o	: out std_logic
	);
  end component;
  
  signal data_i_s		: bit128;
  signal data_o_s 		: bit128;
  signal clock_s 		: std_logic := '1';
  signal resetb_s 		: std_logic;
  signal start_s 		: std_logic;
  signal aes_done_o_s	: std_logic;
  
begin
  DUT : InvAES
    port map (
		clock_i 	=> clock_s,
		resetb_i	=> resetb_s,
		start_i 	=> start_s,
		data_i 		=> data_i_s,
		data_o 		=> data_o_s,
		aes_done_o 	=> aes_done_o_s
	  );

	P0 : process
	begin
		clock_s <= '0';
		wait for 10 ns;
		clock_s <= '1';
		wait for 10 ns;
	end process P0;

	resetb_s <= '1' after 10 ns, '0' after 20 ns, 
				'1' after 360 ns, '0' after 370 ns;
	start_s <= '0', '1' after 20 ns, '0' after 60 ns,
					'1' after 370 ns, '0' after 420 ns ;
	data_i_s <= X"8c11354406ad4488decaec83aa034306", 
				X"8c11354406ad4488decaec83aa034306" after 370 ns;
	
end architecture InvAES_tb_arch;
