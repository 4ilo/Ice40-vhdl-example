library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity counter is
    port (
        clk: in std_logic;
        up: in std_logic;
        rst: in std_logic;
        count_out: out std_logic_vector(3 downto 0)
    );
end counter ; 

architecture behav of counter is

    signal pres_count, next_count: std_logic_vector(3 downto 0);

begin

    count_out <= pres_count;

    sync_count: process(clk)
    begin
        if(rising_edge(clk)) then
            if(rst = '0') then
                pres_count <= (others => '0');
            else
                pres_count <= next_count;
            end if;    
        end if;
    end process sync_count;

    com_count: process(pres_count, up)
    begin
        if(up = '1') then
            next_count <= pres_count + "0001";
        else
            next_count <= pres_count;
        end if;
    end process com_count;

end architecture;