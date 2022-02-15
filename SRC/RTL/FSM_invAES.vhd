-- Simon VADIER
-- FSM_invAES.vhd
-- creation : 07/02/2022
-- modification : 10/02/2022
-- Machine d'etat
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

library LIB_RTL;
library LIB_AES;
use LIB_AES.state_definition_package.all;

entity FSM_invAES is
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

end FSM_invAES;

architecture FSM_invAES_arch_Moore of FSM_invAES is

	type state is (state0, state9to1, state10, state_reset, state_attente, state_done);
	signal state_present_s, state_futur_s : state;
	
begin
	seq0 : process(clock_i, resetb_i)
	begin
		if (resetb_i = '1') then
			state_present_s <= state_reset;
		elsif (clock_i'event and clock_i='1') then
			state_present_s <= state_futur_s;
		end if;
	end process seq0;
	
	comb0 : process(state_present_s, start_i, round_i)
	begin
		case state_present_s is 
			when state0 =>
				state_futur_s <= state_done;
			when state9to1 =>
				if (round_i = X"1") then 
					state_futur_s <= state0;
				else
					state_futur_s <= state9to1;
				end if;
			when state10 =>
				if (round_i = X"A") then 
					state_futur_s <= state9to1;
				else
					state_futur_s <= state10;
				end if;
			when state_reset =>
				state_futur_s <= state_attente;
			when state_attente =>
				if (start_i = '1') then 
					state_futur_s <= state10;
				else
					state_futur_s <= state_attente;
				end if;
			when state_done =>
				state_futur_s <= state_attente;
		end case;
	end process comb0;
	
	comb1 : process(state_present_s)
	begin
		case state_present_s is
			when state0 =>
				done_o					<= '0';
				enableCounter_o			<= '0';
				enableMixColumns_o		<= '0';
				enableOutput_o			<= '0';
				enableRoundcomputing_o	<= '0';
				getciphertext_o			<= '0';
				resetCounter_o			<= '0';
			when state9to1 =>
				done_o					<= '0';
				enableCounter_o			<= '1';
				enableMixColumns_o		<= '1';
				enableOutput_o			<= '0';
				enableRoundcomputing_o	<= '0';
				getciphertext_o			<= '0';
				resetCounter_o			<= '0';
			when state10 =>
				done_o					<= '0';
				enableCounter_o			<= '1';
				enableMixColumns_o		<= '0';
				enableOutput_o			<= '0';
				enableRoundcomputing_o	<= '1';
				getciphertext_o			<= '1';
				resetCounter_o			<= '0';
			when state_reset =>
				done_o					<= '0';
				enableCounter_o			<= '0';
				enableMixColumns_o		<= '0';
				enableOutput_o			<= '0';
				enableRoundcomputing_o	<= '1';
				getciphertext_o			<= '0';
				resetCounter_o			<= '1';
			when state_attente =>
				done_o					<= '0';
				enableCounter_o			<= '0';
				enableMixColumns_o		<= '0';
				enableOutput_o			<= '1';
				enableRoundcomputing_o	<= '1';
				getciphertext_o			<= '1';
				resetCounter_o			<= '1';
			when state_done =>
				done_o					<= '1';
				enableCounter_o			<= '0';
				enableMixColumns_o		<= '0';
				enableOutput_o			<= '1';
				enableRoundcomputing_o	<= '1';
				getciphertext_o			<= '1';
				resetCounter_o			<= '1';
		end case;
	end process comb1;

end architecture FSM_invAES_arch_Moore;
