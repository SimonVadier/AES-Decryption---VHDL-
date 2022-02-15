-- Simon VADIER
-- FSM_invAES_tb.vhd
-- creation : 07/02/2022
-- modification : 10/02/2022

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity FSM_invAES_tb is
end entity FSM_invAES_tb;

architecture FSM_invAES_tb_arch of FSM_invAES_tb is

  component FSM_invAES
	port(
	clock_i		: in std_logic;
	resetb_i	: in std_logic;
	start_i		: in std_logic;
	round_i		: in bit4;
	
	done_o					: out std_logic;
	enableCounter_o			: out std_logic;
	enableMixColumns_o		: out std_logic;
	enableOutput_o			: out std_logic;
	enableRoundcomputing_o	: out std_logic;
	getciphertext_o			: out std_logic;
	resetCounter_o			: out std_logic);
  end component;
  
	signal clock_s	: std_logic := '1';
	signal resetb_s	: std_logic;
	signal start_s	: std_logic;
	signal round_s	: bit4;
	
	signal done_s					: std_logic;
	signal enableCounter_s			: std_logic;
	signal enableMixColumns_s		: std_logic;
	signal enableOutput_s			: std_logic;
	signal enableRoundcomputing_s	: std_logic;
	signal getciphertext_s			: std_logic;
	signal resetCounter_s			: std_logic;

begin
  DUT : FSM_invAES port map (
	clock_i		=> clock_s,
	resetb_i	=> resetb_s,
	start_i		=> start_s,
	round_i		=> round_s,
	
	done_o					=> done_s,
	enableCounter_o			=> enableCounter_s,
	enableMixColumns_o		=> enableMixColumns_s,
	enableOutput_o			=> enableOutput_s,
	enableRoundcomputing_o	=> enableRoundcomputing_s,
	getciphertext_o			=> getciphertext_s,
	resetCounter_o			=> resetCounter_s
	);
	
	P0 : process
		begin
			for i in 0 to 50 loop
				clock_s <= not(clock_s);
				wait for 10 ns; 
			end loop;
	end process P0;
	
	resetb_s <= '1' after 10 ns, '0' after 20 ns;
	start_s <= '0', '1' after 20 ns;
	round_s <=	X"A" after 70 ns,
				X"9" after 90 ns,
				X"8" after 110 ns,
				X"7" after 130 ns,
				X"6" after 150 ns,
				X"5" after 170 ns,
				X"4" after 190 ns,
				X"3" after 210 ns,
				X"2" after 230 ns,
				X"1" after 250 ns,
				X"0" after 270 ns;

end architecture FSM_invAES_tb_arch;
