library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity flasher is
  port (
    clk : in std_logic;
    led : out std_logic
  );
end flasher;

architecture flasher_arch of flasher is
  signal clk_enable : std_logic;
  signal clk_enable_counter : std_logic_vector(23 downto 0);
  signal value : std_logic;
begin
  clk_enabler: process(clk)
  begin
    if rising_edge(clk) then
      clk_enable_counter <= clk_enable_counter + 1;

      if clk_enable_counter = 0 then
        clk_enable <= '1';
      else
        clk_enable <= '0';
      end if;
    end if;
  end process;

  led_flasher: process(clk, clk_enable, value)
  begin
    led <= value;

    if rising_edge(clk) and clk_enable = '1' then
      value <= not value;
    end if;
  end process;
end flasher_arch;
