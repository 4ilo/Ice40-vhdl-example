library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity count_test is
    port (
        clk: in std_logic;
        up: in std_logic;
        rst: in std_logic;
        count: out std_logic_vector(3 downto 0)
    );
end count_test; 

architecture arch of count_test is

    signal clk_10: std_logic;
    signal up_b: std_logic;

    component clk_devider is
        port (
            clk_in: in std_logic;
            rst: in std_logic;
            clk_out: out std_logic
        );
    end component;

    component counter is
        port (
            clk: in std_logic;
            up: in std_logic;
            rst: in std_logic;
            count_out: out std_logic_vector(3 downto 0)
        );
    end component ; 

begin

    up_b <= not up;

clk_dev: clk_devider port map(
    clk_in => clk,
    rst => rst,
    clk_out => clk_10
);

counter_comp: counter port map(
    clk => clk_10,
    rst => rst,
    up => up_b,
    count_out => count
);

end architecture ;