library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_devider is
    port (
        clk_in: in std_logic;
        rst: in std_logic;
        clk_out: out std_logic
    );
end clk_devider; 

architecture arch of clk_devider is

    constant div_factor: integer := 49999999;

    signal out_s: std_logic;
    signal counter: integer range 0 to div_factor := 0;
begin

    clk_out <= out_s;

    clk_devider: process(clk_in) begin
        if rising_edge(clk_in) then
            if rst = '0' then
                counter <= 0;
                out_s <= '0';
            elsif(counter = div_factor) then
                out_s <= not(out_s);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process clk_devider;

end architecture;