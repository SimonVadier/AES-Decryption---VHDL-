library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library LIB_AES;
use LIB_AES.state_definition_package.all;

entity Counter_tb is
end entity Counter_tb;

architecture Counter_tb_arch of Counter_tb is
  component Counter
    port(reset_i  : in  std_logic;
         enable_i : in  std_logic;
         clock_i  : in  std_logic;
		 init_i	: in  std_logic;
         count_o  : out bit4);
  end component;
  signal reset_s  : std_logic;
  signal enable_s : std_logic;
  signal clock_s  : std_logic;
  signal init_s  : std_logic;
  signal count_s  : bit4;
begin
  DUT : Counter
    port map (
      reset_i  => reset_s,
      enable_i => enable_s,
      clock_i  => clock_s,
	  init_i   => init_s,
      count_o  => count_s);

  P0 : process
  begin
    reset_s <= '0';
    wait for 10 ns;
    reset_s <= '1';
	wait for 10 ns;
    reset_s <= '0';
    wait;
  end process P0;

  P1 : process
  begin
    enable_s <= '1';
    wait for 10 ns;
    enable_s <= '0';
    wait for 20 ns;
    enable_s <= '1';
	wait for 250 ns;
    enable_s <= '1';
    wait;
  end process P1;

  P2 : process
  begin
    clock_s <= '0';
    wait for 10 ns;
    clock_s <= '1';
    wait for 10 ns;
  end process P2;
 
  P3 : process
  begin
    init_s <= '0';
    wait for 10 ns;
    init_s <= '1';
	wait for 20 ns;
    init_s <= '0';
	wait for 250 ns;
    init_s <= '0';
    wait;
  end process P3;


end architecture Counter_tb_arch;



