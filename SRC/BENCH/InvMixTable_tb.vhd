-- Simon VADIER
-- InvMixTable_tb.vhd
-- creation : 05/01/2021
-- modification : 05/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;
-- library source;
-- use source.all;

entity InvMixTable_tb is
end entity InvMixTable_tb;

architecture InvMixTable_tb_arch of InvMixTable_tb is

  component InvMixTable
	port( 	column_i : in column_state;
			column_o : out column_state);
  end component;
  
  signal column_i_s : column_state;
  signal column_o_s : column_state;
  
begin
  DUT : InvMixTable
    port map (
      column_i => column_i_s,
      column_o => column_o_s);

	P0 : process
		begin
		    column_i_s <= (X"8e", X"4d", X"a1", X"bc");
		    wait for 10 ns;
		    column_i_s <= (X"9f", X"dc", X"58", X"9d");
		    wait for 10 ns;
		    column_i_s <= (X"01", X"01", X"01", X"01");
		    wait for 10 ns;
		    column_i_s <= (X"c6", X"c6", X"c6", X"c6");
		    wait for 10 ns;
		    column_i_s <= (X"d5", X"d5", X"d7", X"d6");
		    wait for 10 ns;
		    column_i_s <= (X"4d", X"7e", X"bd", X"f8");
            wait for 10 ns;
	end process p0;
	
end architecture InvMixTable_tb_arch;
